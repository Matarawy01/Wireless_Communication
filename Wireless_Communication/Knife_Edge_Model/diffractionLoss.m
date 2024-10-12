%Function Description: calculates the diffraction loss
function [G_V] = diffractionLoss(h, f, d1, d2)
%Wavelength Calculation 
Lamda = (3*10^8) / f;
%Fresnel-Kirchhoff diffraction parameter calculation
v = h * sqrt( ((1/d1) + (1/d2)) * Lamda/2);
%diffraction loss calculation
G_V = 6.9 + 20*log10( sqrt( (v-0.1)^2 + 1) + v - 0.1);
end

