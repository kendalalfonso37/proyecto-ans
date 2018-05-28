clear all
clc
disp('=======================')
disp('    Simpson Compuesta  ')
disp('==========================')
format long
pkg load symbolic
syms x
disp('ingrese la funcion como cadena de caracteres');
f=input(' f(x): ');
g=inline(f);
a=input('ingrese el limite inferior: ');
b=input('ingrese el limite superior: ');
n=input('ingrese la mitad de intervalos: ')
h=(b-a)/(2*n);
%calculando la integral 
tic;
s1=0;
s2=0;
for j=1:2:n-1
    s1=s1+g(2*j);
end
for k=1:2:n
    s2=s2+g(2*k-1);
end
t1 = toc;
disp('El Valor de la integral apriximada es :');

I=(h/3)*( g(a) +2*s1+4*s2+g(b) )
printf('tiempo de ejecucion del programa: %f Segundos\n', t1);

