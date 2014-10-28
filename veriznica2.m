function X = veriznica2(W0,zac,L,M);
%veriznica2(W0,zac,L,M) resi problem veriznice preko Newtonovega metode
%X je 2×(n+2) tabela koordinat vozlisc
%W0 = [u0;v0] zacetna priblizka
%zac = [x_0,x_n+1; y_0,y_n+1]
%L palice, M mase

% Resevanje sistema U(u,v)=0, V(u,v)=0 z Newtonovo metodo:
%    U=sum(ksi)-(x_{n+1}-x_0)
%    V=sum(eta)-(y_{n+1}-y_0)

mi = (1/2)*(M(1:end-1)+M(2:end));
ni = [0,cumsum(mi)];

uv = W0;   
u = uv(1);
v = uv(2);
deltax = zac(1,2)-zac(1,1);
deltay = zac(2,2)-zac(2,1);
dudv = [1;1];                  % da vstopimo v zanko

while sum(abs(dudv))>0.00001
  omega = v-u*ni;                               % 3.25
  U = sum(L./sqrt(1+omega.^2))-deltax;          % 3.28
  V = sum(L.*omega./sqrt(1+omega.^2))-deltay;
  % J...Jacobian funkcije [U,V]'              % 3.27
  J1 = sum(L.*(1+omega.^2).^(-3/2).*omega.*ni);
  J2 = sum(L.*(1+omega.^2).^(-3/2).*(-omega));
  J3 = sum(L.*(1+omega.^2).^(-3/2).*(-ni));
  J4 = sum(L.*(1+omega.^2).^(-3/2));
  dudv = [J1 J2;J3 J4]\[U;V];
  uv = uv-dudv;
  u = uv(1);
  v = uv(2);
end;

xi = L./sqrt((1+omega.^2));
eta = L.*omega./sqrt((1+omega.^2));
X = [zac(1,1)+cumsum(xi);zac(2,1)+cumsum(eta)];
X = [zac(:,1) X];
plot(X(1,:),X(2,:),'g');
%hold on;
