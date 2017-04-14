for Iteration_Var1=1:1:1000
lambda = 120;
e=2.17828;
SubIntervals = 4000;
p = lambda/SubIntervals;
Random_Number = rand(SubIntervals,1);
bernoulliTrials = Random_Number<p;
Car_Arrival=sum(bernoulliTrials);
Vector_A(:,Iteration_Var1)= Car_Arrival;
end
Lambda=120;
%Car arrivals calculated using Inverse Transform Method
for Iteration_Var2=1:1:1000
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
for i=1:1:1000
Vector_C(:,i)= poisspdf(i,120);
end
ax=1:1000
figure(1)
stem(ax,Vector_C);
disp('The car arrivals calcuated for 100 sample using Bernoullis trial');
disp(Vector_A);
disp('The car arrivals calcuated for 100 sample using Inverse Transform Method');
disp(Vector_B)
figure(2)
hist(Vector_A)
title('The histogram reprsents the car arrivals/hours for 100 samples using Bernoullis trial method');
xlabel('The number of car arrivals in 1 hour');
ylabel('The frequency of the car arrivals in 1 hour');
figure(3)
title('The graph shows the theoritical pmf overlayed on the histogram of random variable by inverse transform method');
yyaxis left
histogram(Vector_B);
yyaxis right
X=1:1000;
plot(X,Vector_C,'r');
figure(4)
title('The graph shows the theoritical pmf overlayed on the histogram of random variable by Bernoulli Trial Method');
yyaxis left
histogram(Vector_A);
yyaxis right
X=1:1000;
plot(X,Vector_C,'r');

