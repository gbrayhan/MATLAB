N=1000; %Componentes
a=[];
b=[];
arre=[];
salt=1;
for n=-9:6:9
    for m=-9:6:9
        if (m*n ~=0)
            a(salt)=[m];
            b(salt)=[n];
            salt=salt+1;
        end
    end
end
arre=complex(a,b);
disp(arre(3))
hold on

for i=1:1:16
    plot(real(arre(i)),imag(arre(i)),'k*') %grafica
end
axis([-14 14 -14 14]);
rx=[;];
for num=1:1:16
    rx(num,:)=arre(num)+randn(1,N)+j*randn(1,N);
end
plot(rx,'g.');
grid on








