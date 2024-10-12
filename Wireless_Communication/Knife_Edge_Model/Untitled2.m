clear;
clc;
v = -5 : 1 : 20;
[G] = Knife_Edge_Model_Plot(v);
plot(v, -G)
title('Diffraction Loss With Different Values of V');
xlabel('Fresnel-Kirchhoff diffraction parameter');
ylabel('Diffraction Loss');
grid on;
