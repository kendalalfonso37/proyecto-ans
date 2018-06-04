 format long;
 TRUE = 1;
 FALSE = 0;
 printf('Metodo de simpson.\n\n');
 printf('Ingrese la funcion en terminos de x:\n');
 printf('Por ejemplo: cos(x)\n');
 g = input(' ',"s");  #Almacena la funcion ingresada en f
 F = inline(g);  #Conecta la cadena ingresada a una variable (en este caso la funcion que se ingreso para su respectiva evaluacion) y la define con inline
 OK = FALSE;
 while OK == FALSE 
 printf('Ingrese el Limite inferior de integracion: ');
 A = input(' ');
 printf('Ingrese el Limite superior de integracion:');
 B = input(' ');
 if A > B 
 printf('El limite inferior debe ser menor que el limite superior\n');
 else
 OK = TRUE;
 end
 end 
 OK = FALSE;
 while OK == FALSE 
 printf('Ingrese un numero entero positivo N.\n');
 N = input(' ');
 if N > 0 & (N-fix(N./2).*2) == 0 
     #X-fix(X./Y).*Y
 OK = TRUE;
 else
 printf('La entrada debe ser un numero positivo\n');
 end
 end
 if OK == TRUE 
#STEP 1
 H = (B-A)/N;
#printf('El valor de H es:%12.8f\n',H);
#STEP 2
 XI0 = F(A) + F(B);
#summation of f(x(2*I-1))
 XI1 = 0.0;
#summation of f(x(2*I))
 XI2 = 0.0;
#STEP 3
 NN = N - 1;
 for I = 1:NN
#STEP 4
 X = A + I * H;
# printf('Nodo:%12.8f\n',X);
#STEP 5
 if (I-fix(I./2).*2) == 0  
     #X-fix(X./Y).*Y
 XI2 = XI2 + F(X);
 else
 XI1 = XI1 + F(X);      
 end
 end
#STEP 6
 XI = (XI0 + 2.0 * XI2 + 4.0 * XI1) * H / 3.0;
# STEP 7
 printf('\nLa integral de %12.8f a %12.8f es de\n', A, B);
 printf('%12.8f\n', XI);
 end