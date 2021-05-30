function new_omega = get_new_omega(M,phi_i,phi_prev,omega_i,omega_prev,index)
new_omega = omega_i - ((index*pi/(M-1)) + phi_i)*((omega_i - omega_prev)/(phi_i - phi_prev));
end