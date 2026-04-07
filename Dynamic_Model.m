%Nissan Leaf
%Drive Cycle Extraction

NEDC=readmatrix('MNEDC.xlsx'); %New European Drive Cycle
ARDC=readmatrix('ARDC.xlsx');  %Artemis Rural Drive Cycle
AUDC=readmatrix('AUDC.xlsx');  %Artemis Urban Drive Cycle

%Vehicle Parameters

Vm=1710;       %Vehicle Mass kg
Va=3.8056;     %Vehicle Frontal Area m^2
Rw=0.2032;     %Wheel Radius
Crr=0.015;     %Rolling Resistance Coefficient
Rho=1.225;     %Air Density
g=9.81;        %Gravity Constant
theta=0;       %Gradient Angle
Cd=0.28;       %Drag Coefficient
Dm=80;         %Driver Mass
GVM=(Vm+Dm);   %Gross Vehicle Mass
GVW=(Vm+Dm)*g; %Gross Vehicle Weight
B_F=10000;     %Brake Force
P_Avl=30000;   %Available Power in Watts motor's rated power/battery's max power

%Transmission Parameters

GR=7.8;        %Gear Ratio
T_Eff=0.85;    %Transmission Efficiency


%%Motor Parameters

%While Motoring
Motor=readmatrix('Nissan_Leaf_Motor_Efficiency.xls') %Motor Data Extraction
M_Speed=Motor(2:16,1);                               %Motor Speed
M_Torque=Motor(2:16,17);                             %Motor Torque
M_Eff=Motor(2:16,2:16);                              %Motor Efficiency

%While Regenerative
Motor_Regen=readmatrix('Nissan_Leaf_Motor_Regenerative_efficiency.xls') %Motor Data Extraction
M_Regen_Speed=Motor_Regen(2:16,1);                   %Motor Regen Speed
M_Regen_Torque=Motor_Regen(2:16,17);                 %Motor Regen Torque
M_Regen_Eff=Motor_Regen(2:16,2:16);                  %Motor Regen Efficiency

%%Motor Controller Parameters

%While Motoring
Motor_C=readmatrix('Nissan-Leaf-Motor-Controller-Efficiency.xlsx')  %Motor Controller Data Extraction
MC_Speed=Motor_C(2:16,1);                            %Motor Controller Speed
MC_Torque=Motor_C(2:16,17);                          %Motor Controller Torque
MC_Eff=Motor_C(2:16,2:16);                           %Motor Controller Efficiency

%While Regenerative
Motor_C_Regen=readmatrix('Nissan-leaf-motor-controller-regenerative-efficiency.xlsx')  %Motor Controller Data Extraction
MC_Regen_Speed=Motor_C_Regen(2:16,1);                %Motor Controller Speed
MC_Regen_Torque=Motor_C_Regen(2:16,17);              %Motor Controller Torque
MC_Regen_Eff=Motor_C_Regen(2:16,2:16);               %Motor Controller Efficiency

%%Battery
Battery_Capacity=24000;                              %Battery Energy
Battery_Voltage=364;                                 %Battery Voltage
DC_Dist=10.27;                                       %Drive Cycle Distance
Cell_Voltage=3.8;                                    %Cell Voltage
Cell_Capacity=33.1;                                  %Cell Capacity

