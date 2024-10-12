function DG(x_limits, y_limits, color, sii, ECC)


DG_Value = 10 * sqrt(1 - abs(ECC)); 

x = sii(:, 1);

% Plot the results
plot(x, DG_Value, color); % Use appropriate x-axis data
xlim(x_limits); % Set the X-axis limits
ylim(y_limits); % Set the Y-axis limits

% Set grid and legend
grid on;

% Add titles and labels
title('DG Plots');
xlabel('Frequency (GHz)'); % Adjust label as needed
ylabel('DG Value'); % Use sprintf to include the variable
end

