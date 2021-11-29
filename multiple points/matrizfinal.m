clear all

% %FUNCTION FOR "X1"
% 
% pref= xlsread('M1.xlsx', 2, 'E2');
% p1 = xlsread('M1.xlsx', 2, 'E2:E123'); 
% 
% X = xlsread('M1.xlsx', 2, 'C2:C123');
% Y = xlsread('M1.xlsx', 2, 'B2:B123');
% 
% p1 = p1 - pref;
% 
% plot3(X',Y', p1, '*')

    
%FUNCTION FOR "X2"

% pref= xlsread('M1.xlsx', 2, 'F2');
% p1 = xlsread('M1.xlsx', 2, 'F2:F123'); 
% 
% X = xlsread('M1.xlsx', 2, 'C2:C123');
% Y = xlsread('M1.xlsx', 2, 'B2:B123');
% 
% p1 = p1 - pref;
% 
% plot3(X',Y', p1, '*') 

%FUNCTION FOR "X3"
% 
% pref= xlsread('M1.xlsx', 2, 'G2');
% p1 = xlsread('M1.xlsx', 2, 'G2:G123'); 
% 
% X = xlsread('M1.xlsx', 2, 'C2:C123');
% Y = xlsread('M1.xlsx', 2, 'B2:B123');
% 
% p1 = p1 - pref;
% 
% plot3(X',Y', p1, '*') 


%FUNCTION FOR "X4"
% 
% pref= xlsread('M1.xlsx', 2, 'H2');
% p1 = xlsread('M1.xlsx', 2, 'H2:H123'); 
% 
% X = xlsread('M1.xlsx', 2, 'C2:C123');
% Y = xlsread('M1.xlsx', 2, 'B2:B123');
% 
% p1 = p1 - pref;
% 
% plot3(X',Y', p1, '*')

%FUNCTION FOR "X5"
% 
% pref= xlsread('M1.xlsx', 2, 'I2');
% p1 = xlsread('M1.xlsx', 2, 'I2:I123'); 
% 
% X = xlsread('M1.xlsx', 2, 'C2:C123');
% Y = xlsread('M1.xlsx', 2, 'B2:B123');
% 
% p1 = p1 - pref;
% 
% plot3(X',Y', p1, '*')

%FUNCTION FOR "X6"
% 
% pref= xlsread('M1.xlsx', 2, 'J2');
% p1 = xlsread('M1.xlsx', 2, 'J2:J123'); 
% 
% X = xlsread('M1.xlsx', 2, 'C2:C123');
% Y = xlsread('M1.xlsx', 2, 'B2:B123');
% 
% p1 = p1 - pref;
% 
% plot3(X',Y', p1, '*')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%FUNCTION FOR "Y1"

% pref= xlsread('M1.xlsx', 2, 'T2');
% p1 = xlsread('M1.xlsx', 2, 'T2:T123'); 
% 
% X = xlsread('M1.xlsx', 2, 'C2:C123');
% Y = xlsread('M1.xlsx', 2, 'B2:B123');
% 
% p1 = p1 - pref;
% 
% plot3(X',Y', p1, '*')

%FUNCTION FOR "Y2"

% pref= xlsread('M1.xlsx', 2, 'U2');
% p1 = xlsread('M1.xlsx', 2, 'U2:U123'); 
% 
% X = xlsread('M1.xlsx', 2, 'C2:C123');
% Y = xlsread('M1.xlsx', 2, 'B2:B123');
% 
% p1 = p1 - pref;
% 
% plot3(X',Y', p1, '*')


%FUNCTION FOR "Y3"

pref= xlsread('M1.xlsx', 2, 'V2');
p1 = xlsread('M1.xlsx', 2, 'V2:V123'); 

X = xlsread('M1.xlsx', 2, 'C2:C123');
Y = xlsread('M1.xlsx', 2, 'B2:B123');

p1 = p1 - pref;

plot3(X',Y', p1, '*')
xlabel('X')
ylabel('Y')
zlabel('Pixels')





