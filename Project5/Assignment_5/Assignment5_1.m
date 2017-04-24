%---------------------------------------------------------------------------------------------------------------------------
% Program to simulate discrete event simulation
% Single server queue is an example of single server queue system
% Simulate a single server queue system given the non homogeneous arrivalrates and exponential distribtuion of service rate 
%-----------------------------------------------------------------------------------------------------------------------------%
% Function to simulate the different cases of arrival and departure times
function Single_Queue()
Lambda_Expo=25; % Mean rate of exponential distribution
Exponential_Mean=1/Lambda_Expo; 
Current_Time=0;
Service_Time=0;
Arrival_Info=0;
Number_Of_Arrivals=0;
Number_Of_Departure=0;
Number_Of_Customers=0;
Total_Time=100;
Departure_Info=0;
Break_Time=0;
Total_break=0;
[Arrival_Time,Service_Time]=generate_Ts(Total_Time,Service_Time);
breaktime=Arrival_Time;
Departure_Time=inf;
%Case 1:
while Arrival_Time<=Total_Time
        if (Arrival_Time<=Departure_Time &&Arrival_Time<=Total_Time)
            Current_Time=Arrival_Time;
            Number_Of_Arrivals=Number_Of_Arrivals+1;
            Number_Of_Customers=Number_Of_Customers+1;
            Service(1,Number_Of_Arrivals+Number_Of_Departure)=Current_Time;
            Service(2,Number_Of_Arrivals+Number_Of_Departure)=Number_Of_Customers;
            [Arrival_Time,Service_Time]=generate_Ts(Total_Time,Service_Time);
            %Ts(i)=temp;
            if Number_Of_Customers==1
                Departure_Time=breaktime+exprnd(Exponential_Mean);
            end
            Arrival_Info(Number_Of_Arrivals)=Current_Time;
        elseif(Arrival_Time>Departure_Time && Departure_Time<=Total_Time)
            Current_Time=Departure_Time;
            Number_Of_Customers=Number_Of_Customers-1;
            Number_Of_Departure=Number_Of_Departure+1;
            Service(1,Number_Of_Arrivals+Number_Of_Departure)=Current_Time;
            Service(2,Number_Of_Arrivals+Number_Of_Departure)=Number_Of_Customers;
            Departure_Info(Number_Of_Departure)=Current_Time;
            if (Number_Of_Customers==0)
                Departure_Time=inf;
                breaktime=Current_Time;
                while (breaktime<Arrival_Time)
                    Break_Time=0.3*rand;
                    breaktime=breaktime+Break_Time;
                    Total_break=Total_break+Break_Time;
                end
            else
             Departure_Time=Current_Time+exprnd(Exponential_Mean);
            end
        end    
end
% Case 2
while (min(Arrival_Time,Departure_Time)>Total_Time&& Number_Of_Customers>0)
    Current_Time=Departure_Time;
    Number_Of_Customers=Number_Of_Customers-1;
    Number_Of_Departure=Number_Of_Departure+1;
    Departure_Time=Current_Time+exprnd(Exponential_Mean);
    Departure_Info(Number_Of_Departure)=Current_Time;
     Service(1,Number_Of_Arrivals+Number_Of_Departure)=Current_Time;
     Service(2,Number_Of_Arrivals+Number_Of_Departure)=Number_Of_Customers;
end
if (Number_Of_Customers==0 && min(Arrival_Time,Departure_Time)>Total_Time)
    Tp=max(Total_Time-Current_Time,0);
end
stairs([0 Service(1,:)],[0 Service(2,:)],'linewidth',1.5);
xlim([0 Total_Time]);
title('The graph shows the arrival , departure and break time of single server queue system');
xlabel('Server Operating hours');
ylabel('The service time taking to serve a job');
disp('Number of arrival=');
disp(Number_Of_Arrivals);
disp('Number of departures=');
disp(Number_Of_Departure);
disp('The total break time in hours=');
disp(Total_break);
disp('The Service time of the customer in hours=');
disp(Service_Time);
end

% Function to generate arrival time and the current time
function[Current_Time,Service_Time]= generate_Ts(Total_Time,Service_Time)
Current_Time=Service_Time;
lamda_max=19;
Time1=0;
while(Current_Time<Total_Time)
       Random_Num1 = rand ();
       Current_Time = Current_Time- log(Random_Num1)/lamda_max;
       Random_Num2 = rand();
       if (mod(Current_Time,10)<=5)
           Time1=mod(Current_Time,10);
           if (Random_Num2 <= (mod(4+3*Time1,10)/lamda_max))
           Service_Time = Current_Time;
           break;
           end
         else 
           Time1=mod(Current_Time,10);
          if (Random_Num2 <= (mod(19-3*(Time1-5),10)/lamda_max))
          Service_Time = Current_Time;
          break;
          end
      end    
end
end
