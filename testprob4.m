% This is the main code for Problem four that incorporates the
% interpolation and shooting method for a tuned answer 
function [] = testprob4()
h = .01;
g = 0;% intial guess 1
g1(1) = -3; % initial guess 2
L = 0:h:35;
y = TestProblem4(g,g1); % uses the shooting method 
figure(1)
plot(L,y(1,:))
title('Initial Guesses')
hold on
plot(L,y(2,:))
hold off
ii = 2;
while y(2,length(L)) < 20
    g1(ii) = g1(ii-1)+h;
    g = g - h;
    y = TestProblem4(g,g1(ii));
    ii = ii+ 1;
end
g1(length(g1)+1)= g1(length(g1)) + (20-y(2,length(L)))*(g-g1(length(g1)))/(y(1,length(L))-y(2,length(L))); % linear approximation
y = TestProblem4(g,g1(length(g1))); 
figure(2)
plot(L,y(2,:))
title('Tuned guess')
x = L
yvals = y(2,:)
yprime = g1;
disp(yprime); % diplays all the guesses including the intial and final 
minimumval = min(y(2,:));% diplays the minimum value 
error = abs(y(2,length(L))-20);% displays the error 
yat35 = y(2,length(L));% displays the actual value
end