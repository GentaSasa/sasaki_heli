%set time (start:delta_t:end)
t_elev = (0:ts_elev:end_time);
t_travel = (0:ts_travel:end_time);

%elevation
x3_ref = zeros(length(t_elev),2);
x3_ref(:,1) = t_elev;

x3_ref(1:10,2) = elev_min;
x3 = x3_ref(:,2);

x4_ref = zeros(length(t_elev),2);
x4_ref(:,1) = t_elev;

% travel
x5_ref = zeros(length(t_travel),2);
x5_ref(:,1) = t_travel;
x5_ref(:,2) = x5_target_angle;
x5_ref(1:10,2) = 0;
x5 = x5_ref(:,2);

x6_ref = zeros(length(t_travel),2);
x6_ref(:,1) = t_travel;
one_sec = 1/ts_travel;
x6_ref(1:one_sec,2) = 0.01;

