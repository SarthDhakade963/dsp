% Author - Sarthak Amar Dhakade (211030054)
% Date Created - 19/01/2024

%% Task 1

% Continuous Time

% Sin(t)
t = 0 : 0.01 : 4*pi ;
c = sin(t);
subplot(5,1,1)
plot (t,c)
title("Continuous sin(t)")

% Step Function
t = 0 : 0.01 : 5;
u = ones (1 , length(t));
subplot(5,1,2);
plot(t,u)
title("Continuous u(t)")

% Ramp Function
t = 0 : 0.01 : 5;
u = ones (1 , length(t));
r = u.*t;
subplot(5,1,3)
plot(t,r)
title("Continuous r(t)")

% Impulse Function
t = 0 : 0.01 : 5;
delta_t = zeros (size(t));
delta_t(t == 0) = 1;
subplot(5,1,4)
stem(t,delta_t);
title("Continuous del(t)")

% Sinc(t)
t = -2*pi : 0.01 : 2*pi;
c = sin(pi * t) ./ (pi * t);
subplot(5,1,5)
plot(t, c);
title("Continuous sinc(t)")

%% Discrete Time

% Impulse Function
n = 0 : 0.01 : 5;
delta_t = zeros (size(n));
delta_t(n == 0) = 1;
subplot(5,1,1)
stem(n,delta_t);
title("Discrete del(t)")

% Sin(n)
n = 0 : 20;
c = sin(n);
subplot(5,1,2)
stem (n,c)
title("Discrete sin(n)")

% Step Function
n = 0 : 20;
u = ones (size(n));
subplot(5,1,3)
stem(n,u)
title("Discrete u(n)")

% Ramp Function
n = 0.01 : 5;
u = ones (1 , length(n));
r = u.*n;
subplot(5,1,4)
stem(n,r)
title("Discrete r(n)")

% Sinc(n)
n = -2*pi : 0.01 : 2*pi;
c = sin(pi * n) ./ (pi * n);
subplot(5,1,5)
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


% Customised CT
t1 = -4:0.01:-1;
m = size(t1);
u1 = zeros(m);

for i = m(1,1) : m(1,2)
    if t1(i) >= -2
        u1(1,i) = 1;
    else
        u1(1,i) =0;
    end
end

u1(1,m(1,2)) = 2;
stem(t1,u1);
hold on;

t2 = -1:0.01:0;
n = size(t2);
y1 = zeros(n);

for i = n(1,1):n(1,2)
    if t2(i) >=-1
        y1(1,i) = 1*t2(i) + 3;
    else
        y1(1,i) =0;
    end
end

stem(t2,y1);
hold on;

t3 = 0:0.01:1;
p = size(t3);
y2 = zeros(p);

for i = p(1,1):p(1,2)
    if t3(i) >=-1
        y2(1,i) = -1*t3(i) + 3;
    else
        y2(1,i) =0;
    end
end

stem(t3,y2);
hold on;

t4 = 1:0.01:4;
q = size(t4);
u2 = zeros(q);

for i = q(1,1) : q(1,2)
    if (t4(i) >= 1 && t4(i) <=2)
        u2(1,i) =-1;
    else
        u2(1,i) =0;
    end
end
u2(1,q(1,1)) = 2;
stem(t4,u2);
hold off;
grid on;


%% Customised DT

%from -2 to -1
t = -2: 2;
u = [1 2 3 4 5];
subplot(2,1,1)
stem(t, u);
title('Customized DT')
