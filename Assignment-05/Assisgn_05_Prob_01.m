
%%%Analytical Solution based on the calculation%%%%%%%%%
% Define the range of x values
x_values = 0:0.5:5;

% Define the constants C1 and C2
C1 = 1 + 1/999;
C2 = -1/999;

% Calculate the y values for the given x range
y_values = (C1 * exp(-x_values)) - (C2 * exp(-1000 * x_values));

% Plot the solution
figure;
plot(x_values, y_values, 'b', 'LineWidth', 2);
xlabel('x');
ylabel('y(x)');
title('Analytical Solution of the Stiff ODE');
grid on;

