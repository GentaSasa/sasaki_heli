clc
clearvars
close all

disp('load parameter');
load 'parameter'

disp('load ref');
ref
disp('load ss_c2d_mpc');
ss_c2d_mpc

disp('load simulink');
%open_system('heli_model')

disp('start simulink');
%sim('heli_model.slx')

