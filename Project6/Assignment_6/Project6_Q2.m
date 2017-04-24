function Project6_Q2()
clc;
clear all;
Number_Of_Samples=1000;
% Sample code to find the maximum ratio c
pdfX = @(x) 1/gamma(5.5) .* x.^(9/2) .* exp(-x); % one-line function handle for f
pdfY = @(y) 2/11 * exp(-2*y/11); % one-line function handle for g
x = 0:0.01:8;
ratio = pdfX(x)./pdfY(x);
c = max(ratio);
Rejected_Samples=0;
%A constant obtained when we divide f(x)/cg(x)
Const=(11/(2*c*gamma(5.5)));
for Iteration_Var=1:Number_Of_Samples
    while(1)
        Random_Number=rand;
        Y=-5.5*log(Random_Number);
        if rand<((Const)*(Y^4.5)*exp(-9*Y/11))
            X(Iteration_Var)=Y;
            break;
        else
            Rejected_Samples=Rejected_Samples+1;
        end   
    end
end
Accepted_Rate=(Number_Of_Samples/(Rejected_Samples+Number_Of_Samples))*100; % Accepeted/(Rejected+Accepted)
figure(1)
yyaxis left
hist(X,20);
title('Overlaying of theoretical pdf over the histogram of the generrated samples');
xlabel('Values of X');
ylabel('Frequency of the samples generated');
yyaxis right
x=0:0.1:50;
Xvalues=gampdf(x,5.5,1);
plot(x,Xvalues);
ylabel('PDF of the gammma distribution');  
disp('The Acceptance rate in % ');
disp(Accepted_Rate);
end