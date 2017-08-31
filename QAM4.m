n=1000; %Componentes
x1=3+3j;
x2=3-3j;
x3=-3+3j;
x4=-3-3j;


hold on %modificacion
plot(real(x1),imag(x1),'kp') %grafica
%hold on
plot(real(x2),imag(x2),'kp')
plot(real(x3),imag(x3),'kp')
plot(real(x4),imag(x4),'kp')

axis([-6 6 -6 6]);
r1=x1+randn(1,n)+j*randn(1,n);%ruido
r2=x2+randn(1,n)+j*randn(1,n);
r3=x3+randn(1,n)+j*randn(1,n);
r4=x4+randn(1,n)+j*randn(1,n);
disp(r1)

plot(real(r1),imag(r1),'ro')
plot(real(r2),imag(r2),'bo')
plot(real(r3),imag(r3),'go')
plot(real(r4),imag(r4),'yo')
xlabel('Fase')
ylabel('Cuadratura')
grid on
