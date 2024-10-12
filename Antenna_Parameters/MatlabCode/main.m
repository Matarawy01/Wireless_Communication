clc;
clear;


% Define plot parameters ECC
%x_limits = [36 41];
%y_limits = [0 0.03];

% Define plot parameters DG
%x_limits = [36 41];
%y_limits = [9.5 10];

% Define plot parameters CCL
%x_limits = [36 41];
%y_limits = [0 1];

%[sii, ECC] = ECC(1,2,x_limits,y_limits,'k','no');
%hold on:
%ECC(1,3,x_limits,y_limits,'b','yes');

%ECC(1,4,x_limits,y_limits,'r','yes');

%DG(x_limits,y_limits,'k', sii, ECC);


%CCL(1,2,x_limits,y_limits, 'k');


% Define plot parameters MEG
x_limits = [20 50];
y_limits = [-2 2];
s_files = {'s11.txt', 's12.txt', 's13.txt', 's14.txt'};
MEG(s_files, x_limits, y_limits);



