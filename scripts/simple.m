## metodo de la integral simple
## Autor: Kendal Sosa

## Presentacion y entrada de datos
#msgbox("Metodo de la integral simple: \n");
function [F,cota,acumulador,tiempo] = simple(x,fx,F,a,b,n)
  %%_____PARAMETROS DE LA FUNCI�N simple_______________
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
  
  #g = inputdlg("Ingrese la funcion a integrar:",'Metodo de la Integral Simple');
  #f = inline(g{1,1});
  #a = inputdlg("Ingrese el limite inferior a evaluar:", "");
  #b = inputdlg("Ingrese el limite superior a evaluar:", "");
  f = inline(F);

  # Conversion a Enteros de los inputdlg
  #aa = str2num(a{1,1});
  #bb = str2num(b{1,1});

  ## Calculo de la integral simple
  tic;
  [acumulador, in, ein, cota] = quad(f,a,b);
  tiempo = toc;

  ## Impresion de datos de salida
  #p1 = strcat("El valor aproximado de la integral es: ", num2str(res),"\n", "Tiempo transcurrido: ", num2str(t1), " Segundos\n", "La cota de error del metodo es de: ", num2str(abs(err)));
  #msgbox(p1, "Resultados de la Integral", "help");

  #Ploteo de la funcion:
  #x = [a:0.05:b];
  #plot(x, f(x), 'r');
  
  ##
  fx=f(x);
  #frx=f(rx);
  
endfunction