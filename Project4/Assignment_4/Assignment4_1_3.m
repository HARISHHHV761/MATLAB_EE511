% ------------------------------------------------------------------------------------------------
% Project 4 Question 1(c) : Monte Carlo Simulation
% Author : Harish Holenarsipura Viswanatha  Date : 2/16/2017
% Monte Carlo Simulation done to calculate doubel integral
%--------------------------------------------------------------------------------------------------
function[]=Assignment4_1_3(Sample_Size);
X_Min=0;
X_Max=1;
Y_Min=0;
Y_Max=1;
fun=@(x,y)exp(-((x+y).^2));
Theoretical_Integral=integral2(fun,X_Min,X_Max,Y_Min,Y_Max);% Function to calculate double integral
for Iteration_Var1=1:1:Sample_Size 
    Independent_Random_Variable=0;
    Random_Number_X=rand();
    Random_Number_Y=rand();
   % Summation of the random variables to simulate Monte Carlo Method
    Independent_Random_Variable=exp(-((Random_Number_X+Random_Number_Y)^2));
    Integral_Random_Variable(:,Iteration_Var1)=Independent_Random_Variable;
end
%Mean would give us the Expected Value of the function.
Monte_Carlo_Integration=mean(Integral_Random_Variable);
disp('The integration calcultaed using Monte Carlo Method is =');
disp(Monte_Carlo_Integration);
disp('The Theoretical Value calculated using integral function is=');
disp(Theoretical_Integral);