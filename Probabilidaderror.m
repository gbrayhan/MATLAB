i=1;
n=1000;
for comp=1:0.1:3
    x1=comp+(comp)*j;
    x2=-comp+(comp)*j;
    x3=-comp-(comp)*j;
    x4=comp-(comp)*j;
    r1=x1+randn(1,n)+j*randn(1,n);
    r2=x2+randn(1,n)+j*randn(1,n);
    r3=x3+randn(1,n)+j*randn(1,n);
    r4=x4+randn(1,n)+j*randn(1,n);
    
    conta=0;
    for k=1:n
        if ((real(r1(1,k))<0)&&(imag(r1(1,k))>=0))
            conta=conta+1;
        elseif ((imag(r1(1,k))<0)&&(real(r1(1,k))>=0))
            conta=conta+1;
        end
        
        if((real(r2(1,k))>0)&&(imag(r2(1,k))>=0))
            conta=conta+1;
        elseif ((imag(r2(1,k))<0)&&(real(r2(1,k))<=0))
            conta=conta+1;
        end
        
        if((real(r3(1,k))>0)&&(imag(r3(1,k))<=0))
            conta=conta+1;
        elseif ((imag(r3(1,k))>0)&&(real(r3(1,k))<=0))
            conta=conta+1;
        end
        
        if((real(r4(1,k))<0)&&(imag(r4(1,k))<=0))
            conta=conta+1;
        elseif ((imag(r4(1,k))>0)&&(real(r4(1,k))>=0))
            conta=conta+1;
        end
    end
    prob(i)=conta/(n*4);
    i=i+1;
end
comp=1:0.1:3;
semilogy(comp,prob)
xlabel('probabilidad')
ylabel('probabilidad de bit erroneo')
grid on
            
        