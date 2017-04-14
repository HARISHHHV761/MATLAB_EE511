Sample_Size=1000;
Constant = 4.679;
Probability=1/Constant;
Random_Number=rand(1000,1);
count =0;
%Used Inverse transform method to produce the sequence X1
%for Iteration_Var1=1:1:Sample_Size
 %   if(Random_Number(Iteration_Var1,1)<((Probability)/(1))) % This is used to generate X1 ( If u<p1 X=X1)
  %      count=count+1; % This is used to store all the values(Sample_Sizes) which is under X1.
   % end
%end
%Vector_A(:,1)=count;% Store the value of X1 to the Vector_A(i=1)
%Used Inverse transform method to produce the sequence X2 to X60
for Iteration_Var1=1:1:60
    count =0;
    for Iteration_Var2=1:1:Sample_Size
 % This is used to generate X2 to X60 ( If p1<= u <p2 then X=X2)
    if((Probability)/(Iteration_Var1))>Random_Number(Iteration_Var2,1)>=((Probability)/(Iteration_Var1+1))
    count=count+1; % This is used to store all the values(Sample_Sizes)which is under Xk
    end
    end
    Vector_B(:,Iteration_Var1)=(Probability)/(Iteration_Var1);
    Vector_A(:,Iteration_Var1)=count; % Store the value of Xk to the Vector_A(i=k)
end
disp(Random_Number)
disp(Vector_A);
disp(Vector_B);
bar(1:60,Vector_A,'BarWidth',0.7);
title('The histogram of the occurence of sample for numbers from 1 to 60');
xlabel('The sequence of numbers 1-60');
ylabel('The occurence of samples into the sequence of numbers');
