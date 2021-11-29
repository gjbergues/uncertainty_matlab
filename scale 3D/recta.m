%CUADRANTE 1
d_h_c1_y1 = xlsread('cuad.xlsx', 1, 'B2:B11'); %distancia horizontal a medida que me muevo en eje y
d_h_c1_y2 = xlsread('cuad.xlsx', 1, 'B12:B21');
d_h_c1_y3 = xlsread('cuad.xlsx', 1, 'B22:B31');
d_h_c1_y4 = xlsread('cuad.xlsx', 1, 'B32:B41');

d_h_c1_x1 = xlsread('cuad.xlsx', 1, 'L2:L11'); %distancia horizontal a medida que me muevo en eje x

%CUADRANTE 2
d_h_c2_y1 = xlsread('cuad.xlsx', 2, 'B2:B11'); %distancia horizontal a medida que me muevo en eje y
d_h_c2_y2 = xlsread('cuad.xlsx', 2, 'B12:B21');
d_h_c2_y3 = xlsread('cuad.xlsx', 2, 'B22:B31');
d_h_c2_y4 = xlsread('cuad.xlsx', 2, 'B32:B41');

d_h_c2_x1 = xlsread('cuad.xlsx', 2, 'L2:L11'); %distancia horizontal a medida que me muevo en eje x

%CUADRANTE 3
d_h_c3_y1 = xlsread('cuad.xlsx', 3, 'B2:B11'); %distancia horizontal a medida que me muevo en eje y
d_h_c3_y2 = xlsread('cuad.xlsx', 3, 'B12:B21');
d_h_c3_y3 = xlsread('cuad.xlsx', 3, 'B22:B31');
d_h_c3_y4 = xlsread('cuad.xlsx', 3, 'B32:B41');

d_h_c3_x1 = xlsread('cuad.xlsx', 3, 'L2:L11'); %distancia horizontal a medida que me muevo en eje x

%CUADRANTE 4
d_h_c4_y1 = xlsread('cuad.xlsx', 4, 'B2:B11'); %distancia horizontal a medida que me muevo en eje y
d_h_c4_y2 = xlsread('cuad.xlsx', 4, 'B12:B21');
d_h_c4_y3 = xlsread('cuad.xlsx', 4, 'B22:B31');
d_h_c4_y4 = xlsread('cuad.xlsx', 4, 'B32:B41');

d_h_c4_x1 = xlsread('cuad.xlsx', 4, 'L2:L11'); %distancia horizontal a medida que me muevo en eje x

for i = 1:9
    v(i) = d_h_c4_x1(i+1)-d_h_c4_x1(i);    
end 

inc = mean(v)

mdl = LinearModel.fit(d_h_c4_x1, 1:10); 

%Grafico la recta
figure; plot(mdl)%10 gráfico de la recta de regresión
