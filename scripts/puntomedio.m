## Metodo de Integracion por el Punto Medio
## Autor: Kendal Sosa
## Objetivo: Calcular la integral de una funcion dada
## utilizando el metodo del punto medio, dando tambien 
## el tiempo que se tardo la ejecucion del metodo y un
## margen de error del metodo

function puntomedio
  #printf("\n");
  #Entrada de datos
  g = inputdlg("Ingrese la Funcion: ", "Metodo de Integracion por Punto Medio");
  f=inline(g{1,1}); #Convierte el string a una funcion para evaluar
  a=inputdlg("Ingrese el extremo inferior de la Integral: ", "");
  b=inputdlg("Ingrese el extremo superior de la Integral: ", "");
  n=inputdlg("Ingrese la cantidad de puntos medios a utilizar:", "");
  
  # Conversiones de datos para la integracion
  aa = str2num(a{1,1});
  bb = str2num(b{1,1});
  nn = str2num(n{1,1});
  
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
  
  #salida de datos
  p1 = strcat("El valor Aproximado de la integral es: ", num2str(S), "\nTiempo transcurrido: ", num2str(t1), " Segundos\nLa cota de error del metodo es de: ", num2str(abs(err)), "");
  #printf("", );
  #printf(" %f \n", );
  msgbox(p1, "Resultados de la Integral", "help");
  
  #Ploteo de las Funciones:
  plot(x,f(x),'r')
  hold on
  plot(rx, f(rx), 'm')
  
endfunction