%% Gauss Seidel Method
clc;

%equation coefficients
A=[4 -1 0 -2 0 0 0 0 0;
   -1 4 -1 0 -2 0 0 0 0;
   0 -1 4 0 0 -2 0 0 0;
   -2 0 0 4 -1 0 0 0 0;
   0 -2 0 -1 4 -1 0 0 0;
   0 0 -2 0 -1 4 0 0 0;
   0 0 0 -2 0 0 4 -1 0;
   0 0 0 0 -2 0 -1 4 -1;
   0 0 0 0 0 -2 0 -1 4];

B=[ 20;0;30;20;0;30;20;0;30];  %Right hand side
[m,n] = size(A);
N=100;
err = 0.01;
x =[0 0 0 0 0 0 0 0 0];
XX(1,:) = x;
for k = 2 :N   
for i = 1:n
    s= 0;
    for j = 1:n
        if j~=i
            s=s+A(i,j)* x(j);
        end
    end
    x(i)= (1/A(i,i))*(B(i)-s);
end
XX(k,:)= x; kk= k;
Err = abs(max(XX(k,:)-XX(k-1,:))); if Err < err, break; end
end
disp(['The Roots are [' num2str(x) '], with accuracy: ' num2str(Err) ' , No iterations: ' num2str(kk)])