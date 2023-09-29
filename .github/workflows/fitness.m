

function ft=fitness(xn,N,ng,nc,Nbus) % Function for fitness evaluation

for i=1:N
    ft(i)=fitnessfunc(xn(i,:),ng,nc,Nbus); % Sphere function
end