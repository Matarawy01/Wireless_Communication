% Abdelrahman Matarawy 
% Section 5
clc;
clear;
fc=1500;% Frequency in Hz (1500 MHz)
hb=70;% Height of base station in meters
hm=1.5;% Height of mobile station in meters
d=0:1:10e2; % Distance Range
Pt = 60; % Transmit power in watts (1 kW = 30dBm)
Pr =  -100; % Receiver power in watts (-100 dBm)
c = 3e8; % Speed of light in m/s
environments = {'open', 'suburban', 'metropolitan'};

% Calculate path loss for each environment
pl_open = Okumora(fc, d, hb, hm, 'open');
pl_suburban = Okumora(fc, d, hb, hm, 'suburban');
pl_metropolitan = Okumora(fc, d, hb, hm, 'metropolitan');

semilogx(d, pl_open);

%semilogx(d, pl_suburban, '-r');
%semilogx(d, pl_metropolitan, '-g');

hold on;
hb = 100;
pl_open = Okumora(fc, d, hb, hm, 'open');
semilogx(d, pl_open);

hb = 130;
pl_open = Okumora(fc, d, hb, hm, 'open');
semilogx(d, pl_open);

hb = 160;
pl_open = Okumora(fc, d, hb, hm, 'open');
semilogx(d, pl_open);
xlabel('Distance (Km)');
ylabel('Path Loss (dB)');
title('Hata Okumura Model for Outdoor Propagation');
grid on;
legend('hb = 70', 'hb = 100', 'hb = 130', 'hb = 160');