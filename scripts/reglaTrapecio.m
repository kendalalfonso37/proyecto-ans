clear
format long;
%h=0.01;a=-2; b=3; %h es el ancho dela base   a es el punto inicial, b es el final
%x=a:h:b; %saco los valores de x en el intervalo
%n = length(x); %n es el numero de intervalor o se trapecios
%fx= x.^2; %x.^2; % funcion
%ddx= 2 ;%2;  %segunda derivada para sacar la coa
%h=0.0001;a=0; b=pi/4;x = a: h : b;   x = a: h : b;  n = length(x); fx= e.^(3*x).*sin(2*x);ddx=  e.^(3*x).*(5.*sin(2*x)+12.*cos(2*x));

%__VALORES DE X QUE SER�N LOS LADOS DE LOS TRAPECIOS Y LUEGO PIDO LA FUNCI�N Y SU SEGUNDA DERIVADA

  f= inputdlg('Digite la funcion fx con FORMATO x.^2+2*x','Metodo de trapecios');
  dd = inputdlg('Digite la 2da derivada de fx. FORMATO x.^2+2*x','Metodo de trapecios');
  fx=inline(f{1,1});
  ddx=inline(dd{1,1});

% PIDIENTO VALORES A B H
aa = inputdlg('Digite el valor inferior del intervalo: ','Metodo de trapecios');
bb = inputdlg('Digite el valor superior del intervalo: ','Metodo de trapecios');
hh = inputdlg('Digite el ancho de cada trapecio: ','Metodo de trapecios');
%__VALORES INICIO, FINAL Y EL HANCHO DEL TRAPECIO
  a =str2num(aa{1,1});
  b =str2num(bb{1,1}); 
  h =str2num(hh{1,1});
  
  x=a:h:b;


 
n = length(x); %n es el numero de intervalor o se trapecios

t1=tic;% Se inicial el cronometro antes de iniciar el algoritmo
acumulador=0; i=1; 
    while i<n+1
      if(i==1 || i==n)       
         acumulador = acumulador + fx(x(i));%acumulador llevar� acumulada la suma de los f(x) 
      else
         acumulador = acumulador + 2*fx(x(i));% los valores intermedios se multiplican por 2
      end
      if(i==n)
      acumulador = acumulador*h/2; %% VALOR APROXIMADO FINAL  
      t2 = toc(t1);
      end
      i++;
    endwhile

%_CALCULO DE LA COTA DEL ERROR VALOR MAXIMO DE F''X
  i=1; derivada=[];
%_____BUSCO EL VALOR MAYOR EN LA DERIVADA, EVALUO EN EL INTERVALO Y GUARDO EN UN VECTOR
      while i<n+1  
        if(!isnumeric (ddx))
          derivada= [derivada ddx(i)]; % valores fx''
         else
          derivada= [derivada ddx]; % valores fx''
         end 
        i++;
      endwhile
   i=1; mayor=0;%%Buscando el valor mayor del fx
%_____BUSCO EL VALOR MAYOR QUE ESTA EN EL VECTOR DE EVALUACIONES DE LA SEGUNDA DERIVADA
      while i<n+1
        if(i==1)
          mayor=derivada(i);
        else
          if(mayor<abs(derivada(i)))
            mayor=derivada(i); %almaceno el mayor valor
          end
        end
      i++;
      endwhile
   
  cota=((b-a)^3/12)*mayor; 
  %Mensajes de salida de la funcion realizada:
  #fprintf('_________________________________________________________________________________\n', fx); 
  #fprintf('\nValor aproximado: %10.6f  \n', acumulador); 
  #fprintf('Cota del error: %10.6f \n', cota);
  #fprintf('Tiempo Estimado: %f Segundos', t2);
  #fprintf('_________________________________________________________________________________\n', fx); 
  p1 = strcat('El valor Aproximado de la integral es: ', num2str(acumulador), "\nTiempo Transcurrido: ", num2str(t2), "\nCota de error del Metodo: ", num2str(cota));
  msgbox(p1, "Resultados de la Integral", "help");
  
  plot(x,fx(x),'r');