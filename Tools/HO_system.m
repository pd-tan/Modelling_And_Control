classdef HO_system
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        empircal_steady_state_gain
        skogestads_FOPTD_model
        transfer_function
    end
    
    methods
        function obj = HO_system(transfer_function)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj.transfer_function = transfer_function;
        end
        
        function generate_skogestads_FOPTD(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            
            %% Handles Paths
            % Get current file path
         
            file_name = fileparts(mfilename('fullpath'));
            file_path_arr = strsplit(file_name,filesep);
            
            %% Get project folder
            % Dynamically obtain process modelling folder
            project_folder = '';
            for i = 2:length(file_path_arr)-1
                project_folder = strcat(project_folder,filesep);
                project_folder = strcat(project_folder,file_path_arr(i));
                
                
            end
            project_folder = project_folder{1}
            
            process_simplification_folder = strcat(project_folder,filesep,'Process Simplification');
            addpath(process_simplification_folder);
            
            obj.skogestads_FOPTD_model = skogestads_FOPTD(obj.transfer_function);
        end
        
        
    end
end

