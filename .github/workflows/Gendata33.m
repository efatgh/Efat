% Line Data of IEEE-33 Bus System..

function [gendata,capacitor] = Gendata33()

%    Type 1=DSS , 2=Diesel , 3=Solar PV , 4=Wind
%    No. | Type | locBUS | PmaxG | PminG | QmaxG | QminG | ax | bx | cx |
gendata = [ 1	1	1	5	0.5	2.5	0.25	0	1	0
2	2	9	0.25	0.05	0.125	0.025	20	100	12
3	3	17	0.5	0	0	0	0	2.3	0
4	4	24	0.25	0	0	0	0	1.9	0];
capacitor = [1 60 11.76];% $/kvar

