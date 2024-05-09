%Author - Athashree Patil
%Date Created = 09/02/2024

%% Linear Convolution
x = input("Enter first signal: ");
x_offset = input("Enter zeroth position of x: ");


h = input("Enter second signal: ");
h_offset = input("Enter zeroth position of h: ");


N = length(x) + length(h) - 1; 

x_pad = [x, zeros(1, N - length(x))];
h_pad = [h, zeros(1, N - length(h))];

X = fft(x_pad);
H = fft(h_pad);

Y = X.*H;

y = ifft(Y);

y_offset = x_offset + h_offset - 1;

disp('Linear Convolution Result:');
disp(y);

n1 = -x_offset +1 : length(x)-x_offset;
subplot(3,1,1);
stem(n1,x);
title('First Signal')

n2 = -h_offset +1 : length(h)-h_offset;
subplot(3,1,2);
stem(n2,h);
title('Second Signal')

n3 = -y_offset + 1:length(y)-y_offset;
subplot(3,1,3);
stem(n3, y);
title('Linear Convolution')


%% Circular Convolution

x = input("Enter first signal: ");
h = input("Enter second signal: ");

disp(length(x));
disp(length(h));

if (length(x) > length(h))

    N = length(x);

elseif (length(x) < length(h))

    N = length(h);

else 

    N = length(h);

end

disp(N);


if (N > length(x))

    padded_x = [x, zeros(1, N - length(x))];

elseif (N < length(x))

    error('The first sequence should be less than or equal to N');

else

    padded_x = x;
end

N = length(padded_x);
disp(N);

if(N > length(h))

    padded_h = [h, zeros(1, N - length(h))];

elseif (N < length(h))

    error('The second sequence should be less than or equal to N');

else

    padded_h = h;

end

N = length(padded_h);
disp(N);

disp(length(padded_h));
disp(length(padded_x));

X = fft(padded_x);
H = fft(padded_h);

Y = X.* H;

result = ifft(Y);

disp('Circular Convolution Result:');
disp(result);

subplot(3,1,1);
stem(1:length(padded_x), padded_x);
title('First Signal');

subplot(3,1,2);
stem(1:length(padded_h), padded_h);
title('Second Signal');

subplot(3,1,3);
stem(1:length(result), real(result));
title('Circular Convolution Signal');



