function params =  LSFD(recorded_data,frequency_samples,T_f,steady_state_val)
%% Basic Setup
time = recorded_data.time;
resp = recorded_data.data;
resp_trans = resp - steady_state_val;
A = 1;
G_arr = zeros(frequency_samples,1);
W_arr = zeros(frequency_samples,1);
phase_lag_arr = zeros(frequency_samples,1);
G_0= get_freq_resp(resp,time, 0, steady_state_val,T_f,A)  
phi_0 = -angle(G_0);

W_arr(1) = 10^-3;
G_arr(1) = get_freq_resp(resp,time, W_arr(1), steady_state_val,T_f,A)
phase_lag_arr(1) = angle(G_arr(1));
W_arr(2) = W_arr(1) - (pi/(frequency_samples-1) + phase_lag_arr(1))* (W_arr(1))/(phase_lag_arr(1));
G_arr(2) = get_freq_resp(resp,time, W_arr(2), steady_state_val,T_f,A);
phase_lag_arr(2) = angle(G_arr(2));

for index = (2:frequency_samples-1)
    W_arr(index+1) = get_new_omega(frequency_samples,phase_lag_arr(index),phase_lag_arr(index -1),W_arr(index), W_arr(index-1),index);
    G_arr(index+1) = get_freq_resp(resp,time, W_arr(index+1), steady_state_val,T_f,A);
    phase_lag_arr(index+1) = angle(G_arr(index+1));
end


phi_arr = ones(frequency_samples,2);

mag_arr = zeros(frequency_samples,1);
tan_arr = zeros(frequency_samples,1);
for index = (1:frequency_samples)
    W = W_arr(index);
    G = G_arr(index);
    phi = phase_lag_arr(index);
    
    phi_arr(index,1) = -1 * W^2 * abs(G)^2;
    mag_arr(index) = abs(G)^2;
    
end
theta = inv(phi_arr.'*phi_arr)*phi_arr.'*mag_arr;

params.tau = theta(1)^0.5;
params.K = theta(2)^0.5;
for index = (1:frequency_samples)
    phi = phase_lag_arr(index);
    W = W_arr(index);
    tan_arr(index) = - atan(params.tau*W) - phi;
    
end
params.L = inv(W_arr.' * W_arr)* W_arr.'*tan_arr;

W_arr
phase_lag_arr



end