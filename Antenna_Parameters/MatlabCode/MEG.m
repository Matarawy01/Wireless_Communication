function MEG(s_files, x_limits, y_limits)
    % Initialize variables
    num_ports = length(s_files);
    S_sum = zeros(1, num_ports);
    S_abs_sqr = zeros(1, num_ports);
    
    % Load S-parameter data and perform calculations
    x = [];
    for i = 1:num_ports
        data = load(s_files{i});
        if isempty(x)
            x = data(:,1); % Extract the first column as the x-axis data
        end
        S_sum(i) = sum(data(:,2) + data(:,3));
        S_abs_sqr(i) = sum(abs(S_sum(i)).^2);
    end
    
    % Calculate the variable 'p'
    p = 0.5 * (1 - sum(S_abs_sqr));
    
    % Plot the graph
    plot(x,p);
    
    % Set grid and legend
    grid on;

    % Add titles and labels
    title('MEG Plots');
    xlabel('Frequency (GHz)'); % Adjust label as needed
    ylabel('Mean Effective Gain (dB)'); 
    
    % Set the X-axis and Y-axis limits
    xlim(x_limits);
    ylim(y_limits);
end