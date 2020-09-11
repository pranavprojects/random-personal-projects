function funnytransposeA = myfunnyTranspose(A)
 [Nrows , Ncolumns] = size(A);
 funnytransposeA = zeros(Ncolumns,Nrows);
 p = Nrows + 1; 
 c = Ncolumns + 1;
 for ii = 1:Nrows
     for jj = 1:Ncolumns
         funnytransposeA(jj , ii) = A( p - ii , c - jj  );  
     end 
 end 
end 
