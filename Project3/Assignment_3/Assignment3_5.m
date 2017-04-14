function[]=Assignment3_5(Sample_Sizes);
p = [6 6 6 6 6 15 13 14 15 13 0 0 0 0 0 0 0 0 0 0]/100;
Length_p = 1:length(p);
q=0.05;
Constant=2.99;
for Iteration_Var1 = 1:Sample_Sizes, k = 0;
    while 1, k = k + 1;
     j=randi(20);
     Random_Num=Constant*rand;
	 if (Random_Num) < p(j)/q  
	 Accepted_Vector_X(Iteration_Var1)=j; 
     Total_AccRej(Iteration_Var1) = k; 
     break
     end
    end
end
Mean_C = mean(Total_AccRej);
Mean_X=mean(Accepted_Vector_X);
Sum_C=sum(Total_AccRej);
Mean_Theoretical=0;
Variance_Theoretical=0;
for i=1:1:20
    Temp=i*p(i);
    Mean_Theoretical=Mean_Theoretical+Temp;
end
for j=1:1:20
    Temp2=p(j)*((Accepted_Vector_X(j)-Mean_Theoretical)^2);
    Variance_Theoretical = Variance_Theoretical+Temp2;
end
disp('The total number of accepts and rejects=');
disp('The theoretical value of mean=');
disp(Mean_Theoretical);
disp('The practical value of mean=');
disp(Mean_X);
Theoretical_Efficiency=100/mean(Total_AccRej);
Practical_Efficiency=100*(Sample_Sizes/sum(Total_AccRej));
disp('The theoretical acceptance efficiency =');
disp(Theoretical_Efficiency);
disp('The practical acceptance efficiency =');
disp(Practical_Efficiency);
disp('The variance of the the accepted values =');
disp(var(Accepted_Vector_X));
disp('The Theoretical variance =');
disp(Variance_Theoretical);
% Overlaying Pj on the X(Accepeted Vector)
plot(p,'r','Linewidth',3);
hold on;
Counts = histc(Accepted_Vector_X,Length_p);
bar(Length_p,Counts/sum(Counts),'y');
title('The graph represents the overlaid target distribution pj on the accepted vector'); 
xlabel('The total length of target distribution P')
ylabel('The p.m.f of the target distribution P'); 


