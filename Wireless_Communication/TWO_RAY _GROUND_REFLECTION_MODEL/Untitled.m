% ===================Abdelrahman Matarawy===================%
% ========================Section 5=========================%
clc
clear
d = [0 : 0.1 : 10^5];
f = 900e6;
Pt = 1;
Glos = 1;
Gref = 1;
Ht = 50;
Hr = 2;
[Power_Reflected] = GroundReflected(Pt, Glos, Gref, Ht, Hr, f, d);
semilogx (d, Power_Reflected, 'r-o');
hold on;
xlabel('Distance (m)');
ylabel('Received Power(dBm)');