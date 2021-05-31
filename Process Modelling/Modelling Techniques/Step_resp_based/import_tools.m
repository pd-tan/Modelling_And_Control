function import_tools()
%IMPORT_TOOLS Summary of this function goes here
%   Detailed explanation goes here
%% Get current file path

file_name = matlab.desktop.editor.getActiveFilename;
file_path_arr = strsplit(file_name,filesep);

%% Get project folder
% Dynamically obtain process modelling folder
project_folder = '';
for i = 2:length(file_path_arr)-4
        project_folder = strcat(project_folder,filesep);
    project_folder = strcat(project_folder,file_path_arr(i));

    
end
project_folder = project_folder{1}

%% Add tools folder

tools_folder = strcat(project_folder,filesep,'Tools')
addpath(tools_folder)
end

