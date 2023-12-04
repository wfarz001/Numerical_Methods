% Define the equations
eq1 = @(x) (3 - 2*x) / 3;
eq2 = @(x) (1 - x) / 2;

% Create a range of x-values
x = linspace(-10, 10, 400);

% Calculate corresponding y-values
y1 = eq1(x);
y2 = eq2(x);

% Plot the two equations
figure;
plot(x, y1, 'r', 'LineWidth', 2); % Red line for 2x + 3y = 3
hold on;
plot(x, y2, 'b', 'LineWidth', 2); % Blue line for x + 2y = 1

% Label the axes and add a legend
xlabel('x');
ylabel('y');
legend('2x + 3y = 3', 'x + 2y = 1');

% Find the intersection point using fminbnd
x_intersection = fminbnd(@(x) abs(eq1(x) - eq2(x)), -10, 10);
y_intersection = eq1(x_intersection);

% Plot the intersection point
plot(x_intersection, y_intersection, 'go', 'MarkerSize', 10);
text(x_intersection, y_intersection, 'Intersection', 'FontSize', 12);

% Display the result
fprintf('Intersection Point: x = %.2f, y = %.2f\n', x_intersection, y_intersection);
