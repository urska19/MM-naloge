function Z = sistem_uv(W,zac,L,vsote_mi)
%sistem_uv(W,zac,L,vsote_mi) vrne vrednost sistema dveh enacb za veriznico
%enacbi 3.22 in 3.23 v knjigi
%W = [u;v], u in v neznanki
%zac = [x_0 x_n+1; y_0 y_n+1]
%L vektor dolzin palic
%vsote_mi so vsote mi-jev, definirane v 3.16

u = W(1);
v = W(2);

n = length(L)-1;
xi = zeros(1,n+1);
eta = zeros(1,n+1);
% for i=1:n+1
%     xi(i)=L(i)/sqrt(1+(v-u*vsote_mi(i))^2);
% end
xi = L./sqrt(1+(v-u*vsote_mi).^2);
eta = xi.*(v-u*vsote_mi);
Z = [sum(xi)-(zac(1,2)-zac(1,1));sum(eta)-(zac(2,2)-zac(2,1))];
