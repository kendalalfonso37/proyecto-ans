
clear
%_________________PANTALLA DE INICIO PARA LA APLICACIÓN_________________________________
rowscols = [1,10; 1,10; 1,10; 1,30; 1,30 ; 1,30; 1,30 ];
hh=0.5;aa=1;bb=5;f='x.^4';dd= '12.*x^3'; n=20;N=50;
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
%________________________________________________________________________

      [cotaT,acumuladorT,tiempoT]=reglaTrapecio(xtrap,fx,ddx,F,DD,a,b,h)
      %function [F,DD,cota,acumulador,tiempo] = reglaTrapecio(x,fx,ddx,F,DD,a,b,h)
      rowscols = [1,20; 1,20; 1,10; 1,10; 1,10; 1,10  ];
      prompt = {"fx","Lim inferior","Lim superior","Cota de error", "Valor aproximado", "Tiempo"};
      defaults = {F,a,b,cotaT,acumuladorT,tiempoT};
      dims = inputdlg (prompt, "METRODO DE TRAPECIOS",rowscols, defaults);

      [xsim,ysim,cotaN,acumuladorN,tiempoN] = simpson(fx,F,a,b,N);
      rowscols = [1,20; 1,20; 1,10; 1,10; 1,10; 1,10  ];
      prompt = {"fx","Lim inferior","Lim superior","Cota de error", "Valor aproximado", "Tiempo"};
      defaults = {F,a,b,cotaN,acumuladorN,tiempoN};
      dims = inputdlg (prompt, "METODO DE SIMPSON",rowscols, defaults);
      
      
      [xp,yp,cotaP,acumuladorP,tiempoP]=puntomedio(fx,F,a,b,n);
      rowscols = [1,20; 1,20; 1,10; 1,10; 1,10; 1,10  ];
      prompt = {"fx","Lim inferior","Lim superior","cota", "resultado", "tiempo"};
      defaults = {F,a,b,cotaP,acumuladorP,tiempoP};
      dims = inputdlg (prompt, "METODO DE PUNTO MEDIO",rowscols, defaults);
      
      
      [cotaS,acumuladorS,tiempoS] = simple(fx,F,a,b);
      rowscols = [1,20; 1,20; 1,10; 1,10; 1,10; 1,10  ];
      prompt = {"fx","Lim inferior","Lim superior","Cota de error", "Valor aproximado", "Tiempo"};
      defaults = {F,a,b, cotaS,acumuladorS,tiempoS};
      dims = inputdlg (prompt, "METODO SIMPLE",rowscols, defaults);  
      
      [cota,acumulador,tiempo]=cgaussiana(fx,ddx,a,b,h)
      rowscols = [1,20; 1,20; 1,10; 1,10; 1,10; 1,10  ];
      prompt = {"fx","Lim inferior","Lim superior","Cota de error", "Valor aproximado", "Tiempo"};
      defaults = {F,a,b,cota,acumulador,tiempo};
      dims = inputdlg (prompt, "CUADRATURA GAUSSIANA",rowscols, defaults); 
      
      
  hold on
  subplot(4,1,1);  
  plot(xtrap ,ftrap,'@-g');
  subplot(4,1,2);
  plot(xori,fori,'*-r');
  subplot(4,1,3) 
  plot(xp,yp,'o-b');
  subplot(4,1,4);
  plot(xsim,ysim,'*-y');
  hold off
  #plot(rx, frx, 'm');
      