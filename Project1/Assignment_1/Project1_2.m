% This is a function call of 'Project1_1' to repeat the experiment
% Experiment is repeated for 20 ,100,200 and 1000 times
% Create a loop for which the function is repeated 20,100,200,1000 times
% Store the result in a vector and display the vector in histogram
% figure() function is used to have multiple histograms in one file

figure(1);
for Iteration_Var1=1:1:20
    Vector_C(:,Iteration_Var1) = Project1_1(Iteration_Var1); % A vector used to store the result for 20*50 times
end
histogram(Vector_C);
title('Histogram showing the number of heads for 50 tossings in 20 times')
xlabel('Different no of head counts')
ylabel('Number of head count occurences')

figure(2);
for Iteration_Var1=1:1:100
    Vector_D(:,Iteration_Var1) = Project1_1(Iteration_Var1); % A vector used to store the result for 100*50 times
end
histogram(Vector_D);
title('Histogram showing the number of heads for 50 tossings in 100 times')
xlabel('Different no of head counts')
ylabel('Number of head count occurences')

figure(3);
for Iteration_Var1=1:1:200
    Vector_F(:,Iteration_Var1) = Project1_1(Iteration_Var1); % A vector used to store the result for 200*50 times
end
histogram(Vector_F); 
title('Histogram showing the number of heads for 50 tossings in 200 times')
xlabel('Different no of head counts')
ylabel('Number of head count occurences')

figure(4);
for Iteration_Var1=1:1:1000
    Vector_G(:,Iteration_Var1) = Project1_1(Iteration_Var1); % A vector used to store the result for 1000*50 times
end
histogram(Vector_G); 
title('Histogram showing the number of heads for 50 tossings in 1000 times')
xlabel('Different no of head counts')
ylabel('Number of head count occurences')