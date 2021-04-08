 function [ST1,ST2]=my_train_model(input_directory, output_directory,K_ini,K_end)

% *** Do not edit this script.
% Train models for three different ECG leads sets
if(nargin<3),K_ini=0;end
if(nargin<4),K_end=0;end


if ~exist(output_directory, 'dir')
    mkdir(output_directory)
end

disp('Running training code...')
[model, ST1,ST2]=team_training_code(input_directory,output_directory,K_ini,K_end); %team_training_code>train ECG leads classifier

disp('Done.')
end
