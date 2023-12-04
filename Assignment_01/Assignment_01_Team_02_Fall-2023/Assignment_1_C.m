syms x;
f = (log(1+x) / x); % Define the symbolic function

% Create a vector of values for N
N_values = [0,1,2,3,4,5,6,7,8,9,10,20,30,50]; % You can specify any values you want

% Initialize arrays to store the results
N_results = [];
NM_results = [];
x_10_results = [];

% Compute and store the Padé approximants in the arrays for M = N
for i = 1:length(N_values)
    N = N_values(i);
    M = N; % Set M equal to N
    
    % Compute the Padé approximant
    p22 = pade(f, 'Order', [N, M]);
    
    % Evaluate the Padé approximant at x = 1 and x = 10
    result_1 = subs(p22, x, vpa(1));
    result_10 = subs(p22, x, vpa(10));
    
    % Store the results in the arrays
    N_results = [N_results; N];
    NM_results = [NM_results; result_1];
    x_10_results = [x_10_results; result_10];
end

% Create a table with three columns: N, N = M, and x = 10 values for M = N
results_table = table(N_results, NM_results, x_10_results, 'VariableNames', {'N', 'x = 1', 'x = 10'});

% Clear the arrays
N_results = [];
M_results = [];

NM_results = [];
x_10_results = [];

% Compute and store the Padé approximants in the arrays for N = N+1
for i = 1:length(N_values)
    M = N_values(i);
    N = N_values(i) + 1;
    
    % Compute the Padé approximant
    p22 = pade(f, 'Order', [N, M]);
    
    % Evaluate the Padé approximant at x = 1 and x = 10
    result_1 = subs(p22, x, vpa(1));
    result_10 = subs(p22, x, vpa(10));
    
    % Store the results in the arrays
    N_results = [N_results; N];
    M_results = [M_results; M];
    NM_results = [NM_results; result_1];
    x_10_results = [x_10_results; result_10];
end

% Create a new table with three columns: N, N = M, and x = 10 values for N = N+1
results_table_N_equals_N_plus_1 = table(N_results,M_results, NM_results, x_10_results, 'VariableNames', {'N','M' 'x = 1', 'x = 10'});

% Display the tables for both cases
disp("Results for M = N:")
disp(results_table);

disp("Results for M = N, N = N+1:")
disp(results_table_N_equals_N_plus_1);
