% Program to simulate a wright fisher model using Markov chain
 warning off;
 Number_of_Individuals = 100;          % number of individuals
 Initial_Distribution= zeros(1,2*Number_of_Individuals+1);
 random_index= randi([1 2*Number_of_Individuals+1]);
 Initial_Distribution(random_index)= 1;

 P=zeros(2*Number_of_Individuals+1,2*Number_of_Individuals+1); % transition matrix
 for Iteration_Var1 = 1:2*Number_of_Individuals+1
     for Iteration_Var2 = 1:2*Number_of_Individuals+1
         P(Iteration_Var1,Iteration_Var2) = nchoosek(2*Number_of_Individuals,Iteration_Var2-1)*((Iteration_Var1-1)/(2*Number_of_Individuals))^(Iteration_Var2-1)*(1-(Iteration_Var1-1)/(2*Number_of_Individuals))^(2*Number_of_Individuals-Iteration_Var2+1);
     end   
 end
Number_Of_Time_Steps=6000;           
output=zeros(Number_Of_Time_Steps+1,2*Number_of_Individuals+1); % Clearing old values
t=0:Number_Of_Time_Steps;         

output(1,:)=Initial_Distribution; 

Iteration_Var1 = 0;
for Iteration_Var1=1:Number_Of_Time_Steps,
  output(Iteration_Var1+1,:) = output(Iteration_Var1,:)*P;
  %a tolerance check stop when it reaches steady state value
  LIT = ismembertol(output(Iteration_Var1+1,:),output(Iteration_Var1,:));
  if all(LIT == 1)     
      break;
  end
end
disp('The value of A1 at the steady state population is = ');
disp(num2str(output(Iteration_Var1+1,1)));
disp('The value of A2 at the steady state population is = ');
disp(num2str(output(Iteration_Var1+1,2*Number_of_Individuals+1)));
disp('The steady state population will arrive at generation=');
disp(Iteration_Var1);
