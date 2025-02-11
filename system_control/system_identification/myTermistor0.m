function error = myTermistor0(params)
    A1 = params(1); % First parameter
    B1 = params(2); % Second parameter
    A2 = params(3);
    B2 = params(4);
    A3 = params(5);
    B3 = params(6);


    % Example error computation (replace with your actual model):
    % Suppose you have data and a model y = param1 * x + param2
    filename = 'experiment_1.txt'; % Replace with your actual file name
    % Read the data from the file
    data = readmatrix(filename, 'Delimiter', ',', 'NumHeaderLines', 1);
    R_actual = data(:, 3);
    Temperature = data(:, 4);

    % Model prediction

    Rt_predicted = A1.*exp(B1./Temperature) .* A2.*exp(B2./Temperature) .* A3.*exp(B3./Temperature);

    % Compute error (sum of absolute errors weighted with the temperature)
    error = sum(abs(R_actual - Rt_predicted).*Temperature);
end