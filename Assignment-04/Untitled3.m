%Estado estable.
%Orlando Ramirez Barron.
%Factorizacion LU.
clc
clear all
fprintf('Factorizacion LU');
%
%Dimensiones de la matriz aleatoria
%m=input('        Introduzca el numero de filas de la matriz');
%%B=(10*rand(m,n));
B=[2, 3; 1, 2]
%
[n,m]=size(B);
% Matrices iniciales propuestas L y U
L=zeros(length(B)); %Matriz L de elementos zero
U=zeros(length(B)); %Matriz U de elementos zero
if n==m 
    for j=1:length(B)
        for i=1:length(B)
            sum=0;
            q=j-1;
            for k=1:q
                sum=sum+(L(i,k)*U(k,j));
            end
            if i==j
                U(i,j)=1;
            end
            if i >=j
                L(i,j)=B(i,j)-sum; %Gen matriz triangular inf
            else
                U(i,j)=(1/L(i,i))*(B(i,j)-sum); %Gen matriz triangular sup
            end
        end
    end
else
end
if n==m
    B
    L
    U
    LU=L*U
else
    disp('la matriz no es cuadrada')
end
