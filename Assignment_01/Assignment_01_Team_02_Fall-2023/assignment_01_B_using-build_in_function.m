syms x
N_val=[1, 3, 5, 7, 9, 10, 20, 30, 50];

for i= 1:length(N_val)
    N=N_val(i)
    %fprintf('The value of N:',N)
    f=(log(1+x)/x);
    fprintf('The taylor series expansion at x=0')
    T = taylor(f,x,'ExpansionPoint',0,'Order',N+1) %using taylor function to expnad the series at x=0 for order N
    sympref('PolynomialDisplayStyle','ascend'); %to print the series in ascending order
    fprintf('Putting the value of x=1')
    %x=1;
    subs(T,x,1) %subsituting the value x=1 in the T (taylor) function
    fprintf('Putting the value of x=10')
    subs(T,x,10) %subsituting the value x=10 in the T (taylor) function
end
