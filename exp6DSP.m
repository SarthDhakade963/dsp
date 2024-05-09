clc; 
clear all; 
close all; 

% Define the transfer function
num = input('Enter the Numerator: ');  % Numerator coefficients [1, -2]
den = input('Enter the Denominator: ');  % Denominator coefficients [1, -5]

% Create a transfer function object
sys = tf(num, den);

% Plot the frequency response
[H, w] = freqz(num, den);
magnitude_response = abs(H);
phase_response = angle(H);

% Plot magnitude response
subplot(2,1,1);
plot(w, magnitude_response);
title('Magnitude Response of H(z)');
xlabel('Frequency (\omega)');
ylabel('Magnitude');
grid on;

% Calculate the desired cutoff frequency as 0.707 times the maximum magnitude
max_magnitude = max(magnitude_response);  % Find the maximum magnitude
desired_cutoff_magnitude = max_magnitude * 0.707; 

% Find the index of the frequency closest to the desired cutoff frequency
[~, idx_cutoff] = min(abs(magnitude_response - desired_cutoff_magnitude));

% Extract the corresponding frequency and magnitude
cutoff_frequency = w(idx_cutoff);
cutoff_magnitude = magnitude_response(idx_cutoff);

% Plot the cutoff frequency on the magnitude plot
hold on;
plot(cutoff_frequency, cutoff_magnitude, 'ro', 'MarkerSize', 10);
legend('Magnitude Response', 'Cutoff Frequency');

% Plot phase response
subplot(2,1,2);
plot(w, phase_response);
title('Phase Response of H(z)');
xlabel('Frequency (\omega)');
ylabel('Phase (radians)');
grid on;

% Calculate the cutoff phase (optional)
cutoff_phase = phase_response(idx_cutoff);

% Plot the cutoff frequency on the phase plot
hold on;
plot(cutoff_frequency, cutoff_phase, 'ro', 'MarkerSize', 10);
legend('Phase Response', 'Cutoff Frequency');
