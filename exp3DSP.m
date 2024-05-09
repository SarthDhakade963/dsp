%Author - Sarthak Dhakade
%Date Created = 09/02/2024

%% Linear Convolution
x = input("Enter first signal: ");
x_offset = input("Enter zeroth position of x: "); % 1 means 1st signal 2 means 2nd signal and so on


h = input("Enter second signal: ");
h_offset = input("Enter zeroth position of h: "); 


N = length(x) + length(h) - 1; 

% Addition of extra zeroes to make x and h same
x_pad = [x, zeros(1, N - length(x))];
h_pad = [h, zeros(1, N - length(h))];

% fft of x and h i.e conversion of time domain into frequency domain
X = fft(x_pad);
H = fft(h_pad);

% Property of Convolution
Y = X.*H;

% converting into Time Domain
y = ifft(Y);

% Setting the Zeroth posiyion (origin) of Convoluted Value
y_offset = x_offset + h_offset - 1;


disp('Linear Convolution Result:');
disp(y);

%Plotting the Graph of First Signal 
n1 = -x_offset + 1 : length(x) - x_offset;
subplot(3,1,1);
stem(n1,x);
title('First Signal')

%Plotting the Graph of Second Signal 
n2 = -h_offset + 1 : length(h) - h_offset;
subplot(3,1,2);
stem(n2,h);
title('Second Signal')

%Plotting Convoluted Signal
n3 = -y_offset + 1:length(y)-y_offset;
subplot(3,1,3);
stem(n3, y);
title('Linear Convolution')


%% Circular Convolution

x = input("Enter first signal: ");
h = input("Enter second signal: ");

disp(length(x));
disp(length(h));

% Getting the N values
if (length(x) > length(h))

    N = length(x);

elseif (length(x) < length(h))

    N = length(h);

else 

    N = length(h);

end

disp(N);


% Padding of X signal
if (N > length(x))

    padded_x = [x, zeros(1, N - length(x))];

elseif (N < length(x))

    error('The first sequence should be less than or equal to N');

else

    padded_x = x;
end

% N is equal to padded value of x

N = length(padded_x);
disp(N);

% Padding of h signal
if(N > length(h))

    padded_h = [h, zeros(1, N - length(h))];

elseif (N < length(h))

    error('The second sequence should be less than or equal to N');

else

    padded_h = h;

end
% N is equal to padded vale uf h

N = length(padded_h);
disp(N);

%Whether the Padded Values of x and h are equal or not
if (length(padded_h) == length(padded_x))

    disp('Length of X and H are same');

else
    
    disp('Length of X and H are not same');

end

%Converting from Time Domain to Frequency Domain
X = fft(padded_x);
H = fft(padded_h);

%Convolution Property
Y = X.* H;

%Converting from Frequency Domain to Time Domain 
y = ifft(Y);

disp('Circular Convolution Result:');
disp(y);

subplot(3,1,1);
stem(1:length(padded_x), padded_x);
title('First Signal');

subplot(3,1,2);
stem(1:length(padded_h), padded_h);
title('Second Signal');

subplot(3,1,3);
stem(1:length(y), real(y));
title('Circular Convolution Signal');



