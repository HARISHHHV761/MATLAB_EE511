Lambda=120;
for Iteration_Var2=1:1:100
    Pmf=exp(-Lambda);
    F=Pmf;
    Arrival_Count=0;
    Random_Num2=rand();
    while(Random_Num2>F)
         Pmf=(Lambda*Pmf)/(Arrival_Count+1);
         F=F+Pmf;
         Arrival_Count=Arrival_Count+1;
    end
     Vector_Y(:,Iteration_Var2)=Arrival_Count;
end
figure(1)
hist(Vector_Y)
disp(Vector_Y)
Y = poisspdf(Vector_Y,Lambda);
figure(2)
hist(Y)
     
