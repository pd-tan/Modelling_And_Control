function out_FOPTD =  two_point_method(recorded_data,steady_state_val)
    %% Basic Setup
    time = recorded_data.time;
    resp = recorded_data.data;
    t_f = time(end)

    
    %% Finding A0
    Area_under = trapz(time, resp)
    Total_area = t_f*steady_state_val
    A_0 = Total_area - Area_under;
    
    %% Finding T_ar
    T_ar = A_0/ steady_state_val
    best_T_ar_index = find(abs(time-T_ar) == min(abs(time-T_ar)));
    T_ar = time(best_T_ar_index);
    
    %% Cropping data for A_1
    time_cropped = time(1:best_T_ar_index);
    resp_cropped = resp(1:best_T_ar_index);
    
    %% Integrating to find A1
    A_1 = trapz(time_cropped,resp_cropped);   

    tau = exp(1)*A_1/steady_state_val;
   K = steady_state_val;
   L = T_ar - tau;
    out_FOPTD = FOPTD_system(K,tau,L);
    