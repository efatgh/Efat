function [F_BUS,T_BUS,BR_R,BR_X,BR_STATUS,TAP,RATE_A]=idx_branch
%% idx_branch formate is adopted from MATPOWER
%   columns 1-7 must be included in input matrix (in case file)
%    1  F_BUS       f, from bus number
%    2  T_BUS       t, to bus number
%    3  BR_R        r, resistance (ohm)
%    4  BR_X        x, reactance (ohm)
%    5  BR_STATUS   initial branch status, 1 - in service, 0 - out of service
%    6  TAP         ratio, transformer off nominal turns ratio
%    7  RATE_A      RateA, MVA rating of line
%% define the indices
   F_BUS=1;       %f, from bus number
   T_BUS=2;       %t, to bus number
   BR_R=3;        %r, resistance (ohm)
   BR_X=4;        %x, reactance (ohm)
   BR_STATUS=5;   %initial branch status, 1 - in service, 0 - out of service
   TAP=6;         %ratio, transformer off nominal turns ratio
   RATE_A=7;      %RateA, MVA rating of line