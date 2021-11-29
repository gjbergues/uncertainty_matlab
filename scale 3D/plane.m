pref= xlsread('M1.xlsx', 2, 'V2');
p1 = xlsread('M1.xlsx', 2, 'V2:V123'); 

X = xlsread('M1.xlsx', 2, 'C2:C123');
Y = xlsread('M1.xlsx', 2, 'B2:B123');

p1 = p1 - pref;

Xcolv = X(:); % Make X a column vector

Ycolv = Y(:); % Make Y a column vector

Zcolv = p1(:); % Make Z a column vector

Const = ones(size(Xcolv)); % Vector of ones for constant term

Coefficients = [Xcolv Ycolv Const]\Zcolv; % Find the coefficients

XCoeff = Coefficients(1); % X coefficient

YCoeff = Coefficients(2); % X coefficient

CCoeff = Coefficients(3); % constant term

% Using the above variables, z = XCoeff * x + YCoeff * y + CCoeff

L=plot3(x,y,z,'ro'); % Plot the original data points

set(L,'Markersize',2*get(L,'Markersize')) % Making the circle markers larger

set(L,'Markerfacecolor','r') % Filling in the markers

hold on

[xx, yy]=meshgrid(0:0.1:1,0:0.1:1); % Generating a regular grid for plotting

zz = XCoeff * xx + YCoeff * yy + CCoeff;

surf(xx,yy,zz) % Plotting the surface

title(sprintf('Plotting plane z=(%f)*x+(%f)*y+(%f)',XCoeff, YCoeff, CCoeff))

