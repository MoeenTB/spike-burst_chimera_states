function [t, w, st]= mysolv(f, tBegin, run_time, deltaT, init, G, g_ex)
    V_peak = 20e-3;
    Vr = -58;
    b = 70;
    N = size(init, 1)/3;
    
    t = tBegin:deltaT:run_time;
    w = zeros(size(init, 1), size(t, 2));
    st = zeros(size(t));

    updates = [Vr*1e-3*ones(N,1);b*1e-12*ones(N,1);g_ex*ones(N,1)];
    w(:,1) = init;

    for i = 1:size(t, 2)-1
        x = (w(1:N, i)-(V_peak-eps))==0;
        w(:, i+1) = w(:, i);
        w(x, i+1) = 0;
        st(x, i) = 1;
        x = repmat(x, [3, 1]);
        dM = f(t(i), w(:, i), G);
        w(:,i+1) = w(:, i+1) + x.*updates + deltaT*dM.*(~x);
        w(1:N, i+1) = min(w(1:N, i+1), V_peak-eps);
    end
end