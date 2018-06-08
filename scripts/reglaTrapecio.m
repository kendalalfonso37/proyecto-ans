function [cota,acumulador,tiempo] = reglaTrapecio(x,fx,ddx,F,DD,a,b,h)
  %%_____PARAMETROS DE LA FUNCIÓN TRAPECIO_______________
  % x es el vector que contiene las x a evaluar
  % fx es la función evaluable
  % ddx es la segunda derivada evaluable
  % F es la función como cadena para mostrar al final
  % DD es la segunda derivada como cadena
  % a es el punto inicial del interbalo
  % b es el punto final del interbalo
  % h es el ancho de cada trapecio pra este caso
  
  %%______PARAMETROS DE SALIDA____________________________
  % cota es la cota de error que se calculó
  % acumulador es el valor de la integral
  % tiempo es el tiempo que tardo en realizarse el algoritmo
 
  
format long;
%fx= e.^(3*x).*sin(2*x);
%ddx= e.^(3*x).*(5.*sin(2*x)+12.*cos(2*x));
%_________________________________METODO DEL TRAPECIO______________________________________
   
      
    %__VALORES DE X QUE SERÁN LOS LADOS DE LOS TRAPECIOS Y LUEGO PIDO LA FUNCIÓN Y SU SEGUNDA DERIVADA
    n = length(x); %n es el numero de intervalor o se trapecios
    fprintf('_________________________________________________________________________________\n'); 
    t1=tic;% Se inicial el cronometro antes de iniciar el algoritmo
    acumulador=0; i=1; 
        while i<n+1
          if(i==1 || i==n)       
             acumulador = acumulador + fx(x(i));%acumulador llevará acumulada la suma de los f(x) 
          else
             acumulador = acumulador + 2*fx(x(i));% los valores intermedios se multiplican por 2
          end
          if(i==n)
          acumulador = acumulador*h/2; %% VALOR APROXIMADO FINAL 
          tiempo=toc(t1);
          fprintf('Tiempo transcurrido: %10.6f \n',tiempo);
          end
          i++;
        endwhile
        
      %plot(x,fx(x),'r')
      %fprintf('\nValor aproximado: %10.6f  \n', acumulador); 
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
       
      %COTA DEL ERROR PARA ESTE METODO:
      cota=abs(quadcc(fx,a,b,0.00000000000001)-acumulador);
      
      

    
%______________________FIN TRAPECIO______________________________________________________________________________
endfunction