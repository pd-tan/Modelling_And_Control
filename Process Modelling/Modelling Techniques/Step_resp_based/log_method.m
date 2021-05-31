function [out_FOPTD,log_graph] = log_method(recorded_data,steady_state_val)

%% Import Tools
import_tools();


time = recorded_data.time;
resp = recorded_data.data;

y_temp = (steady_state_val - resp)/steady_state_val;
y = log(y_temp);

max(time);
coefficients = polyfit(time, y, 1);
xFit = linspace(min(time), max(time), 1000);
yFit = polyval(coefficients , xFit);

K = steady_state_val;
tau = -1/coefficients(1);
L = -coefficients(2)/coefficients(1);
out_FOPTD = FOPTD_system(K,tau,L);

log_graph.coeff = coefficients;
log_graph.time = time;
log_graph.data = y;
end