% ------------------------------------------------------------------------------------------------
% Project 4 Question 1(b) : Monte Carlo Simulation
% Author : Harish Holenarsipura Viswanatha  Date : 2/16/2017
% Monte Carlo Simulation done to calculate doubel integral
%--------------------------------------------------------------------------------------------------
Sample_Size=1000;
fun=@(x)exp(-(x.^2));
Theoretical_Integral=integral(fun,-inf,inf);
% Calculating integration from -infinity to 0
for Iteration_Var1=1:1:Sample_Size 
    Independent_Random_Variable1=0;
    Random_Number=rand();
    % Summation of the random variables to simulate Monte Carlo Method
    Independent_Random_Variable1=((1/(Random_Number.^2))*exp(-((1/(Random_Number))-1).^2));%*(Max_Limit-Min_Limit); 
    Integral_Random_Variable1(:,Iteration_Var1)=Independent_Random_Variable1;
end
% Calculating integration from 0 to infinity
for Iteration_Var1=1:1:Sample_Size 
    Independent_Random_Variable2=0;
    Random_Number=rand();
    % Summation of the random variables to simulate Monte Carlo Method
    Independent_Random_Variable2=Independent_Random_Variable2+((1/(Random_Number.^2))*exp(-((1/(Random_Number))-1).^2));%*(Max_Limit-Min_Limit); 
    Integral_Random_Variable2(:,Iteration_Var1)=Independent_Random_Variable2;
end
%Mean would give us the Expected Value of the function.
Mean1=mean(Integral_Random_Variable1);
Mean2=mean(Integral_Random_Variable2);
Monte_Carlo_Integration=Mean1+Mean2;
disp('The integration calcultaed using Monte Carlo Method is =');
disp(Monte_Carlo_Integration);
disp('The Theoretical Value calculated using integral function is=');
disp(Theoretical_Integral);