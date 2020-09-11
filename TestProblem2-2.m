clear;
close;
g = 9.8;
m = 10;
c = 20;
k = 600;
h = .005;
t= 0:h:1;
y=zeros(1,length(t));
v=zeros(1,length(t));
y(1)=10;
v(1)=0;
for ii=1:length(t)-1
yslope = v(ii);
vslope = (-1*(y(ii)*k + c*v(ii)- m*g))/m;
v(ii+1) = v(ii) + vslope * h;
y(ii+1) = y(ii) + yslope * h;
if((v(ii)/abs(v(ii)) == -1) & (v(ii+1)/abs(v(ii+1)) == 1))
minval = y(ii+1);
end

end
yat1 = y(length(t));
yat1
minval
t
dydt = v
y

figure;
subplot(2,1,1)
plot(t,y)
xlabel('time')
ylabel('position')
title('position vs time')
subplot(2,1,2)
plot(t,v)
xlabel('time')
ylabel('velocity')
title('velocity vs time')
