
clear

  a=0;h=0;b=0;n=0;N=0;fx=0;ddx=0;F=0;DD=0;xori=0;ftrap=0;xtrap=0;fori=0;
  malo=true;
  while malo==true
    ayuda="VARIABLE: descripcion  \nh: Usada en trapecios (ancho) y el metodo de cuadratura gaussiana \na: Usada en todos los metodos, punto de inicio de la integral \nb: Usada en todos los metodos, punto de final de la integral \nfx: Es la funcion de x a integrar \nddx: Es la segunda derivada de f(x) usada en trapecios para la cota de error \nn: Numero de particiones a tomar en el metodo de punto medio  \nN: Usado en el metodo de simpson \n \n  NOTA: LOS VALORES INICIALES PRESENTES SON SOLO UN EJEMPLO DEL CORRECTO USO DE CADA CAMPO, FAVOR APEGARSE A LA SINTAXIS";
      msgbox (ayuda,'AYUDA INICIAL');
     %_________________PANTALLA DE INICIO PARA LA APLICACIÓN_________________________________
    rowscols = [1,10; 1,10; 1,10; 1,30; 1,30 ; 1,10; 1,10 ];
    hh=0.5;aa=1;bb=2.5;f='x.^4';dd= '12.*x^3'; n=20;N=50;
    prompt = {"h", "a", "b", "fx", "ddx","n", "N"};
    
    defaults = {hh, aa, bb, f, dd, n, N};
    dims = inputdlg(prompt, "Digite los datos necesarios",rowscols, defaults);  
    %__________________________________________________________________________________________

    %EXTRAYENDO LOS DATOS DE LA INTERFAZ
      a = str2num(dims{2,1})
      h = str2num(dims{1,1})
      b = str2num(dims{3,1})
      n = str2num(dims{6,1})
      N = str2num(dims{7,1})
      fx=  inline(dims{4,1});
      ddx= inline(dims{5,1})
      F=  dims{4,1}
      DD= dims{5,1}
      xori= a:0.01:b;
      xtrap=a:h:b; % para el metodo de trapecios   
      ftrap=fx(xtrap);
      fori=fx(xori);
      defaults = {h, a, b, fx, ddx, n, N};
      if a>b || h<0 ||n<0 ||N<0 
        h = errordlg ('error, un parametro es negativo,recuerde que a debe ser menor que b', 'error');
      else
       malo=false;
      endif
 
  endwhile
  
%________________________________________________________________________

%____________________listado_____________________________________________

my_options = {"Metodo de trapecios", "Simpson", "Punto Medio", "Metodo Simple", "Quadratura gaussiana","Ver ayuda"};
[sel, ok] = listdlg ("ListString", my_options, "SelectionMode", "Multiple");

      [cotaT,acumuladorT,tiempoT]=reglaTrapecio(xtrap,fx,ddx,F,DD,a,b,h)
      [xsim,ysim,cotaN,acumuladorN,tiempoN] = simpson(fx,F,a,b,N);
      [xp,yp,cotaP,acumuladorP,tiempoP]=puntomedio(fx,F,a,b,n);
      [cotaS,acumuladorS,tiempoS] = simple(fx,F,a,b);
      [cota,acumulador,tiempo]=cgaussiana(fx,ddx,a,b,h)
