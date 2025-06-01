function error = myTermistor11(params)
    A = params(1); % First parameter
    B = params(2); % Second parameter
    %C = params(3); % Third parameter
    %D = params(4); % Fourth parameter

    % Example error computation (replace with your actual model):
    % Suppose you have data and a model y = param1 * x + param2
    filename = 'experiment_1.txt'; % Replace with your actual file name
    % Read the data from the file
    data = readmatrix(filename, 'Delimiter', ',', 'NumHeaderLines', 1);
    R_actual = data(1:end, 3);
    Temperature = data(1:end, 4);

    % Model prediction

    Rt_predicted = A.*exp(B./Temperature);% + C.*exp(D./Temperature);

    % Compute error (sum of squared errors)
    
    error = sum((log(R_actual) - log(Rt_predicted)).^2);
end