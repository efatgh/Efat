function Z = funcprice(y,ng,nc)
hoursdata = DAYrandata33();
[gendata,capacitor] = Gendata33();
% GEN data
GenType = gendata(:,2);
GenlocBUS = gendata(:,3);
PmaxG = gendata(:,4);
PminG = gendata(:,5);
QmaxG = gendata(:,6);
QminG = gendata(:,7);
ax = gendata(:,8);
bx = gendata(:,9);
cx = gendata(:,10);

% time data
LoadDemandactive	= hoursdata(:,2);
LoadDemandreactive	= hoursdata(:,3);
EP = hoursdata(:,4);
Pvpower	= hoursdata(:,5);
windpower = hoursdata(:,6);
priceGEN = zeros(1,ng);
priceCAP = zeros(1,nc);
for i=1:nc
    priceCAP(i) = capacitor(3)*y(3*ng+nc+i);
end

for j=1:ng
    if round(y(3*ng+2*nc+j))==1
        for t=1:24
            k1(t) = EP(t)*sqrt(y(ng+nc+j)^2+y(2*ng+nc+j)^2);
        end
        priceGEN(j) = sum(k1);
    end
    if round(y(3*ng+2*nc+j))==2
        for t=1:24
        k2 = sqrt(y(ng+nc+j)^2+y(2*ng+nc+j)^2);
        kk2(t) = ax(2)*k2^2 + bx(2)*k2 + cx(2);
        end
        priceGEN(j) = sum(kk2);
    end
    if round(y(3*ng+2*nc+j))==3
        for t=1:24
        k3 = Pvpower(t)*sqrt(y(ng+nc+j)^2+y(2*ng+nc+j)^2);
        kk3(t) = ax(3)*k3^2 + bx(3)*k3 + cx(3);
        end
        priceGEN(j) = sum(kk3);
    end
    if round(y(3*ng+2*nc+j))==4
        for t=1:24
        k4 = windpower(t)*sqrt(y(ng+nc+j)^2+y(2*ng+nc+j)^2);
        kk4(t) = ax(4)*k4^2 + bx(4)*k4 + cx(4);
        end
        priceGEN(j) = sum(kk4);
    end
end
Z = sum(priceGEN)+sum(priceCAP);    
end

