%function [nb,nl,Nbibc,CFT,BIBC,BCBV,DLF]=makeBIBCandBCBV(baseMVA,baseKV,bus,branch);
function [BIBC,DLF]=makeBIBCandDLF(baseMVA,baseKV,bus,branch);
% Input are bus data and branch data
% Outputs are nb (No. of buses),nl(No. of lines),Nord(Order of buses in depth preference), CFT (connection matrix from which node diagram can be  drawn)
%  and BIBC (Bus injection branch current matrix)
[Zt,It,PQt,ZIPt,BUS_I,PD,QD,BS,TYPE,VM,VA,BASE_KV,VMAX,VMIN]=idx_bus;
[F_BUS,T_BUS,BR_R,BR_X,BR_STATUS,TAP,RATE_A]=idx_branch;
stat=branch(:,BR_STATUS);
branch(find(stat==0),:)=[]; % Actual branch matrix in which current flowing
nl=length(branch(:,F_BUS));
nb=length(bus(:,BUS_I));
baseKV=max(bus(:,BASE_KV));
f=branch(:,F_BUS); % list of 'from' branches
t=branch(:,T_BUS); % list of 'to' branches

%% Code for finding out ending nodes (if necessary uncomment)
%before running this we have to add dummy nodes at the end of frombus to Tobus as (0,0)
% % for i=1:nl
% %     if (branch(i,2)-branch(i,1))~=1
% %      Nd1(i)=[i]; %List of ending node in each path
% %     else
% %         Nd1(i)=0; % put zero wherever end nodes are not available
% %     end
% % end
% % Nd=Nd1; % ending nodes


%% Code for making connection matrix
Cf = sparse(1:nl, f, ones(nl, 1), nl, nb);      %% connection matrix for line & from buses
Ct = sparse(1:nl, t, ones(nl, 1), nl, nb);      %% connection matrix for line & to buses
Cft=Cf+Ct;
Cft1=Cft'*Cft; % here diagonals are not unity hence for make them unity we have to develop some logic
% logic for making Cft1 diagonals to be unity
Coe=ones(nb)-eye(nb); % Matrix whose all diagonals are zero and off-diagonals are unity
Cft2=Cft1.*Coe; % Nodes to nodes connection represents by 1 else zero
CFT=triu(Cft2); % Upper triangular of Cft2 is actual connection matrix
%h = view(biograph(CFT)) % This will creates diagram of buses connection (if required)

%% Code for finding out shortest path from 1st bus for all buses (if necessary uncomment)
% % [dist,path,pred] = graphshortestpath(CFT,1); % Function for finding out shortest path
% % for k=1:length(path)
% %     if Nd(k)~=0
% %         Np(k)=path(k); % paths to ending nodes from node1 only
% %     %else
% %         %Np(k)=0
% %     end
% % end
% % VND=find(Nd>0); % List of ending nodes only

%% Code for finding order in which all buses have depth
Ze=zeros(nb);% Zeros matrix of nbxnb
ZeV=Ze(:,1);% Vector of zeros 

% Order in which nodes are have depth
for i=1:nb
    Vord(:,i)=sort([ZeV(1:(nb-length(graphtraverse(CFT,i))));graphtraverse(CFT,i)']);
end

Nord=Vord; % Order of nodes in which current will flow
%% Code for finding out BIBC matrix
for l=1:length(Nord(1,:))
    for m=1:length(Nord(1,:))
        a=Nord(l,m);
        if a>0
            bibc(a,m)=1;% bibc(a,m)=a (if we want in terms of no. of buses)
            Nbibc(a,m)=a; % order buses depth
            if a==0
            bibc(l,m)=0;
            Nbibc(l,m)=0; % Order of buses depth 
        end
    end
    end
end
Nbibc=Nbibc; % order of buses depth
BIBC=bibc(2:nb,2:nb)'; % Final BIBC matrix


R=branch(:,BR_R);
X=branch(:,BR_X);
j=sqrt(-1);
Za=R+j*X; % actual vaule of impedance
%baseMVA=100;%base MVA
%basekV=12.66;%base KV
Zbase=(baseKV^2)/baseMVA; % base impedance
Z=Za/Zbase; % P.U. value of impedance
BCBV=BIBC'*diag(Z); % Final BCBV matrix
DLF=BCBV*BIBC; % delV=BCBV*BIBC*I=DLF*I



