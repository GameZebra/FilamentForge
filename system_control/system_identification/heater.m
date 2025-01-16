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







%%