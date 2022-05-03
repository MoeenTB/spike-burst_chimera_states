function out = CV(st)
    out = nan(size(st, 1), 1);
    for i = 1:size(st,1)
        ISI = diff(find(st(i, :) == 1));
        out(i) = std(ISI)/mean(ISI);
    end
end

