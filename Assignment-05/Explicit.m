% Implicit Euler Method
% Define the step size and time span
h = 0.5;
x_span = 0:h:5;

% Initialize arrays to store the results
y_explicit = zeros(size(x_span));

% Set initial conditions
y_explicit(1) = 1;

% Define the parameters for the implicit Euler method
a = 1001;
b = 1000;

% Apply implicit Euler method
for n = 1:length(x_span) - 1
    x_n = x_span(n);
    
    % Implicit Euler method
    y_explicit(n+1) = (y_explicit(n+1) + h * (y_explicit(n) - y_explicit(n+1)));
end


plot(x_span, y_explicit, 'r', 'LineWidth', 2);
xlabel('x');
ylabel('y(x)');
title('Explicit Euler Method Solution');
grid on;
