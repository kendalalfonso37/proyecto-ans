## Metodo de Integracion por el Punto Medio
## Autor: Kendal Sosa
## Objetivo: Calcular la integral de una funcion dada
## utilizando el metodo del punto medio, dando tambien 
## el tiempo que se tardo la ejecucion del metodo y un
## margen de error del metodo
function [F,cota,acumulador,tiempo,x,rx,fx,frx] = puntomedio(x,fx,F,a,b,n)
  %%_____PARAMETROS DE LA FUNCI�N puntomedio_______________
  % x es el vector que contiene las x a evaluar
  % fx es la funci�n evaluable
  % ddx es la segunda derivada evaluable
  % F es la funci�n como cadena para mostrar al final
  % DD es la segunda derivada como cadena
  % a es el punto inicial del interbalo
  % b es el punto final del interbalo
  % h es el ancho de cada trapecio pra este caso
  
  %%______PARAMETROS DE SALIDA____________________________
  % cota es la cota de error que se calcul�
  % acumulador es el valor de la integral
  % tiempo es el tiempo que tardo en realizarse el algoritmo
  
  #Entrada de datos
  %g = inputdlg("Ingrese la Funcion: ", "Metodo de Integracion por Punto Medio");
  f=fx;%inline(g{1,1}); #Convierte el string a una funcion para evaluar
  %a=inputdlg("Ingrese el extremo inferior de la Integral: ", "");
  %b=inputdlg("Ingrese el extremo superior de la Integral: ", "");
  %n=inputdlg("Ingrese la cantidad de puntos medios a utilizar:", "");
  
  # Conversiones de datos para la integracion
  aa = a;
  bb = b; 
  nn = n;
   
  #Vectores para plotear mas adelante
  x = [aa:0.05:bb];
  rx = linspace(aa,bb,nn);
  
  #Obteniendo integral numerica mas aproximada:
  q = quad(f,aa,bb);
  
  #Definiendo la h inicial
  h=(bb-aa)/nn;
  S=0;
  # Aplicacion de la regla del punto medio:
  tic;
  for i = 1:nn
    S = S + (h)*(f((aa+(aa+h))/2));
    aa=aa+h;
  endfor
  t1=toc;
  #Fin del metodo del punto medio
  #Calculo de la cota de error:
  err = S.-q;
  acumulador=S;
  tiempo=t1;
  cota=abs(err);
  #salida de datos
  %p1 = strcat("El valor Aproximado de la integral es: ", num2str(S), "\nTiempo transcurrido: ", num2str(t1), " Segundos\nLa cota de error del metodo es de: ", num2str(abs(err)), "");
  #printf("", );
  #printf(" %f \n", );
  %msgbox(p1, "Resultados de la Integral", "help");

  
  fx=f(x);
  frx=f(rx);
  
endfunction