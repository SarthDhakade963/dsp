%% Low Pass Filter

clear all; 
clc;

% Filter Design Parameters
AP = input("Enter the value of Ap: "); %0.6; 
AS = input("Enter the value of As: "); %0.1; 
PEF_D = input("Enter the value of Wp: "); %0.35 * pi; 
SEF_D = input("Enter the value of Ws: "); % 0.7 * pi; 
T = 1;

alpha_P = -20 * log10(AP);
alpha_S = -20 * log10(AS);

% Calculate analog filter parameters
PEF_A = (2/T) * tan(PEF_D/2);
SEF_A = (2/T) * tan(SEF_D/2);

% Order and cutoff frequency
[N, CF] = buttord(PEF_A, SEF_A, alpha_P, alpha_S, 's');

% Normalised transfer function
[Bn, An] = butter(N, 1, 's');
disp('Normalised Transfer Function is:');
Hsn = tf(Bn, An)

% Unnormalised transfer function
[B, A] = butter(N, CF, 'low', 's');
disp('Unnormalised Transfer Function is:');
Hs = tf(B, A)

% Digital transfer function
[num, den] = bilinear(B, A, 1/T);
disp('Digital Transfer Function is:');
Hz = tf(num, den, T)

% Frequency response
w = 0:pi/16:pi;
[Hw, f] = freqz(num, den, w);
disp('Magnitude Response is:');
Hw_mag = abs(Hw);

% Plotting
plot(w/pi, Hw_mag, 'k');
hold on;

% Plot cutoff frequency point
CF_index = round(CF/(pi/16)) + 1; % Index of cutoff frequency in w vector
plot(w(CF_index)/pi, Hw_mag(CF_index), 'ro', 'MarkerSize', 8); % Red circle marker
hold off;

grid on;

% Frequency response plot
title('Magnitude Response of Butterworth LowPass Filter', 'fontweight', 'b'); 
xlabel('Normalised frequency, \omega/\pi', 'fontweight', 'b'); 
ylabel('Magnitude', 'fontweight', 'b');

%% High Pass Filter 

clear all;
clc;

% Filter Design Parameters
AP = input("Enter the value of Ap: "); % Passband Ripple (e.g., 0.6)
AS = input("Enter the value of As: "); % Stopband Attenuation (e.g., 0.1)
PEF_D = input("Enter the value of Wp: "); % Passband Edge Frequency (e.g., 0.35 * pi)
SEF_D = input("Enter the value of Ws: "); % Stopband Edge Frequency (e.g., 0.7 * pi)
T = 1;

alpha_P = -20 * log10(AP);
alpha_S = -20 * log10(AS);

% Calculate analog filter parameters
PEF_A = (2/T) * tan(PEF_D/2);
SEF_A = (2/T) * tan(SEF_D/2);

% Order and cutoff frequency
[N, CF] = buttord(PEF_A, SEF_A, alpha_P, alpha_S, 's');

% Normalised transfer function
[Bn, An] = butter(N, 1, 's');
disp('Normalised Transfer Function is:');
Hsn = tf(Bn, An);

% Unnormalised transfer function for high-pass
[B, A] = butter(N, CF, 'high', 's');
disp('Unnormalised Transfer Function is:');
Hs = tf(B, A);

% Digital transfer function
[num, den] = bilinear(B, A, 1/T);
disp('Digital Transfer Function is:');
Hz = tf(num, den, T);

% Frequency response
w = 0:pi/16:pi;
[Hw, f] = freqz(num, den, w);
disp('Magnitude Response is:');
Hw_mag = abs(Hw);

% Plotting
plot(w/pi, Hw_mag, 'k');
hold on;

% Plot cutoff frequency point
CF_index = round(CF/(pi/16)) + 1; % Index of cutoff frequency in w vector
plot(w(CF_index)/pi, Hw_mag(CF_index), 'ro', 'MarkerSize', 8); % Red circle marker
hold off;

grid on;

% Frequency response plot
title('Magnitude Response of Butterworth High-pass Filter', 'fontweight', 'b'); 
xlabel('Normalised frequency, \omega/\pi', 'fontweight', 'b'); 
ylabel('Magnitude', 'fontweight', 'b');

