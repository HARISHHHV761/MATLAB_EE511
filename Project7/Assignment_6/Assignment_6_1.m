clc;
clear all;
Mean=[1 2 3];
Number_Of_Samples=1000;
Covariance_Matrix=[ 3 -1 1
    -1 5 3
    1 3 4];
A=chol(Covariance_Matrix,'lower'); % Calculatin the A matrix using choleski function

%--Calculating the Randdom Vector X using the formula X=A*Z+MEAN--%
for Iteration_Var1=1:Number_Of_Samples
    z1=normrnd(0,1);
    z2=normrnd(0,1);
    z3=normrnd(0,1);
    Z=[z1 z2 z3];
    X=A*Z.'+Mean.';
    Vector_X(Iteration_Var1,:)=X;
end 

%-- Calculating the Mean of all the Vector X1,X2,X3 --%
X1_Mean=mean(Vector_X(:,1));
X2_Mean=mean(Vector_X(:,2));
X3_Mean=mean(Vector_X(:,3));

%-- Calculating the Covariance of X12,X23,X14 --%
Covariance_X12=cov(Vector_X(:,1),Vector_X(:,2));
Covariance_X13=cov(Vector_X(:,1),Vector_X(:,3));
Covariance_X23=cov(Vector_X(:,2),Vector_X(:,3));


disp('The Sample mean of X1 is =');
disp(X1_Mean);
disp('The Sample mean of X2 is =');
disp(X2_Mean);
disp('The Sample mean of X3 is =');
disp(X3_Mean);

disp('The covaraince of X1 and X2 is =');
disp(Covariance_X12);
disp('The covaraince of X1 and X3 is =');
disp(Covariance_X13);
disp('The covaraince of X2 and X3 is =');
disp(Covariance_X23);

