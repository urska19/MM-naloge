function w = funmin(z)
% nastavimo funkcijo, ki jo moramo minimizirati
% v spremenljivki z imamo nasa vektorja x in y: 
% prvih n+2 komponent vektorja z je nas x, naslednje so nas y

global M;

n = 1/2*(length(z)-4);
y = z(n+3:end);

w = 0;
for i=1:n+1
	w = w + M(i)/2*(y(i)+y(i+1));
end
