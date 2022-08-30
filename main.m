clc
clearvars
close all


load 'parameter.m'

ref
ss_c2d_mpc

open_system('heli_model.slx')
sim('heli_model.slx')

