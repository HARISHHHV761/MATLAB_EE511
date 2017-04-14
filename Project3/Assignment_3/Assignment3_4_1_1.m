Sample_Size=10000;
Nor = 4.679;
Probability=1/Nor;
SpecProbability=Probability/60;;
for Iteration_Var=1:1:Sample_Size
    count=0;
    while(rand >=SpecProbability)
        count=count+1;
    end
    Georand_Vector(:,Iteration_Var)=geornd(SpecProbability);
    Practical_Vector(:,Iteration_Var)=count;
end
Practical_Mean=mean(Practical_Vector);
Georand_Mean=mean(Georand_Vector);
Theoretical_Mean=1/(SpecProbability);
Theoretical_Variance=(1-SpecProbability)/(power(SpecProbability,2));
Variance=var(Practical_Vector);
disp('The Theoretical Value of Mean');
disp(Theoretical_Mean)
disp('The Expected Value or the mean calculated');
disp(Practical_Mean);
disp('The Mean calculated from georand function');
disp(Georand_Mean);
disp('The variance calculated from the experiment');
disp(Variance);
disp('The Theoretical Value of Variance');
disp(Theoretical_Variance)
histogram(Practical_Vector);
title('The histogram represents the random variable calculated for 10000 samples');
xlabel('Different values taken to reach the p/60th value');
ylabel('Frequency of the values taken to reach p/60th value');
