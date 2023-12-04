syms y1 y2 y z t t1 t2 h z1 z2

S1 = z;

S2 =  -1001*z-1000*y;

SS1 = y2- y1 - h*subs(S1,{y z},[y2 z2]); 

SS2 = z2- z1 - h*subs(S2,{y z},[y2 z2]); 
EQN1 = SS1 ==0;
Y = solve(EQN1,y2);

EQN2 = SS2 ==0;
Z = solve(EQN2,z2);

H_values=[0.1 0.2 0.3 0.4 0.5]; %different step size
C = {'red','green','blue','yellow','magenta'}

YN(1)=1;
ZN(1)=0;

%%%Analytical Solution based on the calculation%%%%%%%%%
% Define the range of x values
x_values = 0:0.5:5;

% Define the constants C1 and C2
C1 = 1 + 1/999;
C2 = -1/999;

% Calculate the y values for the given x range
y_values = (C1 * exp(-x_values)) - (C2 * exp(-1000 * x_values));
plot(x_values, y_values, 'black', 'LineWidth', 2);
grid on;
hold on

%%%%%%%Explicit Euler's Method with different step size%%%%%%%%%%%%%%%%%%%%%%%

for j = 1:length(H_values)
    fprintf('The value of step size')
    H = H_values(j)
    %Cii=C(j);
    fprintf('=================================\n');
    T=0:H:5;
    YN =(size(T));
    fprintf(' S.No.   h \t \t   y1 \t \t \t   y2 \t \n');
    fprintf('------------------------------------------\n');
    fprintf('  1.0 \t  %4.4f \t \t %4.4f \t %4.4f \n',T(1), YN(1), ZN(1));
    for i=2:length(T)
    EQ1=subs(EQN1,{y1 z1 h},[YN(i-1) ZN(i-1) H]);
    EQ2=subs(EQN2,{y1 z1 h},[YN(i-1) ZN(i-1) H]);
    [solx,soly] = solve(EQ1,EQ2);
    YN(i) = double(solx);
    ZN(i) = double(soly);
    fprintf(' %4.1f \t  %4.4f \t \t %4.4f \t \t %4.4f \t \n',i,T(i),YN(i), ZN(i));  
    end
    plot(T, YN, 'color',C{j}, 'LineWidth', 1);
    legend ('Analytical Solution','h=0.1', ' h=0.2','h=0.3','h=0.4','h=0.5')
    xlabel('x');
    ylabel('y(x)');
    title('Explicit Euler Method Solution with different step size');
    grid on;
    hold on
end
