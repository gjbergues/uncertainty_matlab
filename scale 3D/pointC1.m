clear all

%CUADRANTE 1
c1_x1 = fliplr(xlsread('cuad3D.xlsx', 1, 'C2:C11')'); %horizontal point 1 (ph1)
c1_x2 = fliplr(xlsread('cuad3D.xlsx', 1, 'B2:B11')'); %horizontal point 2 (ph2)

c1_y1 = fliplr(xlsread('cuad3D.xlsx', 1, 'G2:G11')'); %horizontal point 1 (ph1)
c1_y2 = fliplr(xlsread('cuad3D.xlsx', 1, 'F2:F11')'); %horizontal point 2 (ph2)

%Plot p1
figure;
plot(c1_x2, c1_y2,'*')
title('Shift of P1')
xlabel('horizontal point x2')
ylabel('vertical point y2')

mdl = LinearModel.fit(c1_x2, c1_y2);

%Plot p2
figure;
plot(c1_x2, c1_y1,'*')
title('shift of P2')
xlabel('horizontal point x2')
ylabel('vertical point y1')

mdl2 = LinearModel.fit(c1_x2, c1_y1);

%Plot p3
figure;
plot(c1_x1, c1_y1,'*')
title('shift of P3')
xlabel('horizontal point x1')
ylabel('vertical point y1')

mdl3 = LinearModel.fit(c1_x1, c1_y1);

%Plot p4
figure;
plot(c1_x1, c1_y2,'*')
title('shift of P4')
xlabel('horizontal point x1')
ylabel('vertical point y2')

mdl4 = LinearModel.fit(c1_x1, c1_y2);