% ------------------------------------------------------------------------------------------------
% Project 4 Question 2 : Empirical Distribution
% Author : Harish Holenarsipura Viswanatha  Date : 2/16/2017
% Calculate the empiral ditribution of the random variable and overlay the theoretical distribution
%--------------------------------------------------------------------------------------------------
function[]=Assignment4_2(Samples);
for Iteration_Var1=1:1:Samples
    Sum=0;
   for Iteration_Var2=1:1:4
    Random_Var_Z = randn();% Generating random variable Zi^2
    Sum=Sum+(Random_Var_Z^2);
    end
Random_Var_X(:,Iteration_Var1)=Sum;% Random Variable X=Summation of Zi^2
end
Random_Var_X1=sort(Random_Var_X);% Sort the Random Variable for chi2cdf() function.
[f,x]=ecdf(Random_Var_X);
% Converting the probabilities from columns to rows
for Iteration_Var3=1:1:Samples
    Proababilities_Empriical(:,Iteration_Var3)=f(Iteration_Var3+1);
end
cdfplot(Random_Var_X);% Empirical Distribution Function
hold on
Probabilities_Theoretical=chi2cdf(Random_Var_X1,4); %Theoretical distribution using chi2cdf function
plot(1:Samples,Probabilities_Theoretical,'linewidth',2);
title('The overlaying of theoretical distribution over empirical distribution')% Overlaying the theoretical distribution over emprical distribution
xlabel('The random variable values');
ylabel('The probability distribution');
hold off
% Calculatin the lower bound by iterating over all the sample sizes
for Iteration_Var2=1:1:Samples
   Lower_Bound=max(abs(Proababilities_Empriical(Iteration_Var2)-Probabilities_Theoretical(Iteration_Var2)));
end
Theoretical_90th= chi2inv(0.9,4);
Theoretical_50th=chi2inv(0.5,4);
Theoretical_25th=chi2inv(0.25,4);
Practical_25th=prctile(Random_Var_X1,25);
Practical_50th=prctile(Random_Var_X1,50);
Practical_90th=prctile(Random_Var_X1,90);
disp('The lower bound of the difference between empirical and the theoretical values=');
disp(Lower_Bound);
disp('The theoretical value of 25th percentile=');
disp(Theoretical_25th);
disp('The practical value of 25th percentile=');
disp(Practical_25th);
disp('The theoretical value of 50th percentile=');
disp(Theoretical_50th);
disp('The practical value of 50th percentile=');
disp(Practical_50th);
disp('The theoretical value of 90th percentile=');
disp(Theoretical_90th);
disp('The practical value of 90th percentile=');
disp(Practical_90th);
