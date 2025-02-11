clear

%% manual experiment

% import the data from the manual experiment

filename = 'experiment_1.txt'; % Replace with your actual file name
% Read the data from the file
data = readmatrix(filename, 'Delimiter', ',', 'NumHeaderLines', 1);

% Extract the columns
Voltage = data(:, 1);
Current = data(:, 2);
Resistance = data(:, 3);
Temperature = data(:, 4);



% Initial guess for parameters [param1, param2]
initial_guess_0 = [52460, 30.2, -62740, 20.7];

% Call fminsearch to minimize the error
options = optimset('Display','iter','PlotFcns',@optimplotfval, 'TolFun',1.0e-10, 'TolX', 1.0e-10);
optimized_params = fminsearch(@myTermistor0, initial_guess_0, options);

% Display results
disp('Optimized Parameters:');
disp(optimized_params);

A1 = optimized_params(1);
B1 = optimized_params(2);
A2 = optimized_params(3);
B2 = optimized_params(4);
Rt0 = A1.*exp(B1./Temperature) + A2.*exp(B2./Temperature);


figure(3);
plot(Temperature, Resistance, '-o');
xlabel('Temperature (C)');
ylabel('Resistance (Ohm)');
title('Termistor: Resistance with Temperature');
grid on;
hold on;
plot(Temperature, Rt0, 'r*');

figure(4);
semilogy(Temperature, Resistance, '-o'); % Y-axis logarithmic
xlabel('Temperature (C)');
ylabel('Resistance (Ohm)');
title('Termistor: Resistance with Temperature (logaritmic)');
grid on;
hold on;
plot(Temperature, Rt0, 'r*');




