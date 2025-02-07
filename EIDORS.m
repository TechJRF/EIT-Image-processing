% CUSTOM EIDORS STARTUP FILE
% this must be a script so that octave can source it


try
    eidors_startup
catch
    [message, id] = lasterr;
    if strcmp(id,'MATLAB:infoXmlValidationError')
        % An old version of MATLAB that we don't know how to write
        % info.xml for
    else
        error.message = message;
        error.identifier = id;
        rethrow(error);

% Create a forward model
model = eidors_obj('fwd_model', 'breast_model');

% Define a circular inclusion (tumor)
inclusion_center = [0, 0]; % Center of the tumor
inclusion_radius = 0.02; % Radius of the tumor
inclusion_conductivity = 0.3; % Higher conductivity for tumor

% Add inclusion to the model
model = add_inclusion(model, inclusion_center, inclusion_radius, inclusion_conductivity);


    end
end
