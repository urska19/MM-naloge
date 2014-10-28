function v = mravljica(a,N)
% Funkcija simulira potovanje v kvadratu s stranico a. 
% N je stevilo poskusov, v je vektor verjetnosti, da mravljica 
%kvadrat zapusti skozi levo, desno, zgornjo in spodnjo stranico.

v=zeros(1,4);

x=[]; x_1=[]; 
y=[]; y_1=[];
x(1)=0;
y(1)=0;

st_poskusov = N;
while st_poskusov > 0 
for i=1:1000
p=rand(1,1);

if (p<0.25)
	if x(i)==-a  v(1)=v(1)+1;
	break
	end
	if x(i)==a  v(2)=v(2)+1;
	break
	end
	if y(i)==a  v(3)=v(3)+1;
	break
	end
	if y(i)==-a  v(4)=v(4)+1;
	break
	end
x(i+1)=x(i)+1;%desno
y(i+1)=y(i);

elseif (p>0.25) & (p<0.5)
	if x(i)==-a  v(1)=v(1)+1;
	break
	end
	if x(i)==a  v(2)=v(2)+1;
	break
	end
	if y(i)==a  v(3)=v(3)+1;
	break
	end
	if y(i)==-a  v(4)=v(4)+1;
	break
	end
x(i+1)=x(i)-1;%levo
y(i+1)=y(i);

elseif (p>0.5) & (p<0.75)
	if x(i)==-a  v(1)=v(1)+1;
	break
	end
	if x(i)==a  v(2)=v(2)+1;
	break
	end
	if y(i)==a  v(3)=v(3)+1;
	break
	end
	if y(i)==-a  v(4)=v(4)+1;
	break
	end
x(i+1)=x(i);%gor
y(i+1)=y(i)+1;

else
	if x(i)==-a  v(1)=v(1)+1;
	break
	end
	if x(i)==a  v(2)=v(2)+1;
	break
	end
	if y(i)==a  v(3)=v(3)+1;
	break
	end
	if y(i)==-a  v(4)=v(4)+1;
	break
	end
x(i+1)=x(i);%dol
y(i+1)=y(i)-1;
end
end

if st_poskusov==N
x_1=x;
y_1=y;
end
st_poskusov= st_poskusov -1;
end

x;
y;
v=v/N;

clf;
grid on;
hold on;
plot(x_1',y_1','o')
plot(x_1',y_1','r')
hold off;

axis([0-a 0+a 0-a 0+a]);




