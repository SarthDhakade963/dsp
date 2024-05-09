% Date Created - 01/03/2023

%% Decimation in Time Domain

x = input("Enter the sequence in Time Domain: ");  
N = length(x);                          % Length of sequence
p = log2(N);                            % Computing the number of conversion stages
Half = N/2;                             % Half the length of the array

subplot(2,1,1);
stem(0:N-1,x);
title('Original Signal');
xlabel('Sample');
ylabel('Amplitude');



for stage = 1:p                         % Stages of transformation
    for index = 0:(N/(2^(stage-1))):(N-1) % Series of "butterflies" for each stage
        for n = 0:(Half-1)               % Creating "butterfly" and saving the results
            pos = n + index + 1;         % Index of the data sample
            pow = (2^(stage-1)) * n;     % Part of power of the complex multiplier
            w = exp((-1i)*(2*pi)*pow/N); % Complex multiplier
            a = x(pos) + x(pos + Half);  % 1st part of the "butterfly" creating operation
            b = (x(pos) - x(pos + Half)) .* w; % 2nd part of the "butterfly" creating operation
            x(pos) = a;                  % Saving computation of the 1st part
            x(pos + Half) = b;           % Saving computation of the 2nd part
        end
    end
    Half = Half / 2;                     % Computing the next "Half" value
end

y = bitrevorder(x);

disp('FFT result:');
disp(y);

% Corrected stem function call
subplot(2,1,2);
stem(0:N-1, abs(y));
xlabel('Index');
ylabel('Magnitude');
title('FFT Result');

%% Decimation in Frequency Domain

% Prompt the user to input a signal
x = input('Enter the signal in the time domain: ');

% Length of the input signal
N = length(x);

% Ensure the length of the signal is a power of 2
if bitand(N, N-1) ~= 0
    error('Length of the input signal must be a power of 2.');
end

% Perform Decimation in Frequency (DIF) FFT
X = fft_dif(x);

disp('FFT-DIF Result-');
disp(X);

% Plot original signal and its FFT
subplot(2,1,1);
stem(0:N-1, x);
title('Original Signal');
xlabel('Sample');
ylabel('Amplitude');

subplot(2,1,2);
stem(0:N-1, abs(X));
title('FFT-DIF');
xlabel('Frequency Bin');
ylabel('Magnitude');

% Function to compute FFT using Decimation in Frequency (DIF)
function X = fft_dif(x)
    N = length(x);
    if N == 1
        X = x;
    else
        % Split the signal into even and odd indices
        x_even = zeros(1, N/2);
        x_odd = zeros(1, N/2);
        for i = 1:N/2
            x_even(i) = x(2*i - 1);
            x_odd(i) = x(2*i);
        end
        
        % Compute FFT recursively for even and odd parts
        X_even = fft_dif(x_even);
        X_odd = fft_dif(x_odd);
        
        % Combine FFT results
        X = zeros(1, N);
        for k = 1:N/2
            twiddle = exp(-2i * pi * (k-1) / N);
            X(k) = X_even(k) + twiddle * X_odd(k);
            X(k + N/2) = X_even(k) - twiddle * X_odd(k);
        end
    end
end



