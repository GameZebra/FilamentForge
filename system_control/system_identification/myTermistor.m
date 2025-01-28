function error = myTermistor(params)
    A = params(1); % First parameter
    B = params(2); % Second parameter

    % Example error computation (replace with your actual model):
    % Suppose you have data and a model y = param1 * x + param2
    filename = 'experiment_1.txt'; % Replace with your actual file name
    % Read the data from the file
    data = readmatrix(filename, 'Delimiter', ',', 'NumHeaderLines', 1);
    R_actual = data(:, 3);
    Temperature = data(:, 4);

    % Model prediction

    Rt_predicted = A.*exp(B./Temperature);

    % Compute error (sum of squared errors)
    error = sum((R_actual - Rt_predicted).^2);
end