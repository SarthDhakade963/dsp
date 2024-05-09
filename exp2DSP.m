clc;
close all ;
clear all;
% Given signal values and corresponding time indices
x_values = [1, 1.5, 1, 1];
t_indices = [-1, 0, 1, 2];

% Plot the original signal
subplot(4, 3, 1);
plot(t_indices, x_values, 'b', 'LineWidth', 1.5);
title('Original CT Signal');
xlabel('t');
ylabel('x(t)');

% Reverse the signal
x_reversed = fliplr(x_values);
t_reversed = fliplr(-t_indices); % Reversing time indices as well for clarity

% Plot the reversed signal
subplot(4, 3, 2);
plot(t_reversed, x_reversed, 'r', 'LineWidth', 1.5);
title('Reversed Signal');
xlabel('t');
ylabel('x(-t)');

% Time shifting by 2 units to the right
shift_amount = 2;
t_shifted = t_indices + shift_amount;

% Plot the shifted signal
subplot(4, 3, 3);
plot(t_shifted, x_values, 'g', 'LineWidth', 1.5);
title('Time shifting');
xlabel('t');
ylabel('x(t-2)');

% Time expand by 0.5 units
expansion_factor = 0.5;
t_expanded = t_indices / expansion_factor;

% Plot the time-expanded signal
subplot(4, 3, 4);
plot(t_expanded, x_values, 'g', 'LineWidth', 1.5);
title('Time Expansion');
xlabel('t');
ylabel('x(0.5*t)');


% Right shift the signal by 2 units
shift_amount = 2;
t_shifted = t_indices + shift_amount;

% Time scale the signal by 0.5
scaling_factor = 0.5;
t_scaled = t_shifted / scaling_factor;

% Plot the shifted and scaled signal
subplot(4, 3, 5);
plot(t_scaled, x_values, 'b', 'LineWidth', 1.5);
title('Time Shifted & Scaled Signal');
xlabel('t');
ylabel('x(0.5*t-2)');



%%%%%% DT operation

% Given signal values and corresponding time indices
x_values = [1, 2, -1, 0, -2];
t_indices = [-2, -1, 0, 1, 2];

% Plot x
subplot(4, 3, 6);
stem(t_indices, x_values, 'b', 'LineWidth', 1.5);
title('Original DT Signal');
xlabel('t');
ylabel('x(t)');
% Time reversal
x_reversed = fliplr(x_values);
t_reversed = -fliplr(t_indices); % Reversing time indices as well

% Plot time reversed signal x
subplot(4, 3, 7);
stem(t_reversed, x_reversed, 'r', 'LineWidth', 1.5);
title('Reversed Signal');
xlabel('t');
ylabel('x(-t)');

% Right shift by 2 units
shift_amount = 2;
t_shifted = t_indices + shift_amount;

% Plot right shifted signal of x by 2 units
subplot(4, 3, 8);
stem(t_shifted, x_values, 'g', 'LineWidth', 1.5);
title('Time shifting');
xlabel('n');
ylabel('x(n-2)');

% Time scaling by 2
scaling_factor = .5;
t_scaled = t_indices /scaling_factor;

% Plot time scaled signal by .5
subplot(4, 3, 9);
stem(t_scaled, x_values, 'm', 'LineWidth', 1.5);
title('Time Scaling');
xlabel('n');
ylabel('x(0.5*n)');

% Time shift by 2 units and scale by 0.5
shift_amount=2;
t_shifted_scaled = (t_indices + shift_amount) * (1/scaling_factor);

% Plot signal which is time shifted by 2 units and scaled by 0.5
subplot(4, 3, 10);
stem(t_shifted_scaled, x_values, 'c', 'LineWidth', 1.5);
title('Time shifting & Scaling');
xlabel('n');
ylabel('x(0.5*n-2)');

% Even signal of x
x_even = 0.5 * (x_values + fliplr(x_values));

% Plot even signal of x
subplot(4, 3, 11);
stem(t_indices, x_even, 'y', 'LineWidth', 1.5);
title('Even Signal');
xlabel('n');
ylabel('Xe(n)');

% Odd signal of x
x_odd = 0.5 * (x_values - fliplr(x_values));

% Plot odd signal of x
subplot(4, 3, 12);
stem(t_indices, x_odd, 'k', 'LineWidth', 1.5);
title('Odd Signal');
xlabel('n');
ylabel('Xo(n)');