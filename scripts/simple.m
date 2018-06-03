## metodo de la integral simple
## Autor: Kendal Sosa

## Presentacion y entrada de datos
#msgbox("Metodo de la integral simple: \n");
g = inputdlg("Ingrese la funcion a integrar:",'Metodo de la Integral Simple');
f = inline(g{1,1});
a = inputdlg("Ingrese el limite inferior a evaluar:");
b = inputdlg("Ingrese el limite superior a evaluar:");

# Conversion a Enteros de los inputdlg
aa = str2num(a{1,1});
bb = str2num(b{1,1});

## Calculo de la integral simple
tic;
[res, in, ein, err] = quad(f,aa,bb);
t1 = toc;

## Impresion de datos de salida
p1 = strcat("El valor aproximado de la integral es: ", num2str(res),"\n", "Tiempo transcurrido: ", num2str(t1), " Segundos\n", "La cota de error del metodo es de: ", num2str(abs(err)));
msgbox(p1, "Resultados de la Integral", "help");

#Ploteo de la funcion:
x = [aa:0.05:bb];
plot(x, f(x), 'r');