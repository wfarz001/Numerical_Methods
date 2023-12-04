% Define the coefficients of the system
A = [2, 3; 1, 2];
b = [3; 1];
% Display the A matric
fprintf('Matrix A:\n');
disp(A);
% Perform LU decomposition
[L, U, P] = lu(A)
LU=L*U;
LPU=P'*L*U;
% Solve for y in Ly = P*b
y = L\(P*b);

% Solve for x in Ux = y
x = U\y;
% Display the L and U matrices
fprintf('Matrix L:\n');
disp(L);

fprintf('Matrix U:\n');
disp(U);
% Display the solutions
fprintf('Solution:\n');
fprintf('x = %.2f\n', x(1));
fprintf('y = %.2f\n', x(2));
