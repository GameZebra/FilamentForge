clear

%% manual experiment
% we measure the temperature with NTC Termistor and voltage devider
% but because the termistor changes its resistance very non linearly 
% and the process (termal) is very slow we did relatively fast manual
% experiment on which basis to choose resistors for the voltage devider

% import the data from the manual experiment

filename = 'experiment_1.txt'; % Replace with your actual file name
% Read the data from the file
data = readmatrix(filename, 'Delimiter', ',', 'NumHeaderLines', 1);

% Extract the columns
Voltage = data(:, 1);
Current = data(:, 2);
Resistance = data(:, 3);
Temperature = data(:, 4);



% Example: Plot Voltage vs Current
figure(1);
plot(Voltage, Current, '-o');
xlabel('Voltage (V)');
ylabel('Current (A)');
title('Heating element: Voltage vs Current');
grid on;

figure(2);
plot(Temperature, Voltage./Current, '-o');
xlabel('Temperature (C)');
ylabel('Resistance (Ohm)');
title('Heating element: Resistance with Temperature');
grid on;


% mat approximation of the termistor

% initial guess 1
% A = 1000;
% B = 114;

% initial guess 2
%A=80;
%B=240;

% Initial guess for parameters [param1, param2]
initial_guess = [1500, 0.005];

% Call fminsearch to minimize the error
options = optimset('Display','iter','PlotFcns',@optimplotfval);
optimized_params = fminsearch(@myTermistor1, initial_guess, options);

% Display results
disp('Optimized Parameters:');
disp(optimized_params);

A = optimized_params(1);
B = optimized_params(2);
Rt1 = A.*exp(B./Temperature);


figure(3);
plot(Temperature, Resistance, '-o');
xlabel('Temperature (C)');
ylabel('Resistance (Ohm)');
title('Termistor: Resistance with Temperature');
grid on;
hold on;
plot(Temperature, Rt1, 'g*');


figure(4);
semilogy(Temperature, Resistance, '-o'); % Y-axis logarithmic
xlabel('Temperature (C)');
ylabel('Resistance (Ohm)');
title('Termistor: Resistance with Temperature (logaritmic)');
grid on;
hold on;
plot(Temperature, Rt1, 'g*');


%% Steady-state characteristic
% requires a hardware system first
% we generate test input signals with wich observe our object
% for example if you like me have a 24V heater 
% we can start from 5V to 24V with 1V interval and plot that data

% test input signal
test_input = [5:24]

% afterwards we read the file that contains the results of our experiment
% and we plot them on a graph

% import the statHK in matlab
fid = fopen('statHK.txt', 'r');
data = fscanf(fid, '%f,%f,%f', [3 inf]);  % Adjust format to match your data structure
fclose(fid);




