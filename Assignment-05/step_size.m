syms y1 y2 y z t t1 t2 h z1 z2

S1 = z;

S2 =  -1001*z-1000*y;

SS1 = y2- y1 - h*subs(S1,{y z},[y2 z2]); 

SS2 = z2- z1 - h*subs(S2,{y z},[y2 z2]); 
EQN1 = SS1 ==0;
Y = solve(EQN1,y2);

EQN2 = SS2 ==0;
Z = solve(EQN2,z2);

H=0.5;
T=0:H:5;

YN(1)=1;
ZN(1)=0;

fprintf('------------------------------------------\n');
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
fprintf('=================================\n');
plot(T, YN, 'r', 'LineWidth', 2);
xlabel('x');
ylabel('y(x)');
title('Explicit Euler Method Solution');
grid on;
