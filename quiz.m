clear x y;

x = 0:0.01:1;

% x = rand(100,1)
for ii = 1:length(x)
    y(ii) = -(x(ii)^4 - 4*x(ii)^3 + 6 * x(ii)^2);
end

close all
plot(x,y)
% axis([0 1.2 -5 1])
grid on

