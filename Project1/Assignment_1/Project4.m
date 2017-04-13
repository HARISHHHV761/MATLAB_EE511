% Take the user defined number of heads
% Use a loop to iterate till we get the user defined head count
% Check for the head conditon
% The iteration variable at the end is the number of tosses
prompt = 'Enter the number of head counts ';
Input_HeadCount = input(prompt)
%Input_HeadCount = input('Enter the number of head counts ');
Head_Count=0;
Temp_Number_Of_Tosses=1; % Calculates the temporary numbers of tosses until we get a user specified heads
while(Head_Count~=Input_HeadCount) 
 RandomNumber=rand();
 A(:,Temp_Number_Of_Tosses)=RandomNumber; % The vector of all the random variables
 if(RandomNumber>0.5)
     Head_Count=Head_Count+1;
 end
 Temp_Number_Of_Tosses=Temp_Number_Of_Tosses+1; 
end
Number_Of_Tosses= Temp_Number_Of_Tosses-1; % Calculates the numbers of tosses until we get a user specified heads
disp('The vector of tosses');
disp(A)
disp('The number of tosses =');
disp(Number_Of_Tosses)

