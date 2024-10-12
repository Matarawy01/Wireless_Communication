% ===================Abdelrahman Matarawy===================%
% ========================Section 5=========================%
function [Pr_dBm, PL_dB] = FriisModel(Pt_dBm, Gt_dBi, Gr_dBi, f, d, L, n)

%Pt_dBm ->is Transmitted power 
%Pr_dBm ->is Recieved power
%PL_dBm ->is Free space Path Loss power
%Gt_dBi ->Gain of Transmitted antenna
%Gr_dBi ->Gain of Recieved antenna
%L ->The system losses (transmission lines and antennas) 

% to calc Lamda (speed of light in air / Frequency)
Lamda = (3*10^8) / f;
%to calc Free space Path Loss
PL_dB = 20*log10(4*pi) - 20*log10(Lamda) + 10*n*log10(d) + 10*log10(L);
%to Calc Recieved Power
Pr_dBm = Pt_dBm + Gt_dBi + Gr_dBi - PL_dB;

end

