%_________________PANTALLA DE INICIO PARA LA APLICACIÓN_________________________________
rowscols = [1,10; 1,10; 1,10; 1,30; 1,30 ; 1,30 ];
hh=0.01;aa=0;bb=3;f='x.^3';dd= '6.*x', n=100;
prompt = {"h", "a", "b", "fx", "ddx","n"};
defaults = {hh, aa, bb, f, dd, n};


dims = inputdlg (prompt, "Enter Box Dimensions",rowscols, defaults);
  
%__________________________________________________________________________________________

%EXTRAYENDO LOS DATOS DE LA INTERFAZ
      a =aa
      h =hh
      b =bb
      x=a:h:b;
      fx=inline(f)
      ddx=inline(dd)
      F=f
      DD=dd
%________________________________________________________________________

  [F,DD,cota,acumulador,tiempo]=reglaTrapecio(x,fx,ddx,F,DD,a,b,h)
      rowscols = [1,20; 1,20; 1,10; 1,10; 1,10 ];
      prompt = {"fx", "ddx","Cota de error", "Valor aproximado", "Tiempo"};
      defaults = {F, DD, cota,acumulador,tiempo};
      dims = inputdlg (prompt, "Enter Box Dimensions",rowscols, defaults);
      
      
      
      
  [F,cota,acumulador,tiempo,x,rx,fx,frx]=puntomedio(x,fx,F,a,b,n)
      rowscols = [1,20; 1,20; 1,10; 1,10];
      prompt = {"fx","Cota de error", "Valor aproximado", "Tiempo"};
      defaults = {F, cota,acumulador,tiempo};
      dims = inputdlg (prompt, "Enter Box Dimensions",rowscols, defaults);
    
  hold on   
  plot(x,fx,'r');
  plot(rx, frx, 'm');