## metodo de la integral simple
## Autor: Kendal Sosa

## Presentacion y entrada de datos
printf("Metodo de la integral simple: \n");
g = input("Ingrese la funcion a integrar:",'S');
f = inline(g);
a = input("Ingrese el limite inferior a evaluar: \n");
b = input("Ingrese el limite superior a evaluar: \n");

## Calculo de la integral simple
tic;
[res, in, ein, err] = quad(f,a,b);
t1 = toc;

## Impresion de datos de salida
printf("El valor aproximado de la integral es: %f\n", res);
printf("Tiempo transcurrido: %f Segundos\n", t1);
printf("La cota de error del metodo es de: %f\n", abs(err));

#Ploteo de la funcion:
x = [a:0.05:b];
plot(x,f(x), 'r');