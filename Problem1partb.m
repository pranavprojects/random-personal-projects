 function [] = Problem1partb()
k = 1;
 h = .001;
 t = 0:h:100;
x1=zeros(1,length(t));
y1=zeros(1,length(t));
z1=zeros(1,length(t));
x1(1)=0;
y1(1)=0;
z1(1)=.1;

for ii=1:length(t)-1
    
    kx1= derivativeX((x1(ii)), y1(ii),k);
    kx2= derivativeX((x1(ii)+(h/2)*kx1),(y1(ii)+h/2),k);
    kx3= derivativeX((x1(ii)+(h/2)*kx2),(y1(ii)+h/2),k);
    kx4= derivativeX((x1(ii)+h*kx3),(y1(ii)+h),k);
    slopex = (kx1+2*kx2+2*kx3+kx4);
    ky1= derivativeY(x1(ii),(y1(ii)), z1(ii));
    ky2= derivativeY((x1(ii)+h/2),(y1(ii)+(h/2)*ky1), (z1(ii)+h/2));
    ky3= derivativeY((x1(ii)+h/2),(y1(ii)+(h/2)*ky2), (z1(ii)+h/2));
    ky4= derivativeY((x1(ii)+h),(y1(ii)+h*ky3), (z1(ii)+h));
    slopey = (ky1+2*ky2+2*ky3+ky4);
    kz1= derivZ((y1(ii)));
    kz2= derivZ((y1(ii)+(h/2)*kz1));
    kz3= derivZ((y1(ii)+(h/2)*kz2));
    kz4= derivZ((y1(ii)+h*kz3));
    slopez = (kz1+2*kz2+2*kz3+kz4);
    x1(ii+1)=x1(ii)+(1/6)*slopex*h;
    y1(ii+1)=y1(ii)+(1/6)*slopey*h;
    z1(ii+1)=z1(ii)+(1/6)*slopez*h;
    
    
end
x1;
y1;
z1;
numx = num2str((x1))
numy = num2str((y1))
numz = num2str((z1))
figure
grid on;
subplot(3,1,1);
plot(t,x1);
xlabel('t')
ylabel('x')
title('X vs T')
subplot(3,1,2);
plot(t,y1);
xlabel('t')
ylabel('y')
title('Y vs T')
subplot(3,1,3);
plot(t,z1);
xlabel('t')
ylabel('Z')
title('Z vs T')
figure
plot(x1,y1);
xlabel('x')
ylabel('y')
title('X vs Y')

end
