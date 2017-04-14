Sample_Sizes=1000;
%Car arrivals calculated using Bernoulis Method
for Iteration_Var1=1:1:Sample_Sizes
lambda = 120;
e=2.17828;
SubIntervals = 4000;
Lamda_SubInterval = lambda/SubIntervals;
Random_Number = rand(SubIntervals,1);
bernoulliTrials = Random_Number<Lamda_SubInterval;
Car_Arrival=sum(bernoulliTrials);
Vector_A(:,Iteration_Var1)= Car_Arrival;
end
%Car arrivals calculated using Inverse Transform Method
Lambda=120;
for Iteration_Var2=1:1:Sample_Sizes
    Pmf=poisspdf(0,120);
    F=Pmf;
    Arrival_Count=0;
    Random_Num2=rand();
    while(Random_Num2>F)
         Pmf=poisspdf(Arrival_Count+1,120);
         F=F+Pmf;
         Arrival_Count=Arrival_Count+1;
    end
     Vector_B(:,Iteration_Var2)=Arrival_Count;
end
for Iteration_Var3=1:1:1000
Vector_C(:,Iteration_Var3)= poisspdf(Iteration_Var3,120);
end
Xaxis_Range=1:1000;

%This is the figure used to represent the p.m.f of Poisson Distribution
figure(1)
stem(Xaxis_Range,Vector_C);
title('The Stem plot gives us the theoretical p.m.f of Poisson distrinution for 1000 samples');
xlabel('The sample values');
ylabel('The probability mass functions for the sampled values');

%This is the figure used to represent car_arrivals/hour for required sample sizes using Bernoullis trial method'
figure(2)
hist(Vector_A)
title('The histogram reprsents the car arrivals/hours for required sample sizes using Bernoullis trial method');
xlabel('The number of car arrivals in 1 hour');
ylabel('The frequency of the car arrivals in 1 hour');

%This is the figure used to represent car_arrivals/hour for required sample sizes using Inverse Transform Method'
figure(3)
hist(Vector_B)
title('The histogram reprsents the car arrivals/hours for required sample sizes using Inverse Transform Method');
xlabel('The number of car arrivals in 1 hour');
ylabel('The frequency of the car arrivals in 1 hour');


%This is the figure used to represent theoritical pmf overlayed on the histogram of random variable by inverse transform method
figure(4)
title('The graph shows the theoritical pmf overlayed on the histogram of random variable by inverse transform method');
yyaxis left
histogram(Vector_B);
yyaxis right
X=1:1000;
plot(X,Vector_C,'r');

%This is the figure used to show the theoritical pmf overlayed on the histogram of random variable by Bernoulli Trial Method
figure(5)
title('The graph shows the theoritical pmf overlayed on the histogram of random variable by Bernoulli Trial Method');
yyaxis left
histogram(Vector_A);
ylabel('The frequency of the car arriival rate in an hour');
xlabel('The axis range from 1 to 1000');
yyaxis right
X=1:1000;
plot(X,Vector_C,'r');
ylabel('The theoretical p.m.f calculated for 1000 trials');