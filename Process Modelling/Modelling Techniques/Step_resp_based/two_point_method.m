function params = two_point_method(recorded_data,steady_state_val,p_1,p_2)
%TWO_POINT_METHOD Using two point on the step response curve, models the
%system as a FOPTD system.
%   Based on the selected percetages, the time which the values occurs
%   should satisfy the equation: -ln(1-percentage)T +L. Based on this, two
%   equtions are created, and a solution to the unknown L and T are found.
    time = recorded_data.time;
    resp = recorded_data.data;
chosen_percentages = [p_1,p_2];
actual_percentages = [];
time_samples = [];
coeff = [];

for i = [1 2]
    p = chosen_percentages(i);
    val_diff = abs(resp-p*steady_state_val);
    index = find(val_diff == min(val_diff));

    actual_percentage(i) = resp(index(1))/steady_state_val;
    time_samples(i)= time(index(1));
    coeff(i) = -1*log(1-actual_percentage(i));
end

params.K = steady_state_val;
params.tau = (time_samples(1) - time_samples(2))/(coeff(1)-coeff(2));
params.L = time_samples(1)-coeff(1)*params.tau;