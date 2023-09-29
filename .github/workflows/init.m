

function [x l u]=init(N,pd,ng,nc) % Function for initialization

% Lower and upper bounds
l = [2*ones(1,ng) 2*ones(1,nc) 0.1*ones(1,ng) zeros(1,ng) 0.01*ones(1,nc) 3*ones(1,ng)];       % Unknown Variables Lower Bound
u = [76*ones(1,ng) 76*ones(1,nc) 0.5*ones(1,ng) 0.125*zeros(1,ng) 0.1*ones(1,nc) 3*ones(1,ng)];       % Unknown Variables Upper Bound


for i=1:N % Generation of initial solutions (position of crows)
    for j=1:pd
        x(i,j)=l(j)-(l(j)-u(j))*rand; % Position of the crows in the space
    end
end
