% Linear interpolation function
function max_range = linear_interp_max_range(pl, d, target)
    % Find the two nearest data points
    [~, idx] = min(abs(pl - target));
    idx1 = idx - 1;
    idx2 = idx;
    
    % Linear interpolation
    max_range = d(idx1) + (d(idx2) - d(idx1)) * (target - pl(idx1)) / (pl(idx2) - pl(idx1));
end
