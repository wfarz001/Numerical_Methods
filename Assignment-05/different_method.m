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
plot(x_values, y_values, 'yellow', 'LineWidth', 3);
xlabel('x');
ylabel('y(x)');
grid on;
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Implicit Euler Method
% Define the step size and time span
h = 0.5;
x_span = 0:h:5;

% Initialize arrays to store the results
y_implicit = zeros(size(x_span));

% Set initial conditions
y_implicit(1) = 1;

% Define the parameters for the implicit Euler method
a = 1001;
b = 1000;

% Apply implicit Euler method
for n = 1:length(x_span) - 1
    x_n = x_span(n);
    
    % Implicit Euler method
    y_implicit(n+1) = (y_implicit(n) + h * (y_implicit(n+1) - y_implicit(n)));
end

plot(x_span, y_implicit, 'r', 'LineWidth', 2);
grid on;
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms y1 y2 y z t t1 t2 h z1 z2

S1 = z;

S2 =  -1001*z-1000*y;

SS1 = y2- y1 - h*subs(S1,{y z},[y2 z2]); 

SS2 = z2- z1 - h*subs(S2,{y z},[y2 z2]); 
EQN1 = SS1 ==0;
Y = solve(EQN1,y2);

EQN2 = SS2 ==0;
Z = solve(EQN2,z2);

H=0.5;
T=0:H:5;

YN(1)=1;
ZN(1)=0;

for i=2:length(T)
    EQ1=subs(EQN1,{y1 z1 h},[YN(i-1) ZN(i-1) H]);
    EQ2=subs(EQN2,{y1 z1 h},[YN(i-1) ZN(i-1) H]);
    [solx,soly] = solve(EQ1,EQ2);
    YN(i) = double(solx);
    ZN(i) = double(soly);
 
end
plot(T, YN, 'black', 'LineWidth', 2);
grid on;
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
y=y';
x=x';
% Plot the solution
plot(x, y, '--', 'LineWidth', 1);

legend ('Analytical Solution','Implicit Method','Explicit Method','ode23 method')

% Print the results
fprintf('------------------------------------------------------------\n');
fprintf('Solutions with different methods with step size,h=0.5 \n')
fprintf('------------------------------------------------------------\n');
fprintf('x-value\t  y-analytical\t  y-implicit\t y-explicit\t y-ode\n');
fprintf('----------------------------------------------------------\n');
for i = 1:length(T)
    fprintf('%4.1f\t\t %4.4f\t\t %4.4f\t\t %4.4f\t\t %4.4f\n', T(i),y_values(i),y_implicit(i),YN(i), y(i));
end