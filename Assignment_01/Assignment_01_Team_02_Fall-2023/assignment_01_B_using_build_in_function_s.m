clc; clear all; close all;
syms x
x_val=[1,10];
N_val=[1, 3, 5, 7, 9, 10, 20, 30, 50];
% Initialize a matrix to store results
results = zeros(length(N_val), length(x_val));
    f=(log(1+x)/x);
    T=taylor(f);
    fprintf("Taylor Exapnsion is \n");
    pretty(T)

for i= 1:length(N_val)
    N=N_val(i);
    fprintf('The value of N: %d \n',N)
    T = taylor(f,x,'ExpansionPoint',0 ,'Order',N+1);
    %pretty(T)
    for n=1:length(x_val)
        
        %x=n;
        results(i,n)=double(subs(T,x,x_val(n))); %subsituting the value x=1 in the T (taylor) function
        fprintf('Putting the value of x=%d \t : %d \n', x_val(n), results(i,n))

    end
        
end
% Print the results
fprintf('\n \n \nThe results are \nN\t\t x =1 \t\t x = 10 \n');
fprintf('---------------------------\n');
for i = 1:length(N_val)
    fprintf('%d\t\t%.6f\t%.6f\n', N_val(i), results(i, 1), double(results(i, 2)));
end

T = taylor(f,x,'Order',50+1);
fprintf("Taylor Exapnsion is \n");
pretty(T)