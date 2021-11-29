clear all
%Cuadrante 4
%Horizontal position
d_h_c1_y1 = xlsread('position.xlsx', 4, 'B2:B11'); %distancia horizontal a medida que me muevo en eje y
d_h_c1_y2 = xlsread('position.xlsx', 4, 'B12:B21');
d_h_c1_y3 = xlsread('position.xlsx', 4, 'B22:B31');
d_h_c1_y4 = xlsread('position.xlsx', 4, 'B32:B41');

d_h_c1_x1 = xlsread('position.xlsx', 4, 'D2:D11'); %distancia horizontal a medida que me muevo en eje x

%Vertical position
d_h_c2_y1 = xlsread('position.xlsx', 4, 'C2:C11'); %distancia horizontal a medida que me muevo en eje y
d_h_c2_y2 = xlsread('position.xlsx', 4, 'C12:C21');
d_h_c2_y3 = xlsread('position.xlsx', 4, 'C22:C31');
d_h_c2_y4 = xlsread('position.xlsx', 4, 'C32:C41');

d_h_c2_x1 = xlsread('position.xlsx', 4, 'E2:E11'); %distancia horizontal a medida que me muevo en eje x

for i = 1:9
    v(i) = d_h_c2_x1(i+1)-d_h_c2_x1(i);    
end 

inc = mean(v);

mdl = LinearModel.fit(d_h_c2_x1, 1:10); 

%Grafico la recta
figure; plot(mdl)%10 gráfico de la recta de regresión

x=[1:10]';

[bh, bint, r, rint] = regress(d_h_c2_x1, x);
%Grafico los residuos
figure; rcoplot(r, rint)%11 gráfico de residuos