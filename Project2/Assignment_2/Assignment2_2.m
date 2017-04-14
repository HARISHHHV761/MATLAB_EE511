%************************************************************************%
%The standard uniform distribution is generated . 
%The sequence A is calculated by drawing samples from the distribution.
%The sequence B is calculated by right shifting A to one position.
%The covariance between A and B is calculated.
%The relation between the 2 sequence are decided upon the covariance value
%*************************************************************************%
function[]= Assignment2_2(Number_Samples);
for Iteration_Var2=1:1:Number_Samples
random_number= rand(); 
Vector_A(:,Iteration_Var2)=random_number;
end

%The logic to right shift the sequence B by one element.
Vector_B=zeros(size(Vector_A));
n=1; 
Vector_B(n+1:end)=Vector_A(1:end-n);

disp('The sequence A =');
disp(Vector_A);
disp('The sequence B =');
disp(Vector_B);
Covariance=cov(Vector_A,Vector_B); %The covariance of sequence A and B is calculated. 
disp('The covariance of the sequences A and B');
disp(Covariance);
Covar=Covariance(1,2);
disp('The covariance of X and Y=');
disp(Covar)
if(Covar==0)
    disp('The two sequences are uncorrelated');
elseif(Covar<0)
    disp('The two sequences are negatively related');
else
    disp('The two sequences are positively related');
end 