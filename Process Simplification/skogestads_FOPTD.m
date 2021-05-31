function out_FOPTD = FOPTD_Skogestad(HO_tf)
%FOPTD_SKOGESTAD Summary of this function goes here
%   Detailed explanation goes here


import_tools();
K = dcgain(HO_tf);
denom_tau = -sort(1./pole(HO_tf));
num_tau = 1./zero(HO_tf);



tau = denom_tau(1);
L = HO_tf.InputDelay;

%% dealing with poles

no_poles = size(denom_tau);
no_poles = no_poles(1);


if (no_poles>1)
    if((denom_tau(1)> 1.5*denom_tau(2)))
        tau = tau + denom_tau(2)/2;
        L = L + denom_tau(2)/2;
        if (no_poles >2)
            for i = 2:no_poles
                L = L + denom_tau(i);
            end
        end
    end   
end

%% dealing with zeros

no_zeros = size(num_tau);
no_zeros = no_zeros(1);

for i = 1:no_zeros
    L = L + abs(num_tau(i));
end

out_FOPTD = FOPTD_system(K,tau,L);


