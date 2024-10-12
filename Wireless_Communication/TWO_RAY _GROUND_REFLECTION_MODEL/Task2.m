% ===================Abdelrahman Matarawy===================%
% ========================Section 5=========================%
clc
clear
d = [0.1 : 1 : 10^5];
f = 2.4e9;
Pt = 1;
Glos = 10^0.3; 
Gref = 10^0;
Ht = 50;
Hr = 2;
[Reflected_Power] = GroundReflected(Pt, Glos, Gref, Ht, Hr, f, d);
[Approximate_Power] = Approximate(Pt, Glos, Gref, Ht, Hr, f);
semilogx (d, Reflected_Power)
hold on;
grid on;
semilogx(d, 10*log10(Approximate_Power));
title('Two Ray Ground Approximate Propagation Model');
xlabel('Distance (m)');
ylabel('Received Power(dBm)');
