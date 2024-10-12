function [s, ecc] = ECC(ii, jj, x_limits, y_limits, color, Plot)
format long;

% ~~~~~~~~~~~~~~~ Load S parameters ~~~~~~~~~~~~~~~ %
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
Sii = sii(:, 2) + ii * sii(:, 3);
Sij = sij(:, 2) + ii * sij(:, 3);
Sjj = sjj(:, 2) + ii * sjj(:, 3);
Sji = sji(:, 2) + ii * sji(:, 3);

% Conjugate of matrices Sii and Sji
sii_c = conj(Sii); % Sii conjugate
sji_c = conj(Sji); % Sji conjugate

% Calculating absolute squares
Sii_Abs_Sqr = ((abs(Sii)).^2);
Sij_Abs_Sqr = ((abs(Sij)).^2);
Sjj_Abs_Sqr = ((abs(Sjj)).^2);
Sji_Abs_Sqr = ((abs(Sji)).^2);

% Calculating formulas
formulUp1 = (sii_c.*(Sij));
formulUp2 = (sji_c.*(Sjj));
formulUp = formulUp1 + formulUp2;
formulUpAbs = abs(formulUp);
formulUpAbsSqr = formulUpAbs.^2;

formulDown1 = (1-(Sii_Abs_Sqr)-(Sji_Abs_Sqr));
formulDown2 = (1-(Sjj_Abs_Sqr)-(Sij_Abs_Sqr));
formulDown = formulDown1 .* formulDown2;

p = formulUpAbsSqr ./ formulDown;
x = sii(:, 1); % Assuming the first column as x-axis data

if strcmp(Plot, 'yes')
    % Plot the results
    plot(x, p, color); % Use appropriate x-axis data
    xlim(x_limits); % Set the X-axis limits
    ylim(y_limits); % Set the Y-axis limits

    % Set grid and legend
    grid on;

    % Add titles and labels
    title('ECC Plots');
    xlabel('Frequency (GHz)'); % Adjust label as needed
    ylabel(sprintf('ECC 1,%d', jj)); % Use sprintf to include the variable
elseif strcmp(Plot, 'no')
    s = sii;
    ecc = p;
end
