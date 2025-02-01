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
initial_guess_1 = [5487.3, 72.6];

% Call fminsearch to minimize the error
options = optimset('Display','iter','PlotFcns',@optimplotfval, 'TolFun',1.0e-10, 'TolX', 1.0e-10);
optimized_params = fminsearch(@myTermistor1, initial_guess_1, options);

% Display results
disp('Optimized Parameters:');
disp(optimized_params);

A1 = optimized_params(1);
B1 = optimized_params(2);
Rt1 = A1.*exp(B1./Temperature(1:26));

% Initial guess for parameters [param1, param2]
initial_guess_2 = [100, 10];

% Call fminsearch to minimize the error
options = optimset('Display','iter','PlotFcns',@optimplotfval);
optimized_params = fminsearch(@myTermistor2, initial_guess_2, options);

% Display results
disp('Optimized Parameters:');
disp(optimized_params);

A2 = optimized_params(1);
B2 = optimized_params(2);
Rt2 = A2.*exp(B2./Temperature(27:44));


% Initial guess for parameters [param1, param2]
initial_guess_3 = [100, 10];

% Call fminsearch to minimize the error
options = optimset('Display','iter','PlotFcns',@optimplotfval);
optimized_params = fminsearch(@myTermistor3, initial_guess_3, options);

% Display results
disp('Optimized Parameters:');
disp(optimized_params);

A3 = optimized_params(1);
B3 = optimized_params(2);
Rt3 = A3.*exp(B3./Temperature(45:60));



figure(3);
plot(Temperature, Resistance, '-o');
xlabel('Temperature (C)');
ylabel('Resistance (Ohm)');
title('Termistor: Resistance with Temperature');
grid on;
hold on;
plot(Temperature(1:26), Rt1, 'g*');
plot(Temperature(27:44), Rt2, 'y*');
plot(Temperature(45:60), Rt3, 'r*');

figure(4);
semilogy(Temperature, Resistance, '-o'); % Y-axis logarithmic
xlabel('Temperature (C)');
ylabel('Resistance (Ohm)');
title('Termistor: Resistance with Temperature (logaritmic)');
grid on;
hold on;
plot(Temperature(1:26), Rt1, 'g*');
plot(Temperature(27:44), Rt2, 'y*');
plot(Temperature(45:60), Rt3, 'r*');


%% resistor choice
% we should choose a good resistances for the voltage dellitel for maximum
% resolution
% one of them must be exactly work point
% the second one or 2 below it 
U = 3.3;
R = [100000:-1:40];
Resistors = [35000,2500,150];

figure(10)
hold on, grid on;
xlabel('Termistor resistance (Ohm)');
ylabel('ADC value %');
title('ADC % value with different voltage devidor resistors');
I = U./(R+Resistors(1));
plot(R, ((I.*R)/U)*100, 'r-');
I = U./(R+Resistors(2));
plot(R, ((I.*R)/U)*100, 'g-');
I = U./(R+Resistors(3));
plot(R, ((I.*R)/U)*100, 'b-');
legend('35k', '2.5k', '150 Ohm')

figure(11)
I = U./(R+Resistors(1));
semilogx(R, ((I.*R)/U)*100, 'r-');
hold on, grid on;
I = U./(R+Resistors(2));
semilogx(R, ((I.*R)/U)*100, 'g-');
I = U./(R+Resistors(3));
semilogx(R, ((I.*R)/U)*100, 'b-');
xlabel('Log Termistor resistance (Ohm)');
ylabel('ADC value %');
title('ADC % value with different voltage devidor resistors');
legend('35k', '2.5k', '150 Ohm')




%% Steady-state characteristic  (FAST)
% the fast uses less points to speed up the experiment
% requires a hardware system first
% we generate test input signals with wich observe our object
% for example if you like me have a 24V heater 
% we can start from 5V to 24V with 1V interval and plot that data

% test input signal
% at 18V the heater is above 300 degrees
% proceide with caution
test_input = [3:3:18]

% afterwards we read the file that contains the results of our experiment
% and we plot them on a graph

% import the statHK in matlab
fid = fopen('statHK.txt', 'r');
data = fscanf(fid, '%f,%f,%f', [3 inf]);  % Adjust format to match your data structure
fclose(fid);




