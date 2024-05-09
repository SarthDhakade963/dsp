%Date Created - 01/03/2024

%% DFT of 4 point and 8 point sequence

x = input("Input signal; e.g., [1, 2, 1]: "); 
N = length(x);

X = zeros(1, N);

for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1i * 2 * pi * k * n / N);
    end
end

disp('DFT coefficients:');
disp(X);

subplot(3,1,1);
stem(x);
title('Original Signal');
xlabel('N');
ylabel('x(n)');

subplot(3,1,2);
stem(abs(X));
title('Magnitude of DFT coefficients');
xlabel('Frequency (k)');
ylabel('Magnitude');

subplot(3,1,3);
stem(angle(X));
title('Phase of DFT coefficients');
xlabel('Frequency (k)');
ylabel('Phase (radians)');

%% IDFT of 4 point and 8 point sequence

X = input("Input DFT coefficients; e.g., [1, 0, 1]: "); 
N = length(X);

x = zeros(1, N);

for n = 0:N-1
    for k = 0:N-1
        x(n+1) = x(n+1) + X(k+1) * exp(1i * 2 * pi * k * n / N);
    end
end

x = real(x) / N;  % Take the real part and normalize

disp('Reconstructed signal:');
disp(x);

subplot(3,1,1);
stem(x);
title('Original Signal');
xlabel('N');
ylabel('x(n)');

subplot(3,1,2);
stem(abs(x));
title('Magnitude of Reconstructed Signal');
xlabel('Time (n)');
ylabel('Magnitude');

subplot(3,1,3);
stem(angle(x));
title('Phase of Reconstructed Signal');
xlabel('Time (n)');
ylabel('Phase (radians)');