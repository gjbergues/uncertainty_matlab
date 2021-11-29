%CUADRANTE 2
%r1 = xlsread('cuad3D.xlsx', 5, 'A9:T9'); %distancia horizontal a medida que me muevo en eje y
r1 = xlsread('cuad3D.xlsx', 5, 'b1:b20');

for i = 1:19
    v(i) = r1(i+1)-r1(i);    
end 

inc = mean(v)

mdl = LinearModel.fit(1:20,r1 ); 

%Grafico la recta
figure; plot(mdl)%10 gráfico de la recta de regresión
