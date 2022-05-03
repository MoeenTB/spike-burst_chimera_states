function out = Zp(st, delta) % Better to give delta as an arg.
% Spatial Coherence
%     delta = 5;
    phase = zeros(size(st));
    for i = 1:size(st,1)
        spikes = find(st(i, :) == 1);
%         disp(spikes)
        % Should try vectorizing this process.
        for t = spikes(1):spikes(end)-1
%             tm = max(spikes(spikes < t));
            t_before = spikes(find(spikes <= t, 1, 'last'));
            t_after = spikes(find(spikes > t, 1, 'first'));
%             if (t<spikes(1)+4)
%                 disp('t')
%                 disp(t)
%                 disp('t_before')
%                 disp(t_before)
%                 disp('t_after')
%                 disp(t_after)
%             end
            % Idk if I should include the t == t_{m+1} or not.
            % Also, should the phase be zero before the first spike and
            % after the last spike?
            phase(i, t) = 2*pi*(t - t_before)/(t_after - t_before);
        end
    end
    X = exp(1i*phase);
    X(isnan(X)) = 0;
    G = connectivity_matrix(size(st, 1), delta) + eye(size(st, 1));
    out = 1/(2*delta+1)*abs(G*X);
%     out = out(not(isnan(out)));
end

