%base
clc
clear all
close all
Nbus=76
VPU = zeros(Nbus,24);
PQless = zeros(1,24);
for t=1:24
    DistLoadFlowSolution=basepowerflow(t);
    PQless(t) = DistLoadFlowSolution.SLosskVA;%SLosskVA;
    VPU(:,t) = DistLoadFlowSolution.VmagPU;
    Pless(:,t) = DistLoadFlowSolution.Pbrloss;%SLosskVA;
    Qless(:,t) = DistLoadFlowSolution.Qbrloss;%SLosskVA;
    
end
for t=1:24
   miniha(t)= find(min(VPU(:,t))==VPU(:,t))
   mini(t)= min(VPU(:,t))
end
find(min(mini)==mini)
figure(1)
plot(1:76,VPU)
xlabel('bus numbers')
ylabel('VPU for Hour=1:24')
legend('hour1','hour2','hour3','hour4','hour5','hour6','hour7','hour8','hour9','hour10','hour11','hour12','hour13','hour14','hour15','hour16','hour17','hour18','hour19','hour20','hour21','hour22','hour23','hour24')
figure(2)
plot(1:76,VPU(:,1))
xlabel('bus numbers')
ylabel('VPU for t=1')
title('profile voltage for t=1')
figure(3)

plot(PQless)
xlabel('time')
ylabel('PQless for t=1:24')
title('loss of s power')
figure(4)

plot( Pless(:,1))
xlabel('BUS')
ylabel('Pless(Wat)')
title('loss P for t=1')
figure(5)

plot( Qless(:,1))
xlabel('BUS')
ylabel('Qless(Ractive)')
title('loss Q for t=1')


baseVPU=VPU(:,1)
save BASEVPU.mat baseVPU ;
%clear
basePQless=PQless
save BASEPQloss.mat basePQless ;
save BASEQ.mat Qless ;
save BASEP.mat Pless ;
load BASEVPU.mat
load BASEPQloss.mat