% Author - Sarthak Amar Dhakade (211030054)
% Date Created - 19/01/2024

%% Task 1

% Continuous Time

% Sin(t)
t = 0 : 0.01 : 4*pi ;
c = sin(t);
subplot(5,2,1)
plot (t,c)
title("Continuous sin(t)")

% Step Function
t = 0 : 0.01 : 5;
u = ones (1 , length(t));
subplot(5,2,3);
plot(t,u)
title("Continuous u(t)")

% Ramp Function
t = 0 : 0.01 : 5;
u = ones (1 , length(t));
r = u.*t;
subplot(5,2,5)
plot(t,r)
title("Continuous r(t)")

% Impulse Function
t = 0 : 0.01 : 5;
delta_t = zeros (size(t));
delta_t(t == 0) = 1;
subplot(5,2,9)
stem(t,delta_t);
title("Continuous del(t)")

% Sinc(t)
t = -2*pi : 0.01 : 2*pi;
c = sin(pi * t) ./ (pi * t);
subplot(5,2,7)
plot(t, c);
title("Continuous sinc(t)")

% Discrete Time

% Impulse Function
n = 0 : 0.01 : 5;
delta_t = zeros (size(n));
delta_t(n == 0) = 1;
subplot(5,2,10)
stem(n,delta_t);
title("Discrete del(t)")

% Sin(n)
n = 0 : 20;
c = sin(n);
subplot(5,2,2)
stem (n,c)
title("Discrete sin(n)")

% Step Function
n = 0 : 20;
u = ones (size(n));
subplot(5,2,4)
stem(n,u)
title("Discrete u(n)")

% Ramp Function
n = 0.01 : 5;
u = ones (1 , length(n));
r = u.*n;
subplot(5,2,6)
stem(n,r)
title("Discrete r(n)")

% Sinc(n)
n = -2*pi : 0.01 : 2*pi;
c = sin(pi * n) ./ (pi * n);
subplot(5,2,8)
stem(n, c);
title("Discrete sinc(n)")


%% Task 2

% Continuous CT

%from -2 to -1
t1 = -2:0.01:-1;
u1 = zeros(size(t1));

u1(t1 <= -1) = -1;
u1(end) = 1.5;

plot(t1, u1);
hold on;


%from -1 to 0
t2 = -1:0.01:0;
u2 = zeros(size(t2));

u2 (t2 <= 0) = 0.5*t2 + 2;

plot(t2, u2);
hold on;

%from 0 to 1
t3 = 0:0.01:1;
u3 = zeros(size(t3));

u3(t3 <= 1) = -0.5*t3 + 2;
u3(end) = -1;

plot(t3, u3);
hold on;

%from 1 to 2
t4 = 1:0.01:2;
u4 = zeros(size(t4));

u4(t4 <= 2) = -1;
u4(end) = 0;

plot(t4, u4);

hold off;
grid on;

title('Customized CT')

%% Task 3

% Customised DT

%from -2 to -1
t1 = -2: 2;
u1 = [1 2 3 4 5];
stem(t1, u1);

title('Customized DT')
