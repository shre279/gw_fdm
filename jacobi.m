%% Jacobi iterative method to solve 1-D GW ODE.
clc; clear all;

tic;
tol = 1e-9; %threshold between two solution
max_iter = 1e6; % max number of iteration
% Equation in the form of matrix

A=[4 -1 0 -2 0 0 0 0 0;
   -1 4 -1 0 -2 0 0 0 0;    %Equation coefficients
   0 -1 4 0 0 -2 0 0 0;
   -2 0 0 4 -1 0 0 0 0;
   0 -2 0 -1 4 -1 0 0 0;
   0 0 -2 0 -1 4 0 0 0;
   0 0 0 -2 0 0 4 -1 0;
   0 0 0 0 -2 0 -1 4 -1;
   0 0 0 0 0 -2 0 -1 4];

B=[ 20;0;30;20;0;30;20;0;30];  %Right hand side

n = length(B); %number of equations
A = [A B];  % extended matrix of A by B
x1 = zeros(1,n);    %Initial assumption of variables

% main loop

 k = 1;
 while k <= max_iter
   err = 0;
   for i = 1 : n
      s = 0;
      for j = 1 : n
        s = s-A(i,j)*x1(j);
      end
      s = (s+A(i,n+1))/A(i,i);
      
      if abs(s) > err
        err = abs(s);
      end
      
      x2(i) = x1(i)+s;
     
  end

  if err <= tol
     break;
  else
     k = k+1;
     for i = 1 : n
       x1(i) = x2(i);
     
     end
  end
 end

 fprintf('Solution vector after %d iterations is :\n', k-1);
 for i = 1 : n
    
    fprintf(' %11.8f \n', x2(i));
  
 end

toc

