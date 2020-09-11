clear;
close
l=10;
E1=71e9;
p=1e3;
b=.05;
e1=.05;
ho=.05;
h=.1;
do1 = .02;
do2 = .03;
amnnode=l/h; % number of nodes
trigmatr1=zeros(amnnode-1,amnnode-1); % trigonal matrix
node1=zeros(amnnode-1,1); % node matrix
node1(1)=0;
node1(amnnode-1)=0;
trigmatr2=zeros(amnnode-1,amnnode-1); % trigonal matrix
node2=zeros(amnnode-1,1); % node matrix
node2(1)=0;
node2(amnnode-1)=0;
x=0:h:l;
bulk=p/(E1);

for ii=1:amnnode-1
    d1 = do1*(1+x(ii)/l);
    I1=(pi()*d1^4)/64;
    constant1= (bulk/I1)*(e1*h^2/l);
    Qx=2-(h^2)*(bulk/I1);
    d2 = do2*(1+x(ii)/l);
    I2=(pi()*d2^4)/64;
    constant2= (bulk/I2)*(e1*h^2/l);
    Qx2=2-(h^2)*(bulk/I2);
    trigmatr1(ii,ii)=Qx; % diagonal part of the matrix
    trigmatr2(ii,ii)=Qx2;
    if ii<amnnode-1 
        trigmatr1(ii,ii+1)=-1;
        trigmatr2(ii,ii+1)=-1;
    end
    if ii>1
        trigmatr1(ii,ii-1)=-1; 
        node1(ii)=constant1*x(ii); 
        trigmatr2(ii,ii-1)=-1; 
        node2(ii)=constant2*x(ii); 
    end
end
x
y1 = [0;inv(trigmatr1)*node1;0]
y2 = [0;inv(trigmatr2)*node2;0]


figure
plot(x,y1)
title('Buckle d = .02')
xlabel('X');
ylabel('Y');
figure
plot(x,y2)
title('Buckle d = .03')
xlabel('X');
ylabel('Y');

