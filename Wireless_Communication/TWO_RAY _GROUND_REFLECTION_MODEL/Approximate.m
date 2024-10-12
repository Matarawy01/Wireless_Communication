% ===================Abdelrahman Matarawy===================%
% ========================Section 5=========================%
function [Aproximate_Power] = Approximate(Pt, Glos, Gref, Ht, Hr, f)
Lamda = (3*10^8) / f;
% critical distance
dc = (4*Ht*Hr)/Lamda;
% At d <= Ht
d1 = [0.1 : 1 : Ht];
% At Ht < d <= dc
d2 = [Ht + 0.0001 : 1 : dc];
% At d > dc
d3 = [dc + 0.0001 : 1 : 10^5];
% Constant Factor
K = (Glos * Gref * (Lamda^2)) / ((4 * pi)^2);
K1 = (Glos * Gref * (Ht^2) * (Hr^2));
% Approximate Power Received
Pr1 = (Pt * K) ./ ((d1 .^ 2) + (Ht ^2));
Pr2 = (Pt * K) ./ ((d2 .^ 2));
Pr3 = (Pt * K1) ./ (d3 .^ 4);
Aproximate_Power = [Pr1  Pr2  Pr3];
end




