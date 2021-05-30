function params =  LSTD(recorded_data,number_of_samples)
%% Basic Setup
useful_time = recorded_data.time;
useful_resp = recorded_data.data;
A = 1;

%% Intergration samples times
total_length = length(useful_time);
including_edges_number_samples = number_of_samples + 1;
cropped_length = total_length - rem(total_length,including_edges_number_samples-1);
if cropped_length > total_length
    cropped_length = cropped_length - including_edges_number_samples;
end
sample_arr = linspace(0,cropped_length,including_edges_number_samples);
sample_time = useful_time(sample_arr(2:end))
useful_resp(sample_arr(2:end))


y_arr = zeros(number_of_samples,1);
phi_arr = zeros(number_of_samples,3);

for index = 1:number_of_samples
    time = sample_time(index);
    sample = sample_arr(index+1);
    y_resp = useful_resp(sample);
    time_int = useful_time(1:sample);
    resp_int = useful_resp(1:sample);
    y_integrated = trapz(time_int,resp_int);
    y_arr(index) = y_resp;
    phi_arr(index,1) = -y_integrated;
    phi_arr(index,2) = -A;
    phi_arr(index,3) = time*A;
    
end

theta_arr = inv(phi_arr.' * phi_arr) * phi_arr.' *y_arr;

least_square_y_arr = phi_arr * theta_arr;
a_1 = theta_arr(1);
b_1 = theta_arr(3);

params.tau = 1/a_1;
params.K =b_1/a_1;
params.L = theta_arr(2) / theta_arr(3);


end


