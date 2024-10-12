% ===================Abdelrahman Matarawy===================%
% ========================Section 5=========================%
function [maximum_Distance] = MaxRange(Pt_dBm,Pr_dBm, Gt_dBi, Gr_dBi, f, L, n)

% to calc Lamda (speed of light in air / Frequency)
Lamda = (3*10^8) / f;
%to Calc Recieved Power
PL_dB = Pt_dBm + Gt_dBi + Gr_dBi - Pr_dBm;
%to calc Free space Path Loss
maximum_Distance =10^ ((20*log10(4*pi) - 20*log10(Lamda) - PL_dB  + 10*log10(L)) / (10*n));

end