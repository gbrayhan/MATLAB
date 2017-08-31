%Programa Final
%Brayhan Alejandro Gabriel Guerrero
%6CM5

comp=input('Ingrese numero de componentes: ');
y=@(x)0;
A=0;
x=0:1/100000:30;

for co=1:1:comp
    fprintf('igrese la amplitud %d: ',co);
    ia=input('');
    fprintf('ingrese la frecuencia %d: ',co);
    iff=input('');
    fprintf('Ingresa el tipo de funcion 1=sen 2=cos para %d: ',co);
    tip=input('');
  
    if tip==1
        y=@(x) y(x)+(ia*sin(2*pi*iff*x));
    elseif tip==2
        y=@(x) y(x)+(ia*cos(2*pi*iff*x));
    else 
        fprintf('ERROR, esta funcion no sera valida ');
    end
    A=A+abs(ia);
    
    if co==1;
        f=iff;
    end
    if iff<f
        f=iff;
    end
    
end
T=1/f;

cas=input('Introduce el tipo de muestreo, 1 Ideal, 2 Natural & 3 Techo plano: ');

fprintf('la frecuencia minima es: %d',f);
fprintf('la amplitud maxima es: %d',A);
if cas==1
    mu1=input('introduce el numero de muestras: ');
    subplot(1,2,1);
    plot(x, y(x));
    ylim([-A A]);
    xlim([0 2*T]);
    grid on;
    hold on;
    title('Señal Original')
    
    for x2=0:((T)/mu1):2*T
        y2=y(x2);
             
        x3=[x2,x2];
        y3=[0,y2];
        subplot(1,2,2);
        plot(x3,y3);
        ylim([-A A]);
        xlim([0 2*T]);
        grid on;
        hold on;
        title('Señal Muestreada')
    end
%end
elseif cas==2
    
    per=1/f; %periodo señal
    num=input('Introduce el numero de muestras: ');%numero de muestras(preguntar)
    frec=num*f;% frec tren de pulsos
    T2=1/frec; %periodo tren pulsos
    D=T2/2; %Tiempo alto
    %N=frec; %numero de ciclos
    
    subplot(1,2,1);
    plot(x, y(x));
    ylim([-A A]);
    xlim([0 2*T]);
    grid on;
    hold on;
    title('Señal Original')
    
    x=0:(1/(frec*100)):2*per; 
    d=[T2/4:T2:2*per];
    ydo=pulstran(x,d,'rectpuls',D);

    sal=ydo.*(y(x));
    subplot(1,2,2)
    plot(x,sal);  
    ylim([-A A])
    xlim([0 2*per])
    grid on
    title('Señal Muestreada')
elseif cas==3
    mues=input('Introduce el numero de muestras: '); %muestras por periodo (preguntar)
    ts=0:T/mues:2*T; %tiempo de muestreo
    f=y(ts); %funcion
    
    subplot(1,2,1);
    plot(x, y(x));
    %ylim([-A A]);
    xlim([0 2*T]);
    grid on;
    hold on;
    title('Señal Original')
    subplot(1,2,2);
    stairs(ts,f)
    xlim([0 2*T]);
    grid on
    hold on
    title('Señal Muestreada')
end