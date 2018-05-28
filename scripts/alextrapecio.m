
h=0.0001;a=0; b=pi/4;x = a: h : b;n = length(x);
fx= e.^(3*x).*sin(2*x);ddx=  e.^(3*x).*(5.*sin(2*x)+12.*cos(2*x));
%fx = input('Digite la función conformato @(x) x.^3+2*x+sin(x): ');
%ddx = input('Digite la ddx conformato @(x) x.^3+2*x+sin(x): ');
%a = input('Digite el valor inferior del intervalo: ');
%b = input('Digite el valor superior del intervalo: ');
%h = input('Digite el valor h : ');
fprintf('_________________________________________________________________________________\n', fx); 
x = a: h : b;
n = length(x);

  
t1=tic;
acumulador=0; i=1;
    while i<n+1
      if(i!=1 && i!=n)
        acumulador = acumulador + 2*fx(i);
      else
        acumulador = acumulador + fx(i);
      end
      if(i==n)
      acumulador = acumulador *h/2; %% VALOR APROXIMADO
      
      fprintf('Tiempo transcurrido: %d \n',toc(t1));
      end
      i++;
    endwhile
 
  tf = t1;p1= plot(x,fx ,'r'); 
 
  fprintf('\nValor aproximado: %d \n', acumulador); 
  %CALCULO DE LA COTA DEL ERROR VALOR MAXIMO DE F''X
  i=1; derivada=[];
  while i<n+1
    derivada= [derivada ddx(i)]; % valores fx''
    i++;
  endwhile
  i=1; mayor=0;%%Buscando el valor mayor del fx
  while i<n+1
    if(i==1)
      mayor=derivada(i);
    else
      if(mayor<abs(derivada(i)))
        mayor=derivada(i);
      end
    end
  i++;
  endwhile
 
  %COTA DEL ERROR PARA ESTE METODO:
  
  cota=((b-a)^3/12)*mayor;
  fprintf('Cota del error: %2.4f \n', cota);
  fprintf('_________________________________________________________________________________\n', fx); 