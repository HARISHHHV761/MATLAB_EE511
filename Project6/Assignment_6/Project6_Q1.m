function Project6_Q1()
clear;
clear all;
Generation_Sample_Box_Muller();
Generation_Samples_Polar_Marsaglia();
end

% Function to calculate the covariance of X and Y using Box Muller Method
function Generation_Sample_Box_Muller()
Mean_Random_Var_X = 1; 
Variance_Random_Var_X = 4;
Mean_Random_Var_Y = 2; 
Variance_Random_Var_Y = 9; 
for Iteration_Performance=1:1:10 % The loop is to calculate the time(Performance) of Box muller method
tic; % Start the timer to calculate the performance
Number_Of_Samples=1000000;
Random_Variable_1 = rand(Number_Of_Samples,1);
Random_Variable_2 = rand(Number_Of_Samples,1);
% Algorithm of Box Muller method
% Generate X and Y that are normal random with mean 0 and variance 1
X = sqrt( - 2*log(Random_Variable_1)).*cos(2*pi*Random_Variable_2 ); 
Y = sqrt( - 2*log(Random_Variable_1)).*sin(2*pi*Random_Variable_2 );

% Convert or scale the Variables based on the mean of X and Y required
x = sqrt(Variance_Random_Var_X)*X + Mean_Random_Var_X; 
y = sqrt(Variance_Random_Var_Y)*Y + Mean_Random_Var_Y; 

Total_Time_Elapsed(:,Iteration_Performance)=toc; % Read elapsed time from stopwatch
end
A = x+y;
% Plot sample and overlay the theoretical pdf
figure(1)
title('The theoretical pdf of A overlaid on the generated samples of A using BOX MULLER METHOD');
yyaxis left 
ylabel('The frequency of the generated samples'); 
hist(A);
X_axis=-50:0.1:50;
A_Theoretical=normpdf(X_axis,(Mean_Random_Var_X+Mean_Random_Var_Y),(Variance_Random_Var_X+Variance_Random_Var_Y));
yyaxis right 
ylabel('The normal pdf value of the random variable');
plot(X_axis,A_Theoretical);

% sample mean ,variance and Theoretical mean and variance  
A_mean= mean(A);
A_var= var(A);

Mean_X=mean(x);
Mean_Y=mean(y);
A_Theoretical_Mean =Mean_Random_Var_X+Mean_Random_Var_Y;
A_Theoretical_Variance =Variance_Random_Var_X+Variance_Random_Var_Y;
Variance_Random_Var_X=var(x);
Variance_Random_Var_Y=var(y);
Covariace_XY=cov(x,y);
disp('--------------The Box Muller Computation produces the following results--------')
disp('Mean of X random variable');
disp(Mean_X);
disp('Mean of Y random variable');
disp(Mean_Y);
disp('Variance of the random Variable X');
disp(Variance_Random_Var_X);
disp('Variance of the random Variable Y');
disp(Variance_Random_Var_Y);
disp('Covariance of X and Y is');
disp(Covariace_XY(1,2));
disp('The total time taken for Box Muller Method');
disp(Total_Time_Elapsed);
disp('The sample mean of A is = ');
disp(A_mean);
disp('The sample variance of A is = ');
disp(A_var);
disp('The Theoretical  mean of A is = ');
disp(A_Theoretical_Mean);
disp('The Theoretical variance of A is = ');
disp(A_Theoretical_Variance);
end

% Function to calculate the covariance of X and Y using Polar Marsagalia Method
function Generation_Samples_Polar_Marsaglia()
Mean_X = 1; 
Variance_X = 4; 
Mean_Y = 2; 
Variance_Y = 9; 
A_Theoretical_Mean=Mean_X+Mean_Y;
A_Theoretical_Variance=Variance_X+Variance_Y;

Iteration_Var = 0; % the random number generated by the algorithm 
Number_of_Samples=1000000;

for Iteration_Performance=1:1:10
tic;% Start the timer
% Algorithm for POLAR MARSAGALIA METHOD
% Generate X and Y that are N(0,1) random variables and independent
while(Iteration_Var<=Number_of_Samples)
    Random_Var1 = 2*rand()-1;
    Random_Var2 = 2*rand()-1;
    Random_Var_A = Random_Var1^2 + Random_Var2^2;
    if(Random_Var_A < 1)
        Iteration_Var = Iteration_Var + 1;
        X(Iteration_Var) = sqrt(-2*log(Random_Var_A)/Random_Var_A)*Random_Var1;
        Y(Iteration_Var) = sqrt(-2*log(Random_Var_A)/Random_Var_A)*Random_Var2;
    end
end

% Convert or scale the Variables based on the mean of X and Y required
x = sqrt(Variance_X)*X + Mean_X; 
y = sqrt(Variance_Y)*Y + Mean_Y; 
Total_Time_Elapsed(:,Iteration_Performance)=toc;% Read elapsed time from stopwatch

%Calculate the mean, variance of A 
A = x+y;
% Plot sample and overlay the theoretical pdf
figure(2)
title('The theoretical pdf of A overlaid on the generated samples of A using Polar Marsagalia method');
yyaxis left 
ylabel('The frequency of the generated samples');
hist(A);
X_axis=-50:0.1:50;
A_Theoretical=normpdf(X_axis,(Mean_X+Mean_Y),(Variance_X+Variance_Y));
yyaxis right 
ylabel('The normal pdf value of the random variable');
plot(X_axis,A_Theoretical);

% sample mean ,variance and Theoretical mean and variance  
A_mean= mean(A);
A_var= var(A);

end
Calculated_mean_X=mean(x);
Calculated_mean_Y=mean(y);
Calculate_Variance_X=var(x);
Calculated_Y=var(y);
Covariace_XY=cov(x,y);
disp('------POLAR MARSAGALIA METHOD produces the following results-----');
disp('The total time taken for polar marsagalia method');
disp(Total_Time_Elapsed);
disp('Calculated mean of X random variable');
disp(Calculated_mean_X);
disp('Calculated mean of Y random variable');
disp(Calculated_mean_Y);
disp('Variance of X random Variable');
disp(Calculate_Variance_X);
disp('Variance of Y random Variable');
disp(Calculated_Y);
disp('Covariance of X and Y is ');
disp(Covariace_XY(1,2));
disp('The sample mean of A is = ');
disp(A_mean);
disp('The sample variance of A is = ');
disp(A_var);
disp('The Theoretical  mean of A is = ');
disp(A_Theoretical_Mean);
disp('The Theoretical variance of A is = ');
disp(A_Theoretical_Variance);
end