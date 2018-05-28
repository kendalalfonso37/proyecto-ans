## Metodo de Integracion por el Punto Medio
## Autor: Kendal Sosa
## Objetivo: Calcular la integral de una funcion dada
## utilizando el metodo del punto medio, dando tambien 
## el tiempo que se tardo la ejecucion del metodo y un
## margen de error del metodo

function puntomedio
  printf("Metodo de Integracion numerica a traves del metodo del Punto Medio\n");
  #Entrada de datos
  g = input("Ingrese la Funcion: ", 'S');
  f=inline(g); #Convierte el string a una funcion para evaluar
  a=input("Ingrese el extremo inferior de la Integral: ");
  b=input("Ingrese el extremo superior de la Integral: ");
  n=input("Ingrese la cantidad de puntos medios a utilizar:");
  
  #Vectores para plotear mas adelante
  x = [a:0.05:b];
  rx = linspace(a,b,n);
  
  #Obteniendo integral numerica mas aproximada:
  q = quad(f,a,b);
  
  #Definiendo la h inicial
  h=(b-a)/n;
  S=0;
  # Aplicacion de la regla del punto medio:
  tic;
  for i = 1:n
    S = S + (h)*(f((a+(a+h))/2));
    a=a+h;
  endfor
  t1=toc;
  #Fin del metodo del punto medio
  
  #Calculo de la cota de error:
  err = S.-q;
  
  #salida de datos
  printf("El valor Aproximado de la integral es: %f \n", S);
  printf("Tiempo transcurrido: %f Segundos\n", t1);
  printf("La cota de error del metodo es de: %f \n", abs(err));
  
  #Ploteo de las Funciones:
  plot(x,f(x),'r')
  hold on
  plot(rx, f(rx), 'g')
  
endfunction