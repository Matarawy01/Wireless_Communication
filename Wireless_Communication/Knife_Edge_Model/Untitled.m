% ~~~~~~~~~~~~~~~~~~~~ Abdelrahman Matarawy ~~~~~~~~~~~~~~~~~~~~ %
% ~~~~~~~~~~~~~~~~~~~~~~~~~ Section 5 ~~~~~~~~~~~~~~~~~~~~~~~~~~~ %
clear;
clc;
f = 10 ^9;
%Height of Between Obstacle and Tx 
h = 20;
%Distance Between Tx and obstacle
d1 = 10 * 10^3;
%Distance Between Rx and obstacle
d2 = 5 * 10^3;
%Diffraction Loss Value
[loss] = diffractionLoss(h, f, d1, d2)