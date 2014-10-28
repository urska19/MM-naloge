function X = veriznica3(ZAC,l,m);
%veriznica3(zac,L,M) resi problem veriznice preko funkcije sqp() za iskanje vezanih ekstremov.
%X je 2×(n+2) tabela koordinat vozlisc
%ZAC=[x_0,x_n+1; y_0,y_n+1]
%l palice, m mase

global M;
global L;
global zac;
M = m;
L = l;
zac = ZAC;

n = length(L)-1;

%zacetni priblizek

%h = (zac(1,2)-zac(1,1))/(length(L));   
%z = [zac(1,1):h:zac(1,2)];              % razporeditev po x
%z = [z zac(2,1)*ones(1,n+2)]';          % dodamo se y 
z = ones(1,2*n+4)' + rand(1,2*n+4)';

%poiscemo vezani ekstrem
X = sqp(z,@funmin,@enakosti,[]);

% se slika
plot(X(1:n+2),X(n+3:2*n+4),'b');
hold on;
