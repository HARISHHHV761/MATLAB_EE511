%**********************************************************************%
%A uniform random variable is generated between interval [-3,2]
%%A function is created for reusability giving multiple sampling values
%The sample mean and the sample variance is calculated.
%The theoritical and observed mean,std and variance are calculated.
%The bootstrap confidence interval for mean and std are calculated .
%**********************************************************************%

function[]=Assignment2(Number_Samples,bootstrap_interval);
lower_interval=-3;
Upper_Interval=2;
Sampling = lower_interval + (Upper_Interval-lower_interval)*rand(1,(Number_Samples)); % Generting uniform random variable distribution
Theory_Mean= (Upper_Interval+lower_interval)/2;
Theory_Std=(Upper_Interval-lower_interval)^2/12;
Theory_Var=(Upper_Interval-lower_interval)/sqrt(12);
Practical_Mean=mean(Sampling);  
Practical_Var=var(Sampling);
Practical_Std=std(Sampling);
disp('The theoritical mean of the sample=');
disp(Theory_Mean);
disp('The practical mean of the sample=');
disp(Practical_Mean);
disp('The theoritical standard deviation of the sample=');
disp(Theory_Std);
disp('The practical standard deviation of the sample=');
disp(Practical_Std);
disp('The theoritical variance of the sample=');
disp(Theory_Var);
disp('The practical variance of the sample=');
disp(Practical_Var);
histogram(Sampling);
title('The histogram of the uniform random variable')
xlabel('The random variable interval values')
ylabel('The relative frequency of the number of samples');
disp('The bootstrap confidence interval of sample mean');
Ci_Mean = bootci(bootstrap_interval,@mean,Sampling) % Calculates the bootstrap confidence interval for sample mean
disp('The bootstrap confidence interval of sample mean');
Ci_Std = bootci(bootstrap_interval,@std,Sampling) % Calculates the bootstrap confidence interval for sample standard deviation
end