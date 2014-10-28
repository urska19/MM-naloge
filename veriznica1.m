function X = veriznica1(W0,zac,L,M);
%veriznica1(W0,zac,L,M) resi problem veriznice iz sistema za u in v
%X je 2×(n+2) tabela koordinat vozlisc
%W0 = [u0;v0] zacetna priblizka
%zac = [x_0,x_n+1; y_0,y_n+1]  
%L dolzine palic, M mase palic

n=length(L)-1;
mi=zeros(1,n);
% for i=1:n
%     mi(i)=1/2*(M(i)+M(i+1));
% end
mi = (1/2)*(M(1:end-1)+M(2:end));
vsote_mi = [0,cumsum(mi)];         % delne vsote

W = fsolve(@(W) sistem_uv(W,zac,L,vsote_mi),W0);
u = W(1);
v = W(2);

xi = L./sqrt(1+(v-u*vsote_mi).^2);
eta = xi.*(v-u*vsote_mi);
X = [zac(1,1)+cumsum(xi);zac(2,1)+cumsum(eta)];
X = [zac(:,1) X];
plot(X(1,:),X(2,:));
%hold on;
