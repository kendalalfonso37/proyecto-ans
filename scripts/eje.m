prompt = {"Width", "Height", "Depth"};
defaults = {"1.10", "2.20", "3.30"};
rowscols = [1,10; 2,20; 3,30];
dims = inputdlg (prompt, "Enter Box Dimensions", rowscols, defaults);

my_options = {"Metodo de trapecios", "Simpson", "Punto Medio", "Metodo Simple", "Quadratura gaussiana"};
[sel, ok] = listdlg ("ListString", my_options,
                     "SelectionMode", "Multiple");
if (ok == 1)
  disp ("You selected:");
  for i = 1:numel (sel)
    if(i==1)
    
    end
    if(i==2)
    
    end
    if(i==3)
    
    end
    if(i==4)
    
    end
    if(i==5)
    
    end
  endfor
else
  disp ("Desea cancelar?");
endif