

close all
clear all
clc

%data = importdata('C:\Users\Anup Joseph\Desktop\test_data_o.txt');
data = importdata('C:\Users\Anup Joseph\Desktop\data_d2.dat');
data1 = importdata('C:\Users\Anup Joseph\Desktop\data_d3.dat');
time1 = data.data(:,1);

vc1= data.data(:,2);

vc1_norm = normalize(vc1,'range');

vc2 = data.data(:,3);
time2 = data.data(:,1);

vc2_norm = normalize(vc2,'range');

%Plotting Superposed states

plot(time1,vc1_norm)
xlim([10^-4 5*10^-4])
title('Superposed State of Qubit')

%test for chaos

vc1_samp = [];
for i =1:4:length(vc1_norm)
    vc1_samp = [vc1_samp ; vc1_norm(i)];
end   
z1test(vc1_samp)


%Applying Pauli X gate

figure;
subplot(211)
plot(time1,vc1_norm)
xlim([10^-4 5*10^-4])
title('Input Qubit')
subplot(212)
plot(time1,(1-vc1_norm))
xlim([10^-4 5*10^-4])
title('Output Qubit (Pauli X)')

%Applying Pauli Y gate
figure;
subplot(211)
plot(time1,vc1_norm)
xlim([10^-4 5*10^-4])
title('Input Qubit')
subplot(212)
y = -(1-vc1_norm);
plot(time1,y)
xlim([10^-4 5*10^-4])
title('Output Qubit (Pauli Y)')


%Applying Pauli Z gate
figure;
subplot(211)
plot(time1,vc1_norm)
xlim([10^-4 5*10^-4])
title('Input Qubit')
subplot(212)
z=-(vc1_norm);
plot(time1,z)
xlim([10^-4 5*10^-4])
title('Output Qubit (Pauli Z)')

%Applying Hadamard Gate
figure;
subplot(211)
plot(time1,vc1_norm)
xlim([10^-4 5*10^-4])
title('Input Qubit')
subplot(212)
H = ((1-vc1_norm)-0.5)*1.414;
plot(time1,H)
xlim([10^-4 5*10^-4])
title('Output Qubit (Hadamard Gate)')
vc2_norm(numel(vc1_norm))=0;

%Applying CNOT Gate
figure;
subplot(411)
plot(time1,vc1_norm)
xlim([10^-4 3.6*10^-4])
title('Input Qubit 1(Control bit)')
subplot(412)
plot(time1,vc2_norm)
xlim([10^-4 3.6*10^-4])
title('Input Qubit 2 (Target bit)')
subplot(413)
plot(time1,vc1_norm)
xlim([10^-4 3.6*10^-4])
title('Output Qubit 1');
C =abs(vc1_norm-vc2_norm);
subplot(414)
plot(time1,C);
xlim([10^-4 3.6*10^-4])
title('Output Qubit 2')

%Entangled states (Bell States)
qubit1 = vc1_norm;
qubit2 = vc2_norm;

%Applying a Hadamard Gate to first qubit
state1 = ((1-qubit1)-0.5)*1.414;

%Applying CNOT with control as qubit1(state1) and target as qubit2
state2 = (state1-qubit2)/2;

figure;
subplot(411)
plot(time1,vc1_norm)
xlim([10^-4 3.6*10^-4])
title('Input Qubit 1')
subplot(412)
plot(time1,vc2_norm)
xlim([10^-4 3.6*10^-4])
title('Input Qubit 2 ')
subplot(413)
plot(time1,state1);
xlim([10^-4 3.6*10^-4])
title('Qubit 1 output');
subplot(414)
plot(time1,state2);
xlim([10^-4 3.6*10^-4])
title('Qubit 2 output');


%Quantum Teleportation protocol

tele_q1 = vc1_norm;
tele_q2 = vc2_norm;
%Creating entangled state
t_state1 = ((1-tele_q1)-0.5)*1.414;
t_state2 = abs(t_state1 - tele_q2)/2;
%applying a CNOT gate with control as q2 and target as q1
t_state3 = abs(t_state2 - tele_q1);

figure;

plot(time1,t_state3)
xlim([10^-4 3.6*10^-4])
hold on
plot(time1,vc2_norm)
xlim([10^-4 3.6*10^-4])
legend('Teleported Qubit','Original Qubit')
title('Quantum Teleportation')













