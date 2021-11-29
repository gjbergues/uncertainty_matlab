%CUADRANTE 1
c1 = xlsread('cuad3D.xlsx', 1, 'D2:D101'); %distancia horizontal a medida que me muevo en eje y
c2 = xlsread('cuad3D.xlsx', 2, 'D2:D101'); %distancia horizontal a medida que me muevo en eje y
c3 = xlsread('cuad3D.xlsx', 3, 'D2:D101'); %distancia horizontal a medida que me muevo en eje y
c4 = xlsread('cuad3D.xlsx', 4, 'D2:D101'); %distancia horizontal a medida que me muevo en eje y

x1 = [0 10 20 30 40 50 60 70 80 90];
y1 = [0 10 20 30 40 50 60 70 80 90];

x2 = [0 -10 -20 -30 -40 -50 -60 -70 -80 -90];
y2 = [0 10 20 30 40 50 60 70 80 90];

x3 = [0 -10 -20 -30 -40 -50 -60 -70 -80 -90];
y3 = [0 -10 -20 -30 -40 -50 -60 -70 -80 -90];

x4 = [0 10 20 30 40 50 60 70 80 90];
y4 = [0 -10 -20 -30 -40 -50 -60 -70 -80 -90];



mt=zeros(20);

k=100;
for i = 1:10 
    for j = 1:10
    mt(j,i)=c2(k);
    mt(j,21-i)=c1(k);
    mt(21-j,i)=c3(k);
    mt(21-j,21-i)=c4(k);
    k=k-1;
    end
end


 
 figure; surf(mt)
 figure; plot(1:20, 1:20, mt)
 xlswrite('cuad3D.xlsx',mt,5,'A1:T20');%escribo en tabla