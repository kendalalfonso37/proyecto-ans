
#h=0.0001;a=0; b=pi/4;x = a: h : b;n = length(x);
#fx= e.^(3*x).*sin(2*x);ddx=  e.^(3*x).*(5.*sin(2*x)+12.*cos(2*x));
gx = inputdlg('Digite la funcion: ', "Integracion por Metodo del Trapecio");
fx = inline(gx{1,1});
dgx = inputdlg('Digite la derivada de x: ', "");
ddx = inline(dgx{1,1});
a = inputdlg('Digite el valor inferior del intervalo: ', "");
aa = str2num(a{1,1});
b = inputdlg('Digite el valor superior del intervalo: ', "");
bb = str2num(b{1,1});
h = inputdlg('Digite el valor h : ', "");
hh = str2num(h{1,1});
#fprintf('_________________________________________________________________________________\n', fx); 

x = aa: hh : bb;
n = length(x);

  
t1=tic;
acumulador=0; i=1;
    while i<n+1
      if(i!=1 && i!=n)
        acumulador = acumulador + 2*fx(i);
      else
        acumulador = acumulador + fx(i);
      end
      if(i==n)
      acumulador = acumulador *hh/2; %% VALOR APROXIMADO
      
      
      end
      i++;
    endwhile
 
  #tf = t1;
  #p1= plot(x,fx ,'r');
 
  
  %CALCULO DE LA COTA DEL ERROR VALOR MAXIMO DE F''X
  i=1; derivada=[];
  while i<n+1
    derivada= [derivada ddx(i)]; % valores fx''
    i++;
  endwhile
  i=1; mayor=0;%%Buscando el valor mayor del fx
  while i<n+1
    if(i==1)
      mayor=derivada(i);
    else
      if(mayor<abs(derivada(i)))
        mayor=derivada(i);
      end
    end
  i++;
  endwhile
  tf = toc(t1);
  cota=((bb-aa)^3/12)*mayor;
  %COTA DEL ERROR PARA ESTE METODO:
  fprintf('Tiempo transcurrido: %d \n',toc(t1));
  fprintf('\nValor aproximado: %d \n', acumulador); 
  
  fprintf('Cota del error: %2.4f \n', cota);
  #fprintf('_________________________________________________________________________________\n', fx); 