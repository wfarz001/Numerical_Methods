% given equation coefficients
A=[2,-6,-1;-3,-1,7;-8,1,-2];
B=[-38;-34;-20];
M=[A B]; %augmented matrix

n=rank(M);
m=length(A);
if(m~=n) %if rank is less than no. of rows means inf solution
display("Infinite soultion possible")
end

for k=1:n-1;
max=0;
index=0;
% find index of col with max value
for j=k:n
if abs(M(j,k))>max
max=abs(M(j,k));
index=j;
end
end
%swap rows if index is not k
if(index==k)
display("No change in order of rows");
else
display("Row "+k+" and "+index+" swapped");
for j=1:n+1
temp=M(index,j);
M(index,j)=M(k,j);
M(k,j)=temp;
end
end
%Gaussian elimination
for i=(k+1):n
fact=M(i,k)/M(k,k);

for j=k:n+1
M(i,j)=M(i,j)-fact*M(k,j);
end
end
display("Augmented Matrix after step "+k)
display(M)
end
%backward subsitution
x(n)=0;
x=x'; % x is column vector containing of n rows
x(n)=M(n,n+1)/M(n,n);
i=n-1;
while i>0
x(i)=(M(i,n+1)-M(i,i+1:n)*x(i+1:n))/(M(i,i));
i=i-1;
end
display("Solution of above equation is")
display(x)
% calculate determinant
determinant=1;
% determinant of triangular matrix is product
% of the diagonal elements
for i=1:n
determinant=determinant*M(i,i);
end
display("Determinant of matrix is "+determinant)


%verifying result by substitution
display("Value of each equation after putting solution x")
for i=1:n
ans=0;
for j=1:n
ans=ans+A(i,j)*x(j);
end
ans=ans-B(i);
display("Value of equation "+i+" = "+ans)
end