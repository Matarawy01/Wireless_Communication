function CCL(ii, jj, x_limits, y_limits, color)
% Load S parameters based on jj
sii = load('s11.txt');
if jj == 2
    sij = load('s12.txt');
    sjj = load('s22.txt');
    sji = load('s21.txt');
elseif jj == 3
    sij = load('s13.txt');
    sjj = load('s33.txt');
    sji = load('s31.txt');
elseif jj == 4
    sij = load('s14.txt');
    sjj = load('s44.txt');
    sji = load('s41.txt');
else
    error('Invalid value for jj. Must be 2, 3, or 4.');
end

% Extracting relevant columns
x = sii(:, 1); % Assuming the first column as x-axis data
Sii = sii(:, 2) + 1i * sii(:, 3);
Sij = sij(:, 2) + 1i * sij(:, 3);
Sji = sji(:, 2) + 1i * sji(:, 3);
Sjj = sjj(:, 2) + 1i * sjj(:, 3);

% Conjugate of matrices Sii and Sji
sii_c = conj(Sii); % Sii conjugate
sij_c = conj(Sij); % Sij conjugate
sji_c = conj(Sji); % Sji conjugate
sjj_c = conj(Sjj); % Sjj conjugate

% Calculating absolute squares
Sii_Abs_Sqr = abs(Sii).^2;
Sij_Abs_Sqr = abs(Sij).^2;
Sjj_Abs_Sqr = abs(Sjj).^2;
Sji_Abs_Sqr = abs(Sji).^2;

% Pre-allocate the result
c = zeros(length(x), 1);

% Compute the elements of the psi_R matrix for each frequency point
for k = 1:length(x)
    PHYii = 1 - (Sii_Abs_Sqr(k) + Sij_Abs_Sqr(k));
    PHYij = -(sii_c(k) * Sij(k) + sji_c(k) * Sij(k));
    PHYji = -(sjj_c(k) * Sji(k) + sij_c(k) * Sji(k));
    PHYjj = 1 - (Sjj_Abs_Sqr(k) + Sji_Abs_Sqr(k));
    
    % Construct the psi_R matrix for the current frequency point
    psi_R = [PHYii, PHYij; PHYji, PHYjj];
    
    % Compute the cost function (loss) for the current frequency point
    c(k) = -log2(det(psi_R));
end

% Plot the results
plot(x, c, color); % Use appropriate x-axis data
xlim(x_limits); % Set the X-axis limits
ylim(y_limits); % Set the Y-axis limits

% Set grid and legend
grid on;

% Add titles and labels
title('CCL Plots');
xlabel('Frequency (GHz)'); % Adjust label as needed
ylabel(sprintf('CCL 1,%d, (Bit/s/Hz)', jj)); % Use sprintf to include the variable
end
