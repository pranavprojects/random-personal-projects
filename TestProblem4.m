 % This is just the shooting method function and is not the main code ..

function [y3] = TestProblem4(g,g1)
h = .01;
L = 0:h:35;
y=zeros(0,length(L));
z=zeros(0,length(L));
y(1)=30;
z(1)=g;
y2=zeros(0,length(L));
z2=zeros(0,length(L));
y2(1)=30;
z2(1)=g1;
c = 0.053;
for ii=1:length(L)-1
k1y = z(ii);
k2y = z(ii) + (k1y * h * (1/2));
k3y = z(ii) + (k2y * h * (1/2));
k4y = z(ii) + (k3y * h);
yslope = (k1y + 2*k2y + 2*k3y + k4y)/6;
k1z = c * sqrt(1+z(ii)^2);
k2z = c * sqrt(1+(z(ii)+k1z*h/2)^2);
k3z =  c * sqrt(1+(z(ii)+k2z*h/2)^2);
k4z =  c * sqrt(1+(z(ii)+k3z*h)^2);
vslope = (k1z + 2*k2z + 2*k3z + k4z)/6;
z(ii+1) = z(ii) + vslope * h;
y(ii+1) = y(ii) + yslope * h;

k1y = z2(ii);
k2y = z2(ii) + (k1y * h * (1/2));
k3y = z2(ii) + (k2y * h * (1/2));
k4y = z2(ii) + (k3y * h);
yslope = (k1y + 2*k2y + 2*k3y + k4y)/6;
k1z = c * sqrt(1+z2(ii)^2);
k2z = c * sqrt(1+(z2(ii)+k1z*h/2)^2);
k3z =  c * sqrt(1+(z2(ii)+k2z*h/2)^2);
k4z =  c * sqrt(1+(z2(ii)+k3z*h)^2);
vslope = (k1z + 2*k2z + 2*k3z + k4z)/6;
z2(ii+1) = z2(ii) + vslope * h;
y2(ii+1) = y2(ii) + yslope * h;


end

y3 = [y;y2];


 end

