# Nombre: main.m
# Objetivo: Funcion principal de la aplicacion: Este sera el ejecutable que mandara a
# llamar a las demas funciones de integracion por medio de una interfaz (GUI)
# Jerarquia: /
# Nota: Para mandar a llamar alguna funcion usar la instruccion:
# run scripts/simple.m

# Bienvenida de la funcion y entrada del metodo a utilizar
helpdlg("Ingrese el numero del metodo que desea utilizar para realizar la Integracion en el siguiente cuadro de dialogo:\n\n1: Integracion Simple\n2: Integracion por Metodo del Punto Medio\n3: Integracion por Metodo del Trapecio\n4: Integracion por Regla de Simpson\n5: Integracion por Cuadratura Gaussiana", "Metodos de Integracion");
val = inputdlg("Ingrese el numero del metodo que desea utilizar para realizar la Integracion(1-5):", "Metodos de Integracion");
flag = val{1,1};

# Seleccion del metodo a integrar
# addpath("");
if(flag == '1')
  run simple.m
elseif(flag == '2')
  run puntomedio.m
elseif(flag == '3')
  run alextrapecio.m
elseif(flag == '4')
  run simpson.m
elseif(flag == '5')
  run CuadraturaGaussiana.m
else
  errordlg('El numero que ha ingresado no es correcto','Opcion Equivocada')
endif
