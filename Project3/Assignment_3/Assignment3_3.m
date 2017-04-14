% A function with output Head_Count and input Multiple
function[]=Assignment(Sample_Size) 
sum=0;
Minimum_Count=0;
for Iteration_Var=1:1:Sample_Size
    Minimum_Count=0;
    sum=0;
    while(sum<4)
        Random_Number=rand();
        sum=sum+Random_Number;
        Minimum_Count=Minimum_Count+1;
    end
    Random_N(:,Iteration_Var)=Minimum_Count;
end
Expected_Value=mean(Random_N);
disp('The mean or the expected value of the random variable is =');
disp(Expected_Value);
histogram(Random_N);
title('The histogram of the random variables for 100 sample sizes')
xlabel('The minimum numbers exceeding the sum >4');
ylabel('The frequency of occurences of the numbers exceeding 4');
end
