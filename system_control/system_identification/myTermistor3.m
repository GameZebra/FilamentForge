function error = myTermistor3(params)
    A = params(1); % First parameter
    B = params(2); % Second parameter
    C = params(3);

    % Example error computation (replace with your actual model):
    % Suppose you have data and a model y = param1 * x + param2
    filename = 'experiment_1.txt'; % Replace with your actual file name
    % Read the data from the file
    data = readmatrix(filename, 'Delimiter', ',', 'NumHeaderLines', 1);
    R_actual = data(:, 3);
    T_actual = data(:, 4);

    % Model prediction

    T_predicted = 1./(A + B*log(R_actual) + C*(log(R_actual)).^3);

    % Compute error (sum of squared errors)
    error = sum((T_actual - T_predicted).^2);
end