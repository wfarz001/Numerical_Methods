% Define values of x
x_values = [1, 10];

% Define values of N 
N_values = [1, 3, 5, 7, 9, 10, 20, 30, 50];

% Initialize a matrix to store results
results = zeros(length(N_values), length(x_values));

% Calculate the series for each N and x
for i = 1:length(N_values)
    N = N_values(i);
    for j = 1:length(x_values)
        x = x_values(j);
        series_sum = 0;
        for n = 0:N
            term = ((-1)^n * x^n) / (n + 1);
            series_sum = series_sum + term;
        end
        results(i, j) = series_sum;
    end
end

% Print the results
fprintf('N\t\tf(1)\t\tf(10)\n');
fprintf('---------------------------\n');
for i = 1:length(N_values)
    fprintf('%d\t\t%.6f\t%.6f\n', N_values(i), results(i, 1), results(i, 2));
end
