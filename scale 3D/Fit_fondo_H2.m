function [fitresult, gof] = createFit_fondo(xx, yy, II)


%% Fit: 'untitled fit 1'.
[xData, yData, zData] = prepareSurfaceData( xx, yy, II );

% Set up fittype and options.
ft = fittype( 'poly22' );
opts = fitoptions( ft );
opts.Lower = [-Inf -Inf -Inf -Inf -Inf -Inf];
opts.Robust = 'Bisquare';
opts.Upper = [Inf Inf Inf Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );
