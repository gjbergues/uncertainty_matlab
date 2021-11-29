%PUNTOS X

b_x = xlsread('M1.xlsx', 3, 'c2:c16'); 
c_x = xlsread('M1.xlsx', 3, 'd2:d16'); 
nx=1:15;

figure; plot(nx, b_x,'-*')
xlabel( 'n^\circ de linea (X)' );
ylabel( 'b_i' );

figure; plot(nx, c_x,'-*')
xlabel( 'n^\circ de linea (X)' );
ylabel( 'c_i' );

%PUNTOS y

b_y = xlsread('M1.xlsx', 3, 'c17:c28'); 
c_y = xlsread('M1.xlsx', 3, 'd17:d28'); 
b_y= b_y * -1;

ny= 1:12;


figure; plot(ny, b_y,'-*')
xlabel( 'n^\circ de linea (Y)' );
ylabel( 'b_i' );

figure; plot(ny, c_y,'-*')
xlabel( 'n^\circ de linea (Y)' );
ylabel( 'c_i' );