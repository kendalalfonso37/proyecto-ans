function [cota,acumulador,tiempo] = cgaussiana (fx,ddx,a,b,h)

#F = inline(g);              # funcion a analizar
#H = input("infrese la funcion derivada: ", "S");
#dxx = inline(H);            # funcion derivada
#a=1;                       # punto inferiorto  
#b=10;                      # punto superior
#OK = FALSE;%%%%%%%%%%%%Bloque de Entrada y validacion de limites%%%%%%%%%%%%%%%%
 #while OK == FALSE 
    #printf('Ingrese el limite inferior de integracion a:  \n');
    #A = input(' ');
    #printf('el limite superior de integracion b: \n');
    #B = input(' ');
  #  if A > B 
   #     printf('El limite inferior a debe de ser menor que el limite superior b\n');
    #else
     #   OK = TRUE;
    #end
 #end%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

###############Obteniendo integral numerica mas aproximada##################
m1 = quad(fx,a,b);
 
 
%%%%%Cuadratura Gaussiana%%%%%%
T1=tic;
t1=-(b-a)/2*1/sqrt(3)+(b+a)/2;
t2=(b-a)/2*1/sqrt(3)+(b+a)/2;
s=(b-a)/2*(fx(t1)+fx(t2));
T2=toc(T1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

###############Calculo de la cota de error##################################
error = s.-m1;


tiempo = T2;
acumulador = s;
cota = abs(error);
#printf('Tiempo transcurrido: %d \n', T2);
#printf('El valor aproximado es :------->%15.8f\n', s);
#printf("La cota de error del metodo es de: %f \n", abs(error));



#Programa Graficador
#t=a:h:b;
#g1=fx(t);
#g2=ddx(t);


#hold on;
#p1=plot(t,g1);
#p2=plot(t,g2);

#set(p1,'Color','red','LineWidth',2)
#set(p2,'Color','green','LineWidth',1)

#ylabel('Y');
#xlabel('X');
#title('Graficas');

#legend('F(x) original', 'metodo')

##hold off;

endfunction
