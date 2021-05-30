function freq_resp = get_freq_resp(resp,time,omega,steady_state_val,T_f, A)
end_index = find(time == T_f);
cropped_time = time(1:end_index);
cropped_trans_response = resp(1:end_index) - steady_state_val;
sin_arr = cropped_trans_response.*sin(omega*cropped_time);
cos_arr = cropped_trans_response.*cos(omega*cropped_time);

x = steady_state_val + omega*trapz(cropped_time,sin_arr);
y = j*omega*trapz(cropped_time,cos_arr);
freq_resp = (x + y)/A;
end