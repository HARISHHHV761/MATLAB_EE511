%************************************************************************%
%The standard uniform distribution is generated datasample() function 
%The function takes the sampling number and interval range as arguments.  
%A function is created for different interval and samplings.
%The goodness of fit test is calculated based on the data we have taken
%The result is basically about accepting or rejecting null hypothesis 

%*************************************************************************%
function[]=Assignment2_3(a,b,Number_Samples);
Sampling = datasample(a:b,Number_Samples); % Generates the data samples with replacement with sampling number and the interval data as arguments
disp(Sampling);
histogram(Sampling);
title('The histogram of the sampling ditribution');
xlabel('The interval data');
ylabel('The frequency of the interval data(Number of samples)');
[h p stats]= chi2gof(Sampling,'Expected',[10 10 10 10 10 10 10 10 10 10]);
disp(stats);
if(h==1)
disp('Data does not come from such a distribution,The test rejects the null hypothesis');
else
disp('Data does comes from such a distribution ,The test satisfies the null hypothesis');
end
%3.c: Taking the same data and checking whether it fits 1 to 10 
[h1 p1 stats1]= chi2gof(Sampling,'Expected',[0 10 10 10 10 10 10 10 10 10 10]);
disp('Checking the sampling data of [0 9] fitting [0 9] distribution');
disp(p1);
disp(stats1);
if(h1==1)
disp('Data does not come from such a distribution,The test rejects the null hypothesis');
else
disp('Data does comes from such a distribution ,The test satisfies the null hypothesis');
end