%************************************************************************%
%The standard uniform distribution is generated . 
%The sequence X is calculated by drawing samples from the distribution.
%The sequence Y is based on the equation in the problem
%X[K-1] is right shifting to one position of X[K]
%X[K-2] ,X[K-3] is the same changing only the shift positions.
%Each X[K-1] is assigned to a different vector
%The covariance between X and Y is calculated.
%The relation between the 2 sequence are decided upon the covariance value
%*************************************************************************%
function[]= Assignment2_2_1(Number_Samples);
for Iteration_Var2=1:Number_Samples
random_number= rand(); %Generating random  real numbers between 0 and 1
Vector_A(:,Iteration_Var2)=random_number;
end
disp('The sequence X[K]=');
disp(Vector_A);
Length_A=length(Vector_A);

%The logic to right shift the sequence B by one element.
Vector_B=zeros(size(Vector_A));
n=1; %Shift units
Vector_B(n+1:end)=Vector_A(1:end-n);
disp('The sequence X[K-1]=');
disp(Vector_B);

%The logic to right shift the sequence C by one element.
Vector_C=zeros(size(Vector_A));
n=2; %Shift units
Vector_C(n+1:end)=Vector_A(1:end-n);
disp('The sequence X[K-2]=');
disp(Vector_C);

%The logic to right shift the sequence D by one element
Vector_D=zeros(size(Vector_A));
n=3; %Shift units
Vector_D(n+1:end)=Vector_A(1:end-n);
disp('The sequence X[K-3]=');
disp(Vector_D);

%The equation used to calculate the sequence Y
for K=1:1:Length_A
Vector_Y(:,K)=Vector_A(:,K)-2*Vector_B(:,K)+0.5*Vector_C(:,K)-Vector_D(:,K); % Y[K]=X[K]-2.X[K-1]+0.5.X[K-2]-X[K-3]
end
disp('The sequence Y[K]=');
disp(Vector_Y);

Covariance=cov(Vector_A,Vector_Y); %The covariance of X and Y is calculated
disp('The covariance matrix of X and Y=');
disp(Covariance);
Covar=Covariance(1,2);
disp('The covariance of X and Y=');
disp(Covar);
if(Covar==0)
    disp('The two sequences are uncorrelated');
elseif(Covar<0)
    disp('The two sequences are negatively related');
else
    disp('The two sequences are positively related');
end 
end