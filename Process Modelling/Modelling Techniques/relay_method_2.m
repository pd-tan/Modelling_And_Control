function params = relay_method(resp,square,k_p)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here



crossings = get_zero_crossing(square.data);
duration = square.time(crossings(end)) -square.time(crossings(1));


P_u= 2 * duration/(length(crossings)-1);
a = max(abs(resp.data));
h = max(square.data);
L = find(resp.data > 0);
L = resp.time(L(1));



w_u = 2*pi/P_u;
K_u = 4*h/(a*pi);
temp = tan(pi - w_u*L)
while temp < 0
    temp = temp + pi
end


tau =(temp/w_u);

K = sqrt(((tau*w_u)^2)+ 1)/K_u;



params.K = K;
params.tau = tau;
params.L = L;

P_u
K_u
a
h
L
end

