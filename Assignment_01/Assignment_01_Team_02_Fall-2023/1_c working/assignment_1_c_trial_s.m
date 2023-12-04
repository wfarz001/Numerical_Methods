clc; clear all; close all;
syms x
f=(log(1+x)/x); T=taylor(f);
ax=linspace(-30,30,100); % Define a range of x values for the plot
fy=double(subs(f,x,ax)); %original curve

x_val=[1,10];  N_val=[0,1,2,3,4,5,6,7,8,9,10,20,30,40,50];

results_1NM = zeros(length(N_val), length(N_val));  % Initialize a matrix to store results
results_10NM = zeros(length(N_val), length(N_val)); % Initialize a matrix to store results

for i= 1:length(N_val)
    N=N_val(i);  M=N_val(i);
    pd = pade(f,x,'Order',[N,M]); %[N,M] where N=N and M=N
    p(i) = subs(pd,x,vpa(1)); %get the value of pade approximate at value x=1
    q(i) = subs(pd,x,vpa(10)); %get the value of pade approximate at value x=10
    results_1NM(i, i) =p(i);   results_10NM(i, i) =q(i);
   
    T = taylor(f,x,'ExpansionPoint',0 ,'Order',N+1);  ft= double(subs(T,x,ax));
  for n=1:length(x_val)
        results(i,n)=double(subs(T,x,x_val(n))); %subsituting the value x=1or 10 in the T (taylor) function
  end
    syms s % Create a symbolic variable for the frequency variable (s)
    pade_laplace = subs(pd, x, s); % Convert the Pade approximant to the Laplace domain
    pade_values = double(subs(pade_laplace, s, ax));
    figure(1);  subplot(4,4,i);
    plot(ax, pade_values, 'r--', 'LineWidth', 1); % Pade approximant in red dashed
    hold on; plot(ax,fy, 'b', 'LineWidth', 1);
    hold on; plot(ax,ft,'g','Linewidth',1);
    hold off; ylim([-5,5]);
    hold off;
    xlabel('x'); ylabel('f(x), Taylors & Pade');
    legend('Pade','f(x)','Taylor');
    title('Plot of f(x), Taylor & Pade for M=N=',N); grid on; 
end

fprintf("For N=M the results for x=1 are: \n")
disp(results_1NM)
fprintf("For N=M the results for x=10 are: \n")
disp(results_10NM)

%Now for M=N+1

results_1NM1 = zeros(length(N_val), length(N_val));
results_10NM1 = zeros(length(N_val), length(N_val));

for i= 1:length(N_val)
    N=N_val(i);  M=N_val(i)+1;
    pd1 = pade(f,x,'Order',[N,M]); %[N,M] where N=N and M=N+1
    pa(i) = subs(pd1,x,vpa(1)); %get the value of pade approximate at value x=1
    qa(i) = subs(pd1,x,vpa(10)); %get the value of pade approximate at value x=10
    results_1NM1(i, i+1) =pa(i);  results_10NM1(i, i+1) =qa(i);
    
    T = taylor(f,x,'ExpansionPoint',0 ,'Order',N+1);  ft= double(subs(T,x,ax));
   for n=1:length(x_val)
        results(i,n)=double(subs(T,x,x_val(n))); %subsituting the value x=1 in the T (taylor) function
   end
    syms s % Create a symbolic variable for the frequency variable (s)
    pade_laplace1 = subs(pd1, x, s); % Convert the Pade approximant to the Laplace domain
    pade_values1 = double(subs(pade_laplace1, s, ax));
    figure(2); subplot(4,4,i);
    plot(ax, pade_values1, 'r--', 'LineWidth', 1); % Pade approximant in red dashed
    hold on; plot(ax,fy, 'b', 'LineWidth', 2);
    hold on; plot(ax,ft,'g','Linewidth',1);
    hold off; ylim([-5,5]);
    xlabel('x'); ylabel('f(x), Taylors & Pade');
    legend('Pade','f(x)','Taylor');
    title('Plot of f(x), Taylor & Pade for M=N+1 & N=',N); grid on;
end

fprintf("For M=N+1 the results for x=1 are: \n")
disp(results_1NM1)
fprintf("For M=N+1 the results for x=10 are: \n")
disp(results_10NM1)
