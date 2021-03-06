%% Clearing Environment 
close all
clear;
clc;

%% Handles Paths
% Get current file path

file_name = fileparts(mfilename('fullpath'));
file_path_arr = strsplit(file_name,filesep);

%% Get project folder
% Dynamically obtain process modelling folder
project_folder = '';
for i = 2:length(file_path_arr)-2
        project_folder = strcat(project_folder,filesep);
    project_folder = strcat(project_folder,file_path_arr(i));

    
end
project_folder = project_folder{1}

%% Add step_resp based method folder

step_response_folder = strcat(project_folder,filesep,'Process Modelling',filesep,'Modelling Techniques',filesep,'Step_resp_based')
addpath(step_response_folder)


%% Add tools folder

tools_folder = strcat(project_folder,filesep,'Tools')
addpath(tools_folder)

%% Create sample FOPTD system
% Define system as TODO: Add equation into documentation
% 
sample_system = FOPTD_system(2,3,1)



%% Get step response of sample system

[sample_step.data,sample_step.time] = step(sample_system.tf);
plot(sample_step.time,sample_step.data)
% TODO: Add title and scale

%% Testing Methods

TPM_model = two_point_method(sample_step,2,0.1,0.9);
log_model = log_method(sample_step,2);
LSTD_model = LSTD(sample_step,10);
area_model = area_method(sample_step,2);

% TODO add able headers

Modelling_methods = {'Actual';'Two-point method';'log Method';'Area method';'Least Squares Time Domain Method'};
Models = [sample_system.params,TPM_model.params,log_model.params,area_model.params,LSTD_model.params];


T = table(Modelling_methods,[Models.K].',[Models.tau].',[Models.L].')
