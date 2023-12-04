clc; clear all; close all;
syms x
f=(log(1+x)/x);

N_val=[0,1,2,3,4,5,6,7,8,9,10,20,30,50];
% Initialize a matrix to store results
results_1NM = zeros(length(N_val), length(N_val));
results_10NM = zeros(length(N_val), length(N_val));

for i= 1:length(N_val)
    N=N_val(i);
    M=N_val(i);
    pd = pade(f,x,'Order',[N,M]); %[N,M] where N=N and M=N
    p = subs(pd,x,vpa(1)); %get the value of pade approximate at value x=10
    q = subs(pd,x,vpa(10)); %get the value of pade approximate at value x=10
    results_1NM(i, i) =p;
    results_10NM(i, i) =q;
end
fprintf("For N=M the results for x=1 are: \n")
disp(results_1NM)
fprintf("For N=M the results for x=10 are: \n")
disp(results_10NM)

%for M=N+1

results_1NM1 = zeros(length(N_val), length(N_val));
results_10NM1 = zeros(length(N_val), length(N_val));


for i= 1:length(N_val)
    N=N_val(i);
    M=N_val(i)+1;
    pd = pade(f,x,'Order',[N,M]); %[N,M] where N=N and M=N
    pa = subs(pd,x,vpa(1)); %get the value of pade approximate at value x=10
    qa = subs(pd,x,vpa(10)); %get the value of pade approximate at value x=10
    results_1NM1(i, i+1) =pa;
    results_10NM1(i, i+1) =qa;
end
fprintf("For M=N+1 the results for x=1 are: \n")
disp(results_1NM1)
fprintf("For M=N+1 the results for x=10 are: \n")
disp(results_10NM1)


%disp(results_1-results_10)