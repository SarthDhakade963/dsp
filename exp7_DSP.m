% User-defined parameters
N = input('Enter the filter length (N): ');
fc = input("Cut-Off Frequency "); % Cutoff frequency

% Generate the desired frequency response (low-pass filter)
desired_response = [ones(1, round(fc*N)), zeros(1, N - round(fc*N))];

% Generate the desired frequency response (high-pass filter)
desired_response_1 = [zeros(1, round(fc*N)), ones(1, N - round(fc*N))];

n = [-(N-1)/2 :(N-1)/2];

rectangular_window = ones(1, N);
hamming_window = 0.54 - 0.46*cos(2*pi*n/(N-1));
hanning_window = 0.5 * (1 - cos(2*pi*n)/(N-1));
a0 = 0.42; a1 = 0.5; a2 = 0.08;
blackman_window = a0 - a1*cos(2*pi*n/(N-1)) + a2*cos(4*pi*n/(N-1));


rectangular_filter = desired_response_1 .* rectangular_window;
hamming_filter = desired_response_1 .* hamming_window;
hanning_filter = desired_response_1 .* hanning_window;
blackman_filter = desired_response_1 .* blackman_window;


rectangular_response = abs(fft(rectangular_filter,256));
hamming_response = abs(fft(hamming_filter,256));
hanning_response = abs(fft(hanning_filter,256));
blackman_response = abs(fft(blackman_filter,256));


frequencies = linspace(0,2*pi, 256);

% Find the index of the closest frequency to the cutoff frequency
[~, rect_index] = min(abs(frequencies - fc*pi));
[~, hamm_index] = min(abs(frequencies - fc*pi));
[~, hann_index] = min(abs(frequencies - fc*pi));
[~, black_index] = min(abs(frequencies - fc*pi));

subplot(4,1,1);
plot(frequencies, rectangular_response, 'b');
title('Rectangular Function')
hold on;
scatter(frequencies(rect_index), rectangular_response(rect_index), 'ro'); % Scatter plot cutoff frequency point
hold off;
subplot(4,1,2);
plot(frequencies, hamming_response, 'r');
title('Hamming Function')
hold on;
scatter(frequencies(hamm_index), hamming_response(hamm_index), 'ro'); % Scatter plot cutoff frequency point
hold off;
subplot(4,1,3);
plot(frequencies, hanning_response, 'g');
title('Hanning Function')
hold on;
scatter(frequencies(hann_index), hanning_response(hann_index), 'ro'); % Scatter plot cutoff frequency point
hold off;
subplot(4,1,4);
plot(frequencies, blackman_response, 'm');
title('Blackman');
xlabel('Frequency (rad/sample)');
hold on;
scatter(frequencies(black_index), blackman_response(black_index), 'ro'); % Scatter plot cutoff frequency point
hold off;
