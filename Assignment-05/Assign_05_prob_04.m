% Define the ODE as a function
ode = @(x, Y) [Y(2); -1001 * Y(2) - 1000 * Y(1)];

% Define the initial conditions
initial_conditions = [1; 0]; % y(0) = 1, and dy/dx(0) = 0

% Define the range of x values
x_range = 0:0.5:5; % Adjust the range as needed

% Use ode23 to solve the ODE
[x, Y] = ode23(ode, x_range, initial_conditions);

% Extract the solutions for y and z
y = Y(:, 1);

% Plot the solution
figure;
plot(x, y, 'b', 'LineWidth', 2);
xlabel('x');
ylabel('y(x)');
title('Solution of the ODE using ode23');
grid on;
