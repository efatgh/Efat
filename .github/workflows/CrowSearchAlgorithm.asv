
format long; close all; clear all; clc
Nbus = 76;
ng = 3;
nc = 3;
pd=4*ng+2*nc; % Problem dimension (number of decision variables)
N=5; % Flock (population) size
AP=0.1; % Awareness probability
fl=2; % Flight length (fl)

[x,l,u]=init(N,pd,ng,nc); % Function for initialization

xn=x;
ft=fitness(xn,N,ng,nc,Nbus); % Function for fitness evaluation

mem=x; % Memory initialization
fit_mem=ft; % Fitness of memory positions

tmax=10; % Maximum number of iterations (itermax)
finalfit = zeros(1,tmax);
iteration = 1:tmax;
for t=1:tmax

    num=ceil(N*rand(1,N)); % Generation of random candidate crows for following (chasing)
    for i=1:N
        if rand>AP
            xnew(i,:)= x(i,:)+fl*rand*(mem(num(i),:)-x(i,:)); % Generation of a new position for crow i (state 1)
        else
            for j=1:pd
                xnew(i,j)=l(j)-(l(j)-u(j))*rand; % Generation of a new position for crow i (state 2)
            end
        end
    end
    
    xnew = abs(xnew);

    xn=xnew;
    for i=1:N % Update position and memory
         xnew(i,:) = max(xnew(i,:), l);
        xnew(i,:) = min(xnew(i,:), u);
         ft(i)=fitness(xnew(i,:),1,ng,nc,Nbus);   
        
    end
    %ft=fitness(xn,N,ng,nc,Nbus); % Function for fitness evaluation of new solutions

    for i=1:N % Update position and memory
        if xnew(i,:)>=l & xnew(i,:)<=u
            x(i,:)=xnew(i,:); % Update position
            if ft(i)<fit_mem(i)
                mem(i,:)=xnew(i,:); % Update memory
                fit_mem(i)=ft(i);
            end
        end
    end

    ffit(t)=min(fit_mem); finalfit(t) = min(fit_mem); % Best found value until iteration t
    min(fit_mem);
     disp(['Iteration ' num2str(t) ': fit_mem = ' num2str(ffit(t))]);
end
plot(iteration,finalfit);
ngbest=find(fit_mem== min(fit_mem));
g_best=mem(ngbest(1),:); % Solutin of the problem
x = g_best

%x=[47 52 73 15 32 60 0.490081 0.5 0.37511 0 0 0 0.05197 0.125 0.04291 3 3 3 ]

Ngp = round(x(1:ng));
pgvalue= x((ng+nc+1):(2*ng+nc));
Qgvalue= x((2*ng+nc+1):(3*ng+nc));
NQC = round(x(ng+1:ng+nc));
QCAPvalue=x((3*ng+nc+1):(4*ng+nc));
[VPU , Cp , PQless,P,Q] = fitnessfuncvalue(x,ng,nc,Nbus)
disp(['The bus with DGS of x are: ', num2str(Ngp)])
disp(['The value DG-P are: ', num2str(1000.*pgvalue)])
disp(['The value DG-Q are: ', num2str(1000.*Qgvalue)])

tvd=sum(abs(1-VPU(:,1)));
TREALP=sum(P(:,1));
disp(['The bus with CAP of x are: ', num2str(NQC)])
disp(['The value CAP-Q are: ', num2str(1000.*QCAPvalue)])
VPUsca=VPU
save vpusca.mat VPUsca
load BASEVPU;
load BASEploss;
load PSOVPU;
load PSOPQloss;
load BASEPQloss
load PSOP;
load PSOQ;
load BASEQ;
load BASEP;
figure(1)
 plot(1:76,baseVPU(:,1),'r',1:76,PSOVPU(:,1),'b',1:76,VPU(:,1),'g')
 legend('base','PSO','CSA')
xlabel('bus numbers')
ylabel('V(P.U) ')
title('optimum with placement DG@C')
 figure(2)
 plot(1:75,Pless(:,1),'r',1:75,PSOP(:,1),'b',1:75,P(:,1),'g')
 legend('base','PSO','CSA')
xlabel('bus numbers')
ylabel('Ploss(VAR)')
title('Ploss  with placement DG@C')
  figure(3)
 plot(1:75,Qless(:,1),'r',1:75,PSOQ(:,1),'b',1:75,Q(:,1),'g')
 legend('base','PSO','CSA')
xlabel('bus numbers')
ylabel('Qloss(VAR)')
title('Qloss  with placement DG@C')
  figure(4)
 plot(1:24,basePQless,'r',1:24,psoPQless,'b',1:24,PQless,'g')
 legend('base','PSO','CSA')
xlabel('bus numbers')
ylabel('Sloss(VAR)')
title('Sloss  with placement DG@C ')
load BestCost.mat
figure(5)
plot(iteration,BestCost,'b',iteration,ffit,'g')
title('csa ')
xlabel('itration')
ylabel('fitness ')

figure(6)
subplot(2,1,1)
 plot(1:76,PSOVPU)
 legend('base','PSO','CSA')
xlabel('bus numbers')
ylabel('V(P.U) ')
subplot(2,1,2)
 plot(1:76,VPU)
title('optimum with placement DG@C')
