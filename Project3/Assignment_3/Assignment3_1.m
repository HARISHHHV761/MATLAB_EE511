%Program to calculate the fewest number of microchips
Accept=0;
Reject=0;
Samples=100;
Rejection=Reject/Samples;
Minimum_Sample_Size=3;
while(Rejection~=0.95 & Minimum_Sample_Size~=0)
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
% Algorithm to automatically check for 95% rejection probability.
Rejection=Reject/Samples;
if(Rejection <0.95)
 Minimum_Sample_Size=Minimum_Sample_Size+1;
else
    Minimum_Sample_Size=Minimum_Sample_Size-1;   
end
Reject=0;
end
disp('The fewest number of chips to reject with 95% probability =');
disp(Minimum_Sample_Size);
disp('The rejection probability is=');
disp(Rejection);
      
           
           
