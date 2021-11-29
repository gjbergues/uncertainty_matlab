function [fitresult, gof] = createFit(y, ch)
%CREATEFIT(Y,CH)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : y
%      Y Output: ch
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 16-Feb-2015 12:26:39


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( y, ch );

% Set up fittype and options.
ft = fittype( 'gauss8' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0 -Inf -Inf 0];
opts.StartPoint = [0.00314042419963312 754 11.3459063429303 0.00288968699152059 364 6.78584617460494 0.00281422497507 657 10.5505693742343 0.00247466171557953 266 8.96350705799493 0.00246198933248909 559 10.1266551980702 0.00244115807203571 462 9.52740804906871 0.00202485322505486 169 12.6214113726969 0.00173350352077384 72 19.6293475889161];
opts.Upper = [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% % Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'ch vs. y', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel( 'y' );
% ylabel( 'ch' );
% grid on


