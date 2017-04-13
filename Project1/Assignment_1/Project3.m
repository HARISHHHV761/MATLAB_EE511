% Generate the random number using rand() function
% Toss the coin for 100 times using a for loop
% Store the longest head run lengths in a vector
% Longest head run lengths is calculated in the else condition 
% Store the previously generated head runs in a vector.
% Take the maximum out of the vector to get the longest head run lengths
% Display the vector and plot the histogram

Temporary_HeadCount=0;
Iteration_Var1=1;
for Iteration_Var2=1:1:100
Random_Number= rand(); %Genearate real random numbers between 0 and 1
Vector_A(:,Iteration_Var2)=Random_Number; % Vector of all the random values
 if(Random_Number >0.5)
     Temporary_HeadCount=Temporary_HeadCount+1;
 else
     %if(Temporary_HeadCount~=1 && Temporary_HeadCount~=0)
     if(Temporary_HeadCount~=0) 
     Vector_B(:,Iteration_Var1)=Temporary_HeadCount;
     Iteration_Var1=Iteration_Var1+1;
     Temporary_HeadCount=0;
     end
    Temporary_HeadCount=0;
 end
end
disp('The vector of random numbers')
disp(Vector_A)
disp('The vector of maximum head run length count')
disp(Vector_B) 
disp('The maximum head counts')
max(Vector_B)
histogram(Vector_B)
title('Histogram showing the head run lengths')
xlabel('Different consecutive head run lengths')
ylabel('No of consecutive head run lengths')
 
        
    
    