%% High Pass
clc; clear all; close all;

clc; clear all; close all;

wc = input('Enter the cutoff Frequency: ');
N = input('Enter length: ');

% Define frequency samples
wk = 2*pi.*[0:N-1]/N;

% Compute the frequency response for high-pass filter
HWk = (wk > wc) + ((2*pi - wc) < wk & wk < 2*pi);

% Compute the time-domain impulse response using inverse FFT
hn = ifft(HWk);

% Use freqz to compute frequency response
[Hz, f] = freqz(hn, 1, 1024, 'whole');

% Plot magnitude response
plot(f/(2*pi), abs(Hz)); % Plot the absolute value of H(z)
hold on;
title('Magnitude of Frequency Response of High Pass');
xlabel('Frequency (Hz)');
ylabel('|H(f)|');
grid on;

% Plot cutoff frequency as a point
wc_index = find(f/(2*pi) >= wc, 1);
scatter(f(wc_index)/(2*pi), abs(Hz(wc_index)), 100, 'r', 'filled');
legend('Magnitude Response', 'Cutoff Frequency');
hold off;

%% Band Pass
clc; clear all; close all;

wc1 = input('Enter the lower Frequency: ');
wc2 = input('Enter the upper Frequency: ');
N = input('Enter length: ');

% Define frequency samples
wk = 2*pi.*[0:N-1]/N;

% Compute the frequency response for bandpass filter
HWk = (wk > wc1 & wk < wc2);

% Compute the time-domain impulse response using inverse FFT
hn = ifft(HWk);

% Use freqz to compute frequency response
[Hz, f] = freqz(hn, 1, 1024, 'whole');

% Plot magnitude response
plot(f/(2*pi), abs(Hz)); % Plot the absolute value of H(z)
hold on;
title('Magnitude of Frequency Response of Band Pass');
xlabel('Frequency (Hz)');
ylabel('|H(f)|');
grid on;

% Calculate midpoint frequency
midpoint = (wc1 + wc2) / 2;

% Find index of frequency closest to the midpoint
midpoint_index = find(abs(f/(2*pi) - midpoint) == min(abs(f/(2*pi) - midpoint)), 1);

% Plot cutoff frequency point on the curve
scatter(f(midpoint_index)/(2*pi), abs(Hz(midpoint_index)), 100, 'r', 'filled');
legend('Magnitude Response', 'Cutoff Frequency');
hold off;


%% Low Pass
clc; clear all; close all;

wc = input('Enter the cutoff Frequency: ');
N = input('Enter length: ');

% Define frequency samples
wk = 2*pi.*[0:N-1]/N;

% Compute the frequency response
HWk = (wk < wc) + ((2*pi - wc) < wk & wk < 2*pi);

% Compute the time-domain impulse response using inverse FFT
hn = ifft(HWk);

% Use freqz to compute frequency response
[Hz, f] = freqz(hn, 1, 1024, 'whole');

% Plot magnitude response
plot(f/(2*pi), abs(Hz)); % Plot the absolute value of H(z)
hold on;
title('Magnitude of Frequency Response of Low Pass');
xlabel('Frequency (Hz)');
ylabel('|H(f)|');
grid on;

% Find index of cutoff frequency
wc_index = find(f/(2*pi) >= wc, 1);

% Plot cutoff frequency point on the curve
scatter(f(wc_index)/(2*pi), abs(Hz(wc_index)), 100, 'r', 'filled');
legend('Magnitude Response', 'Cutoff Frequency');
hold off;
