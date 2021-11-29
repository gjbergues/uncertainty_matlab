clear all

%FUNCTION FOR "X1"

X1= xlsread('cuad3D.xlsx', 1, 'C2');
c1 = xlsread('cuad3D.xlsx', 1, 'C2:C101'); 
c2 = xlsread('cuad3D.xlsx', 2, 'C2:C101'); 
c3 = xlsread('cuad3D.xlsx', 3, 'C2:C101'); 
c4 = xlsread('cuad3D.xlsx', 4, 'C2:C101'); 

X= xlsread('cuad3D.xlsx', 5, 'B21:T21');
Y= xlsread('cuad3D.xlsx', 5, 'A2:A20');

mt=zeros(19);

k=100;
for i = 1:9 
    for j = 1:10
    mt(j,i)=c2(k) - X1; 
    k=k-1;
    end
end

k=100;
for i = 1:9 
    for j = 1:10
    mt(j,20-i)=c1(k) - X1; 
    k=k-1;
    end
end
k=100;
for i = 1:9 
    for j = 1:9
    mt(20-j,i)=c3(k) - X1;   
     k=k-1;
    end
end
k=100;
for i = 1:10 
    for j = 1:9
    mt(20-j,20-i)=c4(k) - X1;   
    k=k-1;
    end
end
    
    
 
 figure; surf(mt)
 %figure; plot(X, Y', mt)
 %xlswrite('cuad3D.xlsx',mt,5,'B2:T20');%escribo en tabla
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 %FUNCTION FOR "X2"

X2= xlsread('cuad3D.xlsx', 1, 'B2');
c1_X2 = xlsread('cuad3D.xlsx', 1, 'B2:B101'); 
c2_X2 = xlsread('cuad3D.xlsx', 2, 'B2:B101'); 
c3_X2 = xlsread('cuad3D.xlsx', 3, 'B2:B101'); 
c4_X2 = xlsread('cuad3D.xlsx', 4, 'B2:B101'); 

X_X2= xlsread('cuad3D.xlsx', 5, 'B21:T21');
Y_X2= xlsread('cuad3D.xlsx', 5, 'A2:A20');

mt_X2=zeros(19);

k=100;
for i = 1:9 
    for j = 1:10
    mt_X2(j,i)=c2_X2(k) - X2; 
    k=k-1;
    end
end

k=100;
for i = 1:9 
    for j = 1:10
    mt_X2(j,20-i)=c1_X2(k) - X2; 
    k=k-1;
    end
end
k=100;
for i = 1:9 
    for j = 1:9
    mt_X2(20-j,i)=c3_X2(k) - X2;   
     k=k-1;
    end
end
k=100;
for i = 1:10 
    for j = 1:9
    mt_X2(20-j,20-i)=c4_X2(k) - X2;   
    k=k-1;
    end
end
    
  
 figure; surf(mt_X2)
 %figure; plot(X_X2, Y_X2', mt_X2)
 xlswrite('cuad3D.xlsx',mt_X2,6,'B2:T20');%escribo en tabla
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %FUNCTION FOR "Y1"

Y1= xlsread('cuad3D.xlsx', 1, 'G2');
c1_Y1 = xlsread('cuad3D.xlsx', 1, 'G2:G101'); 
c2_Y1 = xlsread('cuad3D.xlsx', 2, 'G2:G101'); 
c3_Y1 = xlsread('cuad3D.xlsx', 3, 'G2:G101'); 
c4_Y1 = xlsread('cuad3D.xlsx', 4, 'G2:G101'); 

X_Y1= xlsread('cuad3D.xlsx', 5, 'B21:T21');
Y_Y1= xlsread('cuad3D.xlsx', 5, 'A2:A20');

mt_Y1=zeros(19);

k=100;
for i = 1:9 
    for j = 1:10
    mt_Y1(j,i)=c2_Y1(k) - Y1; 
    k=k-1;
    end
end

k=100;
for i = 1:9 
    for j = 1:10
    mt_Y1(j,20-i)=c1_Y1(k) - Y1; 
    k=k-1;
    end
end
k=100;
for i = 1:9 
    for j = 1:9
    mt_Y1(20-j,i)=c3_Y1(k) - Y1;   
     k=k-1;
    end
end
k=100;
for i = 1:10 
    for j = 1:9
    mt_Y1(20-j,20-i)=c4_Y1(k) - Y1;   
    k=k-1;
    end
end
    
     
 figure; surf(mt_Y1)
 %figure; plot(X_Y1, Y_Y1', mt_Y1)
 xlswrite('cuad3D.xlsx',mt_Y1,7,'B2:T20');%escribo en tabla
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 %FUNCTION FOR "Y2"

Y2= xlsread('cuad3D.xlsx', 1, 'F2');
c1_Y2 = xlsread('cuad3D.xlsx', 1, 'F2:F101'); 
c2_Y2 = xlsread('cuad3D.xlsx', 2, 'F2:F101'); 
c3_Y2 = xlsread('cuad3D.xlsx', 3, 'F2:F101'); 
c4_Y2 = xlsread('cuad3D.xlsx', 4, 'F2:F101'); 

X_Y2= xlsread('cuad3D.xlsx', 5, 'B21:T21');
Y_Y2= xlsread('cuad3D.xlsx', 5, 'A2:A20');

mt_Y2=zeros(19);

k=100;
for i = 1:9 
    for j = 1:10
    mt_Y2(j,i)=c2_Y2(k) - Y2; 
    k=k-1;
    end
end

k=100;
for i = 1:9 
    for j = 1:10
    mt_Y2(j,20-i)=c1_Y2(k) - Y2; 
    k=k-1;
    end
end
k=100;
for i = 1:9 
    for j = 1:9
    mt_Y2(20-j,i)=c3_Y2(k) - Y2;   
     k=k-1;
    end
end
k=100;
for i = 1:10 
    for j = 1:9
    mt_Y2(20-j,20-i)=c4_Y2(k) - Y2;   
    k=k-1;
    end
end
    
figure; surf(mt_Y2)
 %figure; plot(X_Y2, Y_Y2', mt_Y2)
 xlswrite('cuad3D.xlsx',mt_Y2,8,'B2:T20');%escribo en tabla
 