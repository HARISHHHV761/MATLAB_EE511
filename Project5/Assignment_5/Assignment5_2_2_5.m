Number_Of_Time_Slots=100;
Previos_State_Check_InputPort1=0;
Previos_State_Check_InputPort2=0;
for Iteration_Var1=1:1:Number_Of_Time_Slots
Arrival_Probabilities(:,Iteration_Var1)=rand();
end
Input_Buffer_1=0;
Input_Buffer_2=0;
Output_Buffer_1=0;
Output_Buffer_2=0;
Counter1=0;
Counter2=0;
Previous_State_Port1=0;
Previous_State_Port2=0;
for Iteration_Var1=1:1:Number_Of_Time_Slots
      Packets_Processed=0;
      Count_Of_1Packets=0;
      %Count_Of_2Packets=0;
     if(rand()>Arrival_Probabilities(Iteration_Var1))% Packets arriving at Input buffer 1
     Input_Buffer_1=Input_Buffer_1+1;
     end
     if(rand()>Arrival_Probabilities(Iteration_Var1))% Packets arriving at Input buffer 2
     Input_Buffer_2=Input_Buffer_2+1;
     end
     Switching_Probability=rand();    % Probability of switching the arrived packet to Output port 1 or port 2(Rij)
     Random_Number=rand();
       if(Input_Buffer_1~=0 && Input_Buffer_2~=0)
               if(Switching_Probability>0.5 && Random_Number<=0.5)% (1,0) 
                   if(Previous_State_Port1==0 && Counter1~=0)%(0,0)
                        Counter1=Counter1+1;
                        if(rand()<=0.5)
                        Input_Buffer_1=Input_Buffer_1-1;
                        Output_Buffer_1=Output_Buffer_1+1;
                        Previous_State_Port2=0;
                        Packets_Processed=Packets_Processed+1;
                        else
                        Input_Buffer_2=Input_Buffer_2-1;
                        Output_Buffer_1=Output_Buffer_1+1;
                        Previous_State_Port1=0;
                        Packets_Processed=Packets_Processed+1;
                        end 
               elseif(Previous_State_Port2==1 && Counter2~=0)% (1,1)
                        Counter2=Counter2+1
                        if(rand()<=0.5)
                        Input_Buffer_1=Input_Buffer_1-1;
                        Output_Buffer_2=Output_Buffer_2+1;
                        Previous_State_Port2=1;
                        Packets_Processed=Packets_Processed+1;
                        else
                        Input_Buffer_2=Input_Buffer_2-1;
                        Output_Buffer_2=Output_Buffer_2+1;
                        Previous_State_Port1=1;
                        Packets_Processed=Packets_Processed+1;
                        end
                else %(1,0)Both the packets will be delivered.
                        Input_Buffer_1=Input_Buffer_1-1;
                        Input_Buffer_2=Input_Buffer_2-1;
                        Output_Buffer_1=Output_Buffer_1+1;
                        Output_Buffer_2=Output_Buffer_2+1;
                        Packets_Processed=Packets_Processed+2;
                end
              end
              if(Switching_Probability<=0.5 && Random_Number>0.5)% (0,1) 
                   if(Previous_State_Port2==0 && Counter1~=0)%(0,0)
                        Counter1=Counter1+1;
                        if(rand()<=0.5)
                        Input_Buffer_1=Input_Buffer_1-1;
                        Output_Buffer_1=Output_Buffer_1+1;
                        Previous_State_Port2=0;
                        Packets_Processed=Packets_Processed+1;
                        else
                        Input_Buffer_2=Input_Buffer_2-1;
                        Output_Buffer_1=Output_Buffer_1+1;
                        Previous_State_Port1=0;
                        Packets_Processed=Packets_Processed+1;
                        end 
                   elseif(Previous_State_Port1==1 && Counter2~=0)% (1,1)
                        Counter2=Counter2+1;
                        if(rand()<=0.5)
                        Input_Buffer_1=Input_Buffer_1-1;
                        Output_Buffer_2=Output_Buffer_2+1;
                        Previous_State_Port2=1;
                        Packets_Processed=Packets_Processed+1;
                        else
                        Input_Buffer_2=Input_Buffer_2-1;
                        Output_Buffer_2=Output_Buffer_2+1;
                        Previous_State_Port1=1;
                        Packets_Processed=Packets_Processed+1;
                        end
                   else %(0,1)Both the packets will be delivered.
                        Input_Buffer_1=Input_Buffer_1-1;
                        Input_Buffer_2=Input_Buffer_2-1;
                        Output_Buffer_1=Output_Buffer_1+1;
                        Output_Buffer_2=Output_Buffer_2+1;
                        Packets_Processed=Packets_Processed+2;
                    end
              end 
           if(Switching_Probability<=0.58 && Random_Number<=0.5)% (0,0) 
                   if(Previous_State_Port1==0 && Counter1~=0) %(1,0)
                        Input_Buffer_1=Input_Buffer_1-1;
                        Output_Buffer_1=Output_Buffer_1+1;
                        Input_Buffer_2=Input_Buffer_2-1;
                        Output_Buffer_2=Output_Buffer_2+1;
                        Packets_Processed=Packets_Processed+2;
                   elseif(Previous_State_Port2==1 && Counter2~=0)% (0,1)
                         Input_Buffer_1=Input_Buffer_1-1;
                         Output_Buffer_1=Output_Buffer_1+1;
                         Input_Buffer_2=Input_Buffer_2-1;
                         Output_Buffer_2=Output_Buffer_2+1;
                         Packets_Processed=Packets_Processed+2;
                   else %(0,0)Only one of thr packets will be delivered
                        Counter1=Counter1+1;
                        if(rand<=0.5)
                        Input_Buffer_1=Input_Buffer_1-1;
                        Output_Buffer_1=Output_Buffer_1+1;
                        Previous_State_Port2=0;
                        Packets_Processed=Packets_Processed+1;
                        else
                        Input_Buffer_2=Input_Buffer_2-1;
                        Output_Buffer_1=Output_Buffer_1+1;
                        Previous_State_Port1=0;
                        Packets_Processed=Packets_Processed+1;
                        end
                   end
           end
        if(Switching_Probability>0.5 && Random_Number>0.5)% (1,1) 
                   if(Previous_State_Port2==0 && Counter1~=0) %(1,0)
                        Input_Buffer_1=Input_Buffer_1-1;
                        Output_Buffer_1=Output_Buffer_1+1;
                        Input_Buffer_2=Input_Buffer_2-1;
                        Output_Buffer_2=Output_Buffer_2+1;
                        Packets_Processed=Packets_Processed+2;
                   elseif(Previous_State_Port1==0 && Counter2~=0)% (0,1)
                         Input_Buffer_1=Input_Buffer_1-1;
                         Output_Buffer_1=Output_Buffer_1+1;
                         Input_Buffer_2=Input_Buffer_2-1;
                         Output_Buffer_2=Output_Buffer_2+1;
                         Packets_Processed=Packets_Processed+2;
                   else %(1,1)Only one of thr packets will be delivered
                        Counter2=Counter2+1;
                        if(rand<=0.5)
                        Input_Buffer_1=Input_Buffer_1-1;
                        Output_Buffer_1=Output_Buffer_1+1;
                        Previous_State_Port2=1;
                        Packets_Processed=Packets_Processed+1;
                        else
                        Input_Buffer_2=Input_Buffer_2-1;
                        Output_Buffer_1=Output_Buffer_1+1;
                        Previous_State_Port1=1;
                        Packets_Processed=Packets_Processed+1;
                        end
                  end         
        end  
  end
       Total_Buffer_Size(:,Iteration_Var1)=Input_Buffer_2+Input_Buffer_1;
       Buffer1_Size(:,Iteration_Var1)=Input_Buffer_1;
       Buffer2_Size(:,Iteration_Var1)=Input_Buffer_2;
       if(Packets_Processed~=0)
       Throughput(:,Iteration_Var1)=(Packets_Processed);
       Efficiency(:,Iteration_Var1)=(Throughput(:,Iteration_Var1)/2)*100;
       end
       Packets_Processed_Switch(:,Iteration_Var1)=Packets_Processed;        
end
Mean_Packets_Processed_Switch=mean(Packets_Processed_Switch);
Mean_ThroughPut=mean(Throughput);
Mean_Efficiency=mean(Efficiency);
Mean_Of_Buffer1=mean(Buffer1_Size);
Mean_Of_Buffer2=mean(Buffer2_Size);
Mean_Of_Total_Buffer=mean(Total_Buffer_Size);
disp('The Mean Throughput is =')
disp(Mean_ThroughPut);
disp('The Mean Efficiency is =')
disp(Mean_Efficiency);
disp('The Mean of the buffer1=');
disp(Mean_Of_Buffer1);
disp('The Mean of the buffer2=');
disp(Mean_Of_Buffer2);
disp('The Mean of the total buffer size =');
disp(Mean_Of_Total_Buffer);
disp('Mean of the packets processed by SWITCH in each slot');
disp(Mean_Packets_Processed_Switch);
%disp('The Arrival Probabilities=');
%disp(Arrival_Probabilities);
plot(Arrival_Probabilities,Buffer1_Size,'r',Arrival_Probabilities,Buffer2_Size,'b--o');

        