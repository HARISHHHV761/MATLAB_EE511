% Generate the random number using rand() function
% Toss the coin for 200 times using a for loop
% P[HEAD]=0.8--> Use the if condition and store the head counts in Vector
% Store the longest head run lengths in a vector
% Longest head run lengths is calculated in the else condition 
% Store the previously generated head runs in a vector.
% Take the maximum out of the vector to get the longest head run lengths
% Display the vector and plot the histogram
% The output shows the heads count closely aroud 160.

Temporary_Head=0;
Iteration_Var1=1;
Tails_Count=0; 
for Iteration_Var2=1:1:200
Random_Num= rand(); %Genearate real random numbers between 0 and 1
Vector_A(:,Iteration_Var2)=Random_Num; % Vector of all the random values
 if(Random_Num >0.2)
     Temporary_Head=Temporary_Head+1; 
     Vector_D(:,Iteration_Var2)=1;  % Stores the Bernoulli outcome of 1 in a vector depicting as HEADS
     
 else
     if(Temporary_Head~=1 && Temporary_Head~=0)
     Vector_B(:,Iteration_Var1)=Temporary_Head;
     Iteration_Var1=Iteration_Var1+1;
     Temporary_Head=0;
     end
    Temporary_Head=0;
    Tails_Count=Tails_Count+1;
    Vector_D(:,Iteration_Var2)=0;  % Stores the Bernoulli outcome of 0 in a vector depicting as TAILS
 end
end
Maximum_HeadsRunLengthCount=max(Vector_B) % Counts the maximum of head run lengths of a vector
Head_Count=200-Tails_Count % Counts the number of heads.
disp('The number of heads is =')
disp(Head_Count) % Displays the head counts.
disp('The vector of random numbers generated')
disp(Vector_A) 
disp('The vector of head run length is')
disp(Vector_B) % Displays the vector of head run lengths
disp('The number of Maximum head run length is =')
disp(Maximum_HeadsRunLengthCount) % Displays the maximum head run lenght count.
%hist(Vector_A)
histogram(Vector_D,2) % Generates the histogram of the Beernoulli outcome 
title('Histogram showing the Bernoulli outcome for tossing 200 times with P[HEAD]=0.8')
xlabel('Bernoulli Outcome : Heads and Tails ')
ylabel('Number of head and tail count occurences')


  