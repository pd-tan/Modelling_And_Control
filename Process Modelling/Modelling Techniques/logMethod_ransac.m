function [params,log_graph] = logMethod_ransac(recorded_data,steady_state_val)

time = recorded_data.time;
resp = recorded_data.data;
steady_state_val = resp(end)

invalid_points = [];
for i = 1 :length(resp)
    if resp(i)>=steady_state_val
        invalid_points(end +1) = i;
    end
end
resp(invalid_points) = [];
time(invalid_points) = [];

y_temp = (steady_state_val - resp)/steady_state_val  ;
y = log(y_temp);

max(time)
coefficients = polyfit(time, y, 1)
xFit = linspace(min(time), max(time), 1000);
yFit = polyval(coefficients , xFit);

fitPoly
params.tau = -1/coefficients(1);
params.K = steady_state_val;
params.L = -coefficients(2)/coefficients(1);
log_graph.coeff = coefficients;
log_graph.time = time;
log_graph.data = y;
end