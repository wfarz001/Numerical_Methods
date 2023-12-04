% Steady state.
% Orlando Ramirez Barron.
% LU Factorization. % Reference: https://www.mathworks.com/help/matlab/ref/lu.html#responsive_offcanvas
clc
clear all
fprintf('LU Factorization');
%
% Dimensions of the random matrix
%m = input('Enter the number of rows of the matrix: ');
%%n = input('Enter the number of columns of the matrix: ');
%B = (10 * rand(m, n));
%
B=[2, 3; 1, 2]
[n, m] = size(B);
% Proposed initial matrices L and U
L = zeros(length(B)); % Matrix L with zero elements
U = zeros(length(B)); % Matrix U with zero elements
if n == m 
    for j = 1:length(B)
        for i = 1:length(B)
            sum = 0;
            q = j - 1;
            for k = 1:q
                sum = sum + (L(i, k) * U(k, j));
            end
            if i == j
                U(i, j) = 1;
            end
            if i >= j
                L(i, j) = B(i, j) - sum; % Generate lower triangular matrix
            else
                U(i, j) = (1 / L(i, i)) * (B(i, j) - sum); % Generate upper triangular matrix
            end
        end
    end
else
end
if n == m
    B
    L
    U
    LU = L * U
else
    disp('The matrix is not square')
end
