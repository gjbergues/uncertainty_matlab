clear all

pref= xlsread('M1.xlsx', 2, 'AE2');
p1 = xlsread('M1.xlsx', 2, 'AE2:AE123'); 
xlswrite('M1.xlsx', p1, 30, 'D2:D123');


X = xlsread('M1.xlsx', 2, 'C2:C123');
xlswrite('M1.xlsx', X, 30, 'B2:B123');
Y = xlsread('M1.xlsx', 2, 'B2:B123');
xlswrite('M1.xlsx', Y, 30, 'C2:C123');

p1 = p1 - pref;
xlswrite('M1.xlsx', p1, 30, 'E2:E123');


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
xlswrite('M1.xlsx', ce, 30, 'G2:I2');
xlswrite('M1.xlsx', ce, 3, 'B28:D28');

% Plot fit with data.
figure % create new figure
subplot(1,2,1) % first subplot
%figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, [xData, yData], zData ); 
% Label axes
title('Fitted plane')
xlabel( 'X' );
ylabel( 'Y' );
zlabel( 'pixels' );
grid on
view( -69.5, 36 );

% Plot residuals.
subplot(1,2,2) % first subplot
h = plot( fitresult, [xData, yData], zData, 'Style', 'Residual' );
% Label axes
title('Residuals')
xlabel( 'X' );
ylabel( 'Y' );
zlabel( 'residuals' );
grid on
view( -69.5, 36 );
