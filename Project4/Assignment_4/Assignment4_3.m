% ------------------------------------------------------------------------------------------------
% Project 4 Question 3 : Statistical Confidence Interval
% Author : Harish Holenarsipura Viswanatha  Date : 2/16/2017
% Comparing the intervals done using bootstrap and statistical intervals
% 15 DATA SAMPLES
%--------------------------------------------------------------------------------------------------
%Population data taken for 15 samples
Waiting_Time = [79,54,74,62,85,55,88,85,51,85,54,84,78,47,83];
Population_Mean= mean(Waiting_Time);% Here the sample mean is the population mean
Sample_Size=15;
Samples=100; 
%T=tinv(0.95,Sample_Size-1);
for Iteration_Var2=1:1:Samples;
% Iterations to calculate the random numbers for simulating 15 data samples.
for Iteration_Var1=1:1:Sample_Size;
    Vector_A(:,Iteration_Var1)=randi([44 125]);
end
% Calculating the mean and the standard deviation of the the 15 samples and store it in vector
Temp_Mean_xbar(:,Iteration_Var2)=mean(Vector_A);
Temp_Standard_Devaition_S(:,Iteration_Var2)=std(Vector_A);
% Use the formula to calculate the critical values(t values) for the 15 data samples
T_distribution(:,Iteration_Var2)=(Temp_Mean_xbar(:,Iteration_Var2)-Population_Mean)/(Temp_Standard_Devaition_S(:,Iteration_Var2)/sqrt(Sample_Size));
%Standard deviation error is calculated as per the formula and used in the calculation of margin of error
Standard_Deviation_Error(:,Iteration_Var2)= Temp_Standard_Devaition_S(:,Iteration_Var2)/sqrt(Sample_Size);
%Margin of error is the statistic interval range
Margin_of_Error(:,Iteration_Var2)=Standard_Deviation_Error(:,Iteration_Var2)*T_distribution(:,Iteration_Var2);
end
Mean_Marginal_Error_Positive= mean(Margin_of_Error);
% Add and subtract the margin of error with the population mean to get the statistic confidence interval
Confidence_Interval_POS=Population_Mean+Mean_Marginal_Error_Positive;
Confidence_Interval_NEG=Population_Mean-Mean_Marginal_Error_Positive;
% Calculation of bootstrap confidence interval
BOOT=bootci(Samples,@mean,Waiting_Time);
%disp(Temp_Mean_xbar);
%disp(Mean_Marginal_Error_Positive);
disp('The Confidence Interval calculated positive marginal error'); 
disp(Confidence_Interval_POS);
disp('The Confidence Interval_with negative marginal error'); 
disp(Confidence_Interval_NEG);
disp('The bootstrap confidence interval is');
disp(BOOT);















