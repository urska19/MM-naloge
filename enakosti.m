function eq = enakosti(z)
%linearni pogoji za problem diskretne veriznice

global L;
global zac;


n = length(L)-1;
x = z(1:n+2);
y = z(n+3:end);

eq = [];
w=0;
for i=1:n+1
	w = (x(i+1)-x(i))^2 + (y(i+1)-y(i))^2 - L(i)^2;
	eq(i) = w;
end

% pogoji za prvo in zadnjo tocko
eq(n+2) = x(1)-zac(1,1); 
eq(n+3) = x(n+2)-zac(1,2);
eq(n+4) = y(1)-zac(2,1);
eq(n+5) = y(n+2)-zac(2,2);

% naredimo stolpicni vektor
eq = eq';
