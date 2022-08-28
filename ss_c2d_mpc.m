%3つの軸について状態空間表現、連続状態から離散化させるためのプログラム

%状態空間モデルの作成
ss_e = ss();%elevetion
ss_t = ss();%travel
ss_p = ss();%pitch

%連続2離散
plant_e = c2d(ss_e,ts);
plant_t = c2d(ss_t,ts);
plant_p = c2d(ss_p,ts);

%計測される外乱(md)の追加
sys_e = rss(2,2,3);
sys_e.D = [0 0 0;0 0 0];
sys_e.A = A_elev;
sys_e.B = [B_elev,X1_elev];
sys_e.C = [1 0;0 1];

sys_t = rss(2,2,3);
sys_t.D = [0 0 0;0 0 0];
sys_t.A = A_travel;
sys_t.B = [B_travel,X1_travel];
sys_t.C = C_travel;

setp_e = setmpcsignals(sys_e,'MV',[1 2],'MD',3);
setp_t = setmpcsignals(sys_t,'MV',[1 2],'MD',3);

% mpc_object

%mpc_object elevetion
mpc_e = mpc(setp_e,ts_e);
%horizon
mpc_e.PredictionHorizon = 15;
mpc_e.ControlHorizon = 5;
%nominal
mpc_e.Model.Nominal.U = [0;0;0];
mpc_e.Model.Nominal.Y = [elev_min;0];
%limit
%u_sum_limit
mpc_e.MV(1).Min = u_sum_min;
mpc_e.MV(1).Max = u_sum_max;
%u_diff_limit
mpc_e.MV(2).Min = u_diff_min;
mpc_e.MV(2).Max = u_diff_max;
%elevation limit
mpcelev.OV(1).Min = elev_min;
mpcelev.OV(1).Max = elev_max;

%mpc_object travel
mpc_t = mpc(setp_t,ts_t);
%horizon
mpc_t.PredictionHorizon = 80;
mpc_t.ControlHorizon = 4;
%nominal
mpc_t.Model,Nominal.U = [0;0;0];
mpc_t.Model,Nominal.Y = [0;0];
%limit
mpc_t.MV(1).Min = pitch_min;
mpc_t.MV(1).Max = pitch_max;

%mpc_object pitch  (sampling rate is equal to travel axis)
mpc_p = mpc(plant_p,ts_t);
%horizon
mpc_p.PredictionHorizon = 80;
mpc_p.ControlHorizon = 4;
%nominal
mpc_p.Model.Nominal.U = [0;0;0];
mpc_p.Model.Nominal.Y = [0;0];
%limit
%u_sum limits
mpc_p.MV(1).Min = u_sum_min;
mpc_p.MV(1).Max = u_sum_max;
%u_diff limits
mpc_p.MV(2).Min = u_diff_min;
mpc_p.MV(2).Max = u_diff_max;
%pitch limits
mpc_p.OV(1).Min = pitch_min;
mpc_p.OV(1).Max = pitch_max;

