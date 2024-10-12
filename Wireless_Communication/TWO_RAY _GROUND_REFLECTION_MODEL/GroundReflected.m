% ===================Abdelrahman Matarawy===================%
% ========================Section 5=========================%
function [Pr_dBm] = GroundReflected(Pt, Glos, Gref, Ht, Hr, f, d)
% Distance From Tx and Rx As line of sight
Dlos = sqrt(d.^2 + (Ht - Hr)^2);
% Distance From Tx and Rx That found due to Ground Reflection
Dref = sqrt(d.^2 + (Ht + Hr)^2);
Lamda = (3*10^8) / f;
% phase difference between the LOS ray and reflected ray
Phay = (2 * pi * (Dref - Dlos)) ./ Lamda;
% Power Received 
Pr = (Pt) * ((Lamda / (4 * pi)) ^2) * ((abs((sqrt(Glos) ./ Dlos) - ((sqrt(Gref) * exp(-i *Phay))./Dref))).^2);
% Power Received In dBm
Pr_dBm = 10 * log10(Pr);
end

