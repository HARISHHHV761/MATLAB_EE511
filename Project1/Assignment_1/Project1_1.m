
%A Function Project1_1 is created for reusability purpose
%The function counts the number of heads , longest head run lengths .
%The function also generates a histogram of bernoulis outcome.
%This is about tossing the coin 50 times and observing the outcome

function[Head_Count]=Project1_1(Mutiple) % A function with output Head_Count and input Multiple
Temporary_Head=0;
Iteration_Var1=1;%Iteration variable to keep a count for Vector_B
Tails_Count=0;

%Tossing the coin 48 times 
for Iteration_Var2=1:1:50
random_number= rand(); %Generating random  real numbers between 0 and 1
Vector_A(:,Iteration_Var2)=random_number; % A Vector used to store the random values for 50 tosses
 if(random_number >0.5)
     Temporary_Head=Temporary_Head+1;
     Vector_D(:,Iteration_Var2)=1; % Vector used for depicting Bernoulli outcome(HEAD IS DEPICTED AS 1)
 else
     %Algoritm to count the maximum head count lengths
     if(Temporary_Head~=1 && Temporary_Head~=0)
     Vector_B(:,Iteration_Var1)=Temporary_Head; % Creating a vector to keep all the head count lengths
     Iteration_Var1=Iteration_Var1+1;
     Temporary_Head=0; 
     end
    Temporary_Head=0;
    Tails_Count=Tails_Count+1; %Count for number of tails.
    Vector_D(:,Iteration_Var2)=0; % Vector used for depicting Bernoulli outcome(TAIL IS DEPICTED AS 0)
 end
end
Maximum_HeadRunLength=max(Vector_B) % Finding the maximum head run lengths among the Vector_B
Head_Count=50-Tails_Count;  %Count for counting the number of Heads.
end


