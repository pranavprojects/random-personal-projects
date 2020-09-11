function dx = derivativeX(x,y,k)
dx = 15.6*(y - x + k*(.714*x+.2145*(abs(x+1)-abs(x-1))));
end