classdef FOPTD_system
    %FOPTD_SYSTEM A class created to aid in the processing of FOPTD
    %systems
    %   K = Steady state Gain, tau = time constant, L = time delay
    
    properties
        params     
        tf
    end
    
    methods
        function obj = FOPTD_system(K,tau,L)
            %FOPTD_SYSTEM Construct an instance of this class
            %   Arguments: (Steady_state Gain, Time Constant, Time Delay)
            obj.params.K = K;
            obj.params.tau = tau;
            obj.params.L = L;
            obj.tf = tf(obj.params.K,[obj.params.tau 1],'InputDelay',obj.params.L);
        end
    end
end

