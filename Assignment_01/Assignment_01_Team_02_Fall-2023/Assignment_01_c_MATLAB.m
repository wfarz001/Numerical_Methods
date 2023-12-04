syms x
f=(log(1+x)/x);
% p22 = pade(f,'Order',[4,4]) %[N,M]
% p22 = subs(p22,x,vpa(2)) %get the value of pade approximate at value x=2

%At first, generate results following the reference to understand the
%simulation
%Reference:https://www.colorado.edu/amath/sites/default/files/attached-files/pade_2.pdf

% N_val=[0,1,2,3,4];
% % Initialize a matrix to store results
% results = zeros(length(N_val), length(N_val));
% for i= 1:length(N_val)
%     N=N_val(i)
%     M=N_val(i)
%     p22 = pade(f,'Order',[N,M]); %[N,M] where N=N+1 and M=N
%     p22 = subs(p22,x,vpa(2)); %get the value of pade approximate at value x=2
%     results(i, i) =p22
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%PN (x = 1) for N = 0,1,2,3,4,5,6,7,8,9,10,20,30,50 (Assignmnet C)
%%%%when N=M and M=N and x=1


N_val=[0,1,2,3,4,5,6,7,8,9,10,20,30,50];
% Initialize a matrix to store results
results = zeros(length(N_val), length(N_val));
for i= 1:length(N_val)
    N=N_val(i);
    M=N_val(i);
    p22 = pade(f,'Order',[N,M]); %[N,M] where N=N and M=N
    p22 = subs(p22,x,vpa(1)); %get the value of pade approximate at value x=1
    results(i, i) =p22;
end
disp(results)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%PN (x = 1) for N = 0,1,2,3,4,5,6,7,8,9,10,20,30,50 (Assignmnet C)
%%%%when N=M and M=N and x=10

% N_val=[0,1,2,3,4,5,6,7,8,9,10,20,30,50];
% % Initialize a matrix to store results
% results = zeros(length(N_val), length(N_val));
% for i= 1:length(N_val)
%     N=N_val(i);
%     M=N_val(i);
%     p22 = pade(f,'Order',[N,M]); %[N,M] where N=N and M=N
%     p22 = subs(p22,x,vpa(10)); %get the value of pade approximate at value x=1
%     results(i, i) =p22;
% end
% disp(results)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%when N=N+1 and M=N at x=1


% N_val=[0,1,2,3,4,5,6,7,8,9,10,20,30,50];
% % Initialize a matrix to store results
% results = zeros(length(N_val), length(N_val+1));
% for i= 1:length(N_val)
%     N=N_val(i)+1;
%     M=N_val(i);
%     p22 = pade(f,'Order',[N,M]); %[N,M] where N=N+1 and M=N
%     p22 = subs(p22,x,vpa(1)); %get the value of pade approximate at value x=1
%     results(i, i) =p22;
% end
% disp(results)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%when N=N+1 and M=N at x=10

% 
% N_val=[0,1,2,3,4,5,6,7,8,9,10,20,30,50];
% % Initialize a matrix to store results
% results = zeros(length(N_val), length(N_val+1));
% for i= 1:length(N_val)
%     N=N_val(i)+1;
%     M=N_val(i);
%     p22 = pade(f,'Order',[N,M]); %[N,M] where N=N+1 and M=N
%     p22 = subs(p22,x,vpa(10)); %get the value of pade approximate at value x=1
%     results(i, i) =p22;
% end
% disp(results)
