function [cota,acumulador,tiempo] = simpson(fx,F,a,b)
## metodo de la integral simple
## Autor: Kendal Sosa
## Presentacion y entrada de datos
#msgbox("Metodo de la integral simple: \n");
%inputdlg("Ingrese la funcion a integrar:",'Metodo de la Integral Simple');
f = fx;%inline(g{1,1});

## Calculo de la integral simple
tic;
[res, in, ein, err] = quad(f,a,b);
t1 = toc;

## Impresion de datos de salida

acumulador=num2str(res);
tiempo = num2str(t1);
cota=err;

%p1 = strcat("El valor aproximado de la integral es: ", num2str(res),"\n", "Tiempo transcurrido: ", num2str(t1), " Segundos\n", "La cota de error del metodo es de: ", num2str(abs(err)));
%msgbox(p1, "Resultados de la Integral", "help");

endfunction
