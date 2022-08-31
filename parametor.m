%各種パラメータの設定ファイル

A_p = [0 1;0 0];%pitch theta
A_e = [0 1;-1.283 -0.11];%elevation fai
A_t = [0 1;0 -0.0247];%travel psi

B_p = [0 0;0 0.248];
B_e = [0 0;0.655 0];
B_t = [0 0;0.00866 0];

C_p = [1 0;0 1];
C_e = [1 0;0 1];
C_t = [1 0;0 1];

D_p = [0 0;0 0];
D_e = [0 0;0 0];
D_t = [0 0;0 0];


elev_max
elev_min
end_time
filename
pitch_max
pitch_min
t
ts
ts_elev
ts_travel
u_diff_max
u_diff_min
u_sum_max
u_sum_min
X1_elev
X1_travel
X3_target_angle
X3_target_angle
