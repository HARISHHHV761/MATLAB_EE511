clc;
clear all;
Number_Samples=5000;
%--Generating the samples based on the equation f(x)=0.4*N(-1,1)+0.6*N(1,1)--%
for Iteration_Var1=1:Number_Samples
    Random_Number=rand<=0.4;
    Mixture_Pdf(:,Iteration_Var1)=Random_Number.*normrnd(-1,1)+(1-Random_Number).*normrnd(1,1);
end
%--Histogram of the generated samples--------%
figure(1)
yyaxis left
hist(Mixture_Pdf,30);
title('Theoretical pdf generated over the histogram for the mixture distribution f(x)');  
xlabel('Range of X');
ylabel('Frequency');

%--Calculating and overlaying the Theoretical PDF of the mixture distribution---%
yyaxis right
xaxis=-3:0.1:3;
Theoretical_Normal_Pdf=0.4*normpdf(xaxis,-1,1)+0.6*normpdf(xaxis,1,1);
plot(xaxis,Theoretical_Normal_Pdf);
ylabel('Theoretical Normal PDF of the mixture distribution');
legend({'Histogram of sample','Theoretical Normal PDF'},'FontSize',5)