if (ok == 1)
  disp ("You selected:");
  for i = 1:numel (sel)
    if(i==1)
        %function [F,DD,cota,acumulador,tiempo] = reglaTrapecio(x,fx,ddx,F,DD,a,b,h)
        rowscols = [1,20; 1,20; 1,10; 1,10; 1,10; 1,10  ];
        prompt = {"fx","Lim inferior","Lim superior","Cota de error", "Valor aproximado", "Tiempo"};
        defaults = {F,a,b,cotaT,acumuladorT,tiempoT};
        dimst = inputdlg (prompt, "METRODO DE TRAPECIOS",rowscols, defaults);
    end
    if(i==2)
        rowscols = [1,20; 1,20; 1,10; 1,10; 1,10; 1,10  ];
        prompt = {"fx","Lim inferior","Lim superior","Cota de error", "Valor aproximado", "Tiempo"};
        defaults = {F,a,b,cotaN,acumuladorN,tiempoN};
        dimsn = inputdlg (prompt, "METODO DE SIMPSON",rowscols, defaults);
    end
    if(i==3)      
          rowscols = [1,20; 1,20; 1,10; 1,10; 1,10; 1,10  ];
          prompt = {"fx","Lim inferior","Lim superior","cota", "resultado", "tiempo"};
          defaults = {F,a,b,cotaP,acumuladorP,tiempoP};
          dimsp = inputdlg (prompt, "METODO DE PUNTO MEDIO",rowscols, defaults);
    end
    if(i==4)
        rowscols = [1,20; 1,20; 1,10; 1,10; 1,10; 1,10  ];
        prompt = {"fx","Lim inferior","Lim superior","Cota de error", "Valor aproximado", "Tiempo"};
        defaults = {F,a,b, cotaS,acumuladorS,tiempoS};
        dims = inputdlg (prompt, "METODO SIMPLE",rowscols, defaults);  
    end
    if(i==5)
        rowscols = [1,20; 1,20; 1,10; 1,10; 1,10; 1,10  ];
        prompt = {"fx","Lim inferior","Lim superior","Cota de error", "Valor aproximado", "Tiempo"};
        defaults = {F,a,b,cota,acumulador,tiempo};
        dimscg = inputdlg (prompt, "CUADRATURA GAUSSIANA",rowscols, defaults); 
    end
     if(i==6)
     ayuda="VARIABLE: descripcion  \nh: Usada en trapecios (ancho) y el metodo de cuadratura gaussiana \na: Usada en todos los metodos, punto de inicio de la integral \nb: Usada en todos los metodos, punto de final de la integral \nfx: Es la funcion de x a integrar \nddx: Es la segunda derivada de f(x) usada en trapecios para la cota de error \nn: Numero de particiones a tomar en el metodo de punto medio  \nN: Usado en el metodo de simpson \n \n  NOTA: LOS VALORES INICIALES PRESENTES SON SOLO UN EJEMPLO DEL CORRECTO USO DE CADA CAMPO, FAVOR APEGARSE A LA SINTAXIS";
     msgbox (ayuda,'AYUDA INICIAL');
      
    end
  endfor
  
      datos=strcat(
"Metodo_______________\t Cota de error     -      Resultado    -     Tiempo",
"\nTrapecios__________\t",num2str(cotaT,"%5.14f"),"\t---",num2str(acumuladorT,"%5.5f"),"\t---",num2str(tiempoT,"%5.10f"), 
"\nSimpson____________\t",num2str(cotaN,"%5.14f"),"\t---",num2str(acumuladorN,"%5.5f"),"\t---",num2str(tiempoN,"%5.10f"),
"\nPunto medio________\t",num2str(cotaP,"%5.14f"),"\t---",num2str(acumuladorP,"%5.5f"),"\t---",num2str(tiempoP,"%5.10f"),
"\nSimple_____________\t",num2str(cotaS,"%5.14f"),"\t---",num2str(acumuladorS,"%5.5f"),"\t---",num2str(tiempoS,"%5.10f"),
"\nCuadratura de Gauss\t",num2str(cota,"%5.14f"),"\t---",num2str(acumulador,"%5.5f"),"\t---",num2str(tiempo,"%5.10f"));
      
      %"\nMetodo de Simpson \t\t",num2str(cotaN,"%5.5f"),"\t\t",num2str(acumuladorN,"%5.5f"),"\t\t",num2str(tiempoN,"%5.5f"),"\nMetodo de punto medio \t\t\t",num2str(cotaP,,"%5.5f"),"\t\t\t",num2str(acumuladorP,"%5.5f"),"\t\t",num2str(tiempoP,"%5.5f"),"\nMetodo de metodo simple \t\t\t",num2str(cotaS,"%5.5f"),"\t\t",num2str(acumuladorS,"%5.5f"),"\t\t",num2str(tiempoS,"%5.5f"),"\nMetodo de cuadratura de Gauss \t\t\t",num2str(cota,"%5.5f"),"\t\t",num2str(acumulador,"%5.5f"),"\t\t",num2str(tiempo,"%5.5f")
      %,"\nMetodo de  \t\t",num2str(cota),"\t\t",acumulador,"\t\t",tiempo);
      
  %"\n",cota,"\t\t",acumulador,"\t\t",tiempo
      msgbox (datos,'Rsumen de datos');
else
  disp ("Desea cancelar?");
endif
  
%________________________________________________________________________
  hold on
  subplot(4,1,1);  
  plot(xori,fori,'.-r'); title ("Funcion original");xlabel("x");ylabel(F);
  subplot(4,1,2);
  plot(xtrap ,ftrap,'@-g');title ("Metodo de trapecios");xlabel("x");ylabel(F);
  subplot(4,1,3) 
  plot(xp,yp,'o-b');title ("Metodo de  punto medio");xlabel("x");ylabel(F);
  subplot(4,1,4);
  plot(xsim,ysim,'*-y');title ("Metodo de simpson");xlabel("x");ylabel(F);
  hold off
  #plot(rx, frx, 'm');
      