classdef FOPTD_system
    %FOPTD_SYSTEM A class created to aid in the processing of FOPTD
    %systems
    %   K = Steady state Gain, tau = time constant, L = time delay
    
    properties
        K
        tau
        L
        tf
    end
    
    methods
        function obj = FOPTD_system(K,tau,L)
            %FOPTD_SYSTEM Construct an instance of this class
            %   Arguments: (Steady_state Gain, Time Constant, Time Delay)
            obj.K = K;
            obj.tau = tau;
            obj.L = L;
            obj.tf = tf(obj.K,[obj.tau 1],'InputDelay',obj.L);
        end
    end
end

