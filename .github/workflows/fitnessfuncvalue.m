function [VPU , Cp , PQless,P,Q] = fitnessfuncvalue(x,ng,nc,Nbus)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
VPU = zeros(Nbus,24);
PQless = zeros(1,24);
for t=1:24
    DistLoadFlowSolution=powerflow(x,t,ng,nc);
    PQless(t) = DistLoadFlowSolution.SLosskVA;
    VPU(:,t) = DistLoadFlowSolution.VmagPU;
    P(:,t) = DistLoadFlowSolution.Pbrloss;
    Q(:,t) = DistLoadFlowSolution.Qbrloss;
end
Cp = funcprice(x,ng,nc);
end 

