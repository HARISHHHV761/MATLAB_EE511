% Program to calculate the rejection probability of 5 micro chips
Accept=0;
Reject=0;
Samples=1000;
Rejection=Reject/Samples;
Minimum_Sample_Size=5;
for Iteration_Var1=1:1:Samples
    Check =1;
    Vector_Y=randsample(125,Minimum_Sample_Size); % Picking up the desired microchips from the sample
   for Iteration_Var2=1:1:Minimum_Sample_Size
       if(((Vector_Y(Iteration_Var2,1)==1)|(Vector_Y(Iteration_Var2,1)==2)|(Vector_Y(Iteration_Var2,1)==3)|(Vector_Y(Iteration_Var2,1)==4)|(Vector_Y(Iteration_Var2,1)==5)|(Vector_Y(Iteration_Var2,1)==6))& Check==1)
           Reject=Reject+1;
           Check=0;
       end
   end
end
Rejection_Probability=Reject/Samples;
disp('The probability of rejection for 5 microchips is =');
disp(Rejection_Probability);


           
           
