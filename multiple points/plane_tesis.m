clear all

pref= xlsread('M1.xlsx', 2, 'E2');
p1 = xlsread('M1.xlsx', 2, 'E2:E123'); 



X = xlsread('M1.xlsx', 2, 'C2:C123');

Y = xlsread('M1.xlsx', 2, 'B2:B123');


p1 = p1 - pref;



[xData, yData, zData] = prepareSurfaceData( X, Y, p1 );

% Set up fittype and options.
ft = fittype( 'poly11' );
opts = fitoptions( ft );
opts.Lower = [-Inf -Inf -Inf];
opts.Upper = [Inf Inf Inf];

% Fit model to data.
[fitresult, gof, out] = fit( [xData, yData], zData, ft, opts );

res=out.residuals;
xlswrite('M1.xlsx', res, 30, 'F2:F123');

ce=coeffvalues(fitresult);


% Plot fit with data.
figure % create new figure
%figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, [xData, yData], zData ); 
% Label axes
title('Fitted plane')
xlabel( 'X' );
ylabel( 'Y' );
zlabel( 'pixels' );
grid on
view( -69.5, 36 );


