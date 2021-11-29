function [fitresult, gof] = createFit_un_paso_Gauss(xx, cv2)
%CREATEFIT1(XX,CV2)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : xx
%      Y Output: cv2
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 28-Mar-2013 15:02:46


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( xx, cv2 );

% Set up fittype and options.
ft = fittype( 'a1*exp(-((x-b1)/c1)^2)+ a2*exp(-((x-(b2+b1))/c1)^2) + a3*exp(-((x-(b1+2*b2))/c1)^2) + a4*exp(-((x- (b1+3*b2))/c1)^2)+a5*exp(-((x- (b1+4*b2))/c1)^2)+a6*exp(-((x- (b1+5*b2))/c1)^2)+a7*exp(-((x- (b1+6*b2))/c1)^2)+a8*exp(-((x- (b1+7*b2))/c1)^2)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf -Inf];
opts.StartPoint =[ 0.2 0.2 0.2 0.2 0.2 0.2 0.2 0.2 70 95 3 ];
opts.Upper = [Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );


