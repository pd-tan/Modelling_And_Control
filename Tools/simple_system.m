classdef simple_system
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        empircal_steady_state_gain
        skogestads_FOPTD
        tf
    end
    
    methods
        function obj = simple_system(num,denom,delay)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj.tf = tf(num,denom,'InputDelay',delay);
        end
        
        function generate_skogestads_FOPTD(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

