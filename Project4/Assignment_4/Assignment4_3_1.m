% ------------------------------------------------------------------------------------------------
% Project 4 Question 3 : Statistical Confidence Interval
% Author : Harish Holenarsipura Viswanatha  Date : 2/16/2017
% Comparing the intervals done using bootstrap and statistical intervals
% ALL THE DATA SAMPLES(272)
%-------------------------------------------------------------------------------------------------
%Population data taken for 272 samples
Waiting_Time = [79	54	74	62	85	55	88	85	51	85	54	84	78	47	83	52	62	84	52	79	51	47	78	69	74	83	55	76	78	79	73	77	66	80	74	52	48	80	59	90	80	58	84	58	73	83	64	53	82	59	75	90	54	80	54	83	71	64	77	81	59	84	48	82	60	92	78	78	65	73	82	56	79	71	62	76	60	78	76	83	75	82	70	65	73	88	76	80	48	86	60	90	50	78	63	72	84	75	51	82	62	88	49	83	81	47	84	52	86	81	75	59	89	79	59	81	50	85	59	87	53	69	77	56	88	81	45	82	55	90	45	83	56	89	46	82	51	86	53	79	81	60	82	77	76	59	80	49	96	53	77	77	65	81	71	70	81	93	53	89	45	86	58	78	66	76	63	88	52	93	49	57	77	68	81	81	73	50	85	74	55	77	83	83	51	78	84	46	83	55	81	57	76	84	77	81	87	77	51	78	60	82	91	53	78	46	77	84	49	83	71	80	49	75	64	76	53	94	55	76	50	82	54	75	78	79	78	78	70	79	70	54	86	50	90	54	54	77	79	64	75	47	86	63	85	82	57	82	67	74	54	83	73	73	88	80	71	83	56	79	78	84	58	83	43	60	75	81	46	90	46	74];
Population_Mean= mean(Waiting_Time);
Sample_Size=272;
Samples=100;
%T=tinv(0.95,271);
for Iteration_Var2=1:1:Samples;
%Iterations to calculate the random numbers for simulating 15 data samples.
for Iteration_Var1=1:1:Sample_Size;
    Vector_A(:,Iteration_Var1)=randi([44 125]);
end
% Calculating the mean and the standard deviation of the the 272 samples and store it in vector
Temp_Mean_xbar(:,Iteration_Var2)=mean(Vector_A);
Temp_Standard_Devaition_S(:,Iteration_Var2)=std(Vector_A);
% Use the formula to calculate the critical values(t values) for all the data samples
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
disp(Temp_Mean_xbar);
disp(Mean_Marginal_Error_Positive);
disp('The upper bound confidence interval for all data samples'); 
disp(Confidence_Interval_POS);
disp('The lower bound confidence interval for all data samples'); 
disp(Confidence_Interval_NEG);
disp('The bootstrap confidence interval is');
disp(BOOT);















