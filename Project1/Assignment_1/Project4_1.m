% Take the input from the user regarding the consecutive headrun lengths
% Use a loop to iterate till the headrun length count = user input
% Store the random variables in a vector and check for heads 
% Generate a condition which would eliminate the repeated headrun length 
% The iteration variable is incremented at the end of the loop
% The total count of iteration variable gives us the tossing count.
Temporary_HeadCount=0;
Iteration_Var2=1;
Repeated_HeadRunlength=0; % A variable used to check for the repeated head run length count
prompt = 'Enter the number of head counts '; 
Input_HeadCount = input(prompt)
while(Temporary_HeadCount ~= Input_HeadCount)  % Checking the condition for user input equalling the headrun count.  
Random_Number= rand(); %Genearate real random numbers between 0 and 1
Vector_A(:,Iteration_Var2)=Random_Number; % Vector of all the random values
 if(Random_Number >0.5)
     Temporary_HeadCount=Temporary_HeadCount+1;
 else
     if(Temporary_HeadCount~=0 && Repeated_HeadRunlength~=Temporary_HeadCount) % Conditon to eliminate the repeated the head run length.
     Repeated_HeadRunlength=Temporary_HeadCount; 
     end
 Temporary_HeadCount=0;    
 end
 Iteration_Var2=Iteration_Var2+1;
end
Number_Tossings=Iteration_Var2-1;
disp('The Number of tosses =')
disp(Number_Tossings)
disp('The vector of random numbers=')
disp(Vector_A)
        
    
    