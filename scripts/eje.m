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


btn = questdlg ("Close Octave?", "Some fancy title", "Yes", "No", "No");
if (strcmp (btn, "Yes"))
  exit ();
endif

msgbox ("Some message for the user.");
msgbox ("Some message\nwith two lines.");
msgbox ({"Some message", "with two lines."});
msgbox ("Some message for the user.", "Fancy caption");

% A message dialog box with error icon
msgbox ("Some message for the user.", "Fancy caption", "error");


## create an empty dialog window titled "Dialog Example"
h = dialog ("name", "Dialog Example");

## create a button (default style)
b = uicontrol (h, "string", "OK",
                  "position", [10 10 150 40],
                  "callback", "delete (gcf)");

## wait for dialog to resume or close
uiwait (h);
