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
            
            %% Handles Paths
            % Get current file path
            
            file_name = matlab.desktop.editor.getActiveFilename;
            file_path_arr = strsplit(file_name,filesep);
            
            %% Get project folder
            % Dynamically obtain process modelling folder
            project_folder = '';
            for i = 2:length(file_path_arr)-2
                project_folder = strcat(project_folder,filesep);
                project_folder = strcat(project_folder,file_path_arr(i));
                
                
            end
            project_folder = project_folder{1}
            
            process_simplification_folder = strcat(project_folder,filesep,'Process Simplification')
            addpath(process_simplification_folder)
            
            skogestads_FOPTD(obj.tf)
            outputArg = obj.Property1 + inputArg;
        end
    end
end

