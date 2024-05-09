clc; 
clear all; 
close all; 

% Define the transfer function
num = input('Enter the Numerator: ');  % Numerator coefficients [1, -2]
den = input('Enter the Denominator: ');  % Denominator coefficients [1, -5]

% Create a transfer function object
sys = tf2sos(num, den);

% Plot the frequency response
freqz(num, den);
title('Frequency Response of H(z)');
xlabel('Frequency (\omega)');
ylabel('Magnitude (dB)');
grid on;

% Compute the frequency response

[H, w] = freqz(num, den);

%plot(w,abs(H));

% Calculate the desired cutoff frequency as 0.707 times the maximum magnitude
max_magnitude = max(abs(H));  % Find the maximum magnitude
desired_cutoff_frequency = max_magnitude * 0.707;

% Find the index of the frequency closest to the desired cutoff frequency
[~, idx_cutoff] = min(abs(abs(H) - desired_cutoff_frequency));

% Extract the corresponding frequency and magnitude
cutoff_frequency = w(idx_cutoff);
cutoff_magnitude = abs(H(idx_cutoff));

% Plot the cutoff frequency on the figure
hold on;
plot(cutoff_frequency, cutoff_magnitude, 'ro', 'MarkerSize', 10);
legend('Frequency Response', 'Cutoff Frequency');
