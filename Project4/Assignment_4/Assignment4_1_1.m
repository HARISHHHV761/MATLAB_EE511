% ------------------------------------------------------------------------------------------------
% Project 4 Question 1(a) : Monte Carlo Simulation
% Author : Harish Holenarsipura Viswanatha  Date : 2/16/2017
% Monte Carlo Simulation done to calculate complex integration
%--------------------------------------------------------------------------------------------------
Sample_Size=1000;
Min_Limit=-2;
Max_Limit=2;
fun=@(x)exp((x+(x.^2)));
Theoretical_Integral=integral(fun,Min_Limit,Max_Limit);
for Iteration_Var1=1:1:Sample_Size 
    Independent_Random_Variable=0;
    Random_Number= -2+(2+2)*rand();
    % Summation of the random variables to simulate Monte Carlo Method
    Independent_Random_Variable=Independent_Random_Variable+exp(Random_Number+(Random_Number.^2))*(Max_Limit-Min_Limit); 
    Integral_Random_Variable(:,Iteration_Var1)=Independent_Random_Variable;
end
%Mean would give us the Expected Value of the function.
Monte_Carlo_Integration=mean(Integral_Random_Variable);
disp('The integration calcultaed using Monte Carlo Method is =');
disp(Monte_Carlo_Integration);
disp('The Theoretical Value calculated using integral function is=');
disp(Theoretical_Integral);