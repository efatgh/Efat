function [Zt,It,PQt,ZIPt,BUS_I,PD,QD,BS,TYPE,VM,VA,BASE_KV,VMAX,VMIN]=idx_bus
%% idx_bus format is adopted from MATPOWER
%   columns 1-10 must be included in input matrix (in case file)
%    1  BUS_I       bus number (positive integer)
%    2  PD          Pd, real power demand (kW)
%    3  QD          Qd, reactive power demand (kVAr)
%    4  BS          Bs, shunt susceptance (kVAr injected at V = 1.0 p.u.)
%    5  TYPE        Type,Load Type(Z-1,I-2,PQ-3,ZIP-4)
%    6  VM          Vm, voltage magnitude (p.u.)
%    7  VA          Va, voltage angle (degrees)
%    8 BASE_KV     basekV, base voltage (kV)
%    12 VMAX        Vmax, maximum voltage magnitude (p.u.)
%    13 VMIN        Vmin, minimum voltage magnitude (p.u.)

%% Define load type
    Zt=1; %Consatnt impedance type load
    It=2; %Constant current type load
    PQt=3;%Constant complex power type load
    ZIPt=4;%Mixed type load
%% Define indices

   BUS_I=1;       %bus number (positive integer)
   PD=2;          %Pd, real power demand (kW)
   QD=3;          %Qd, reactive power demand (kVAr)
   BS=4;          %Bs, shunt susceptance (kVAr injected at V = 1.0 p.u.)
   TYPE=5;        %Type,Load Type(Z-1,I-2,PQ-3,ZIP-4)
   VM=6;          %Vm, voltage magnitude (p.u.)
   VA=7;          %Va, voltage angle (degrees)
   BASE_KV=8;     %basekV, base voltage (kV)
   VMAX=9;        %Vmax, maximum voltage magnitude (p.u.)
   VMIN=10;        %Vmin, minimum voltage magnitude (p.u.)  