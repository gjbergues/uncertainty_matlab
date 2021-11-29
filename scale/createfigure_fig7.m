function createfigure_fig7(X1, Y1)
%CREATEFIGURE(X1,Y1)
%  X1:  vector of x data
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 23-Feb-2013 19:45:23

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'Position',[0.13 0.5675 0.775 0.3575]);
%% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[1 5]);
box(axes1,'on');
hold(axes1,'all');

% Create plot
plot1 = plot(X1,Y1,'Parent',axes1,'Marker','*','LineStyle','none',...
    'DisplayName','b_x');

% Get xdata from plot
xdata1 = get(plot1, 'xdata');
% Get ydata from plot
ydata1 = get(plot1, 'ydata');
% Make sure data are column vectors
xdata1 = xdata1(:);
ydata1 = ydata1(:);

% Remove NaN values and warn
nanMask1 = isnan(xdata1(:)) | isnan(ydata1(:));
if any(nanMask1)
    warning('GenerateMFile:IgnoringNaNs', ...
        'Data points with NaN coordinates will be ignored.');
    xdata1(nanMask1) = [];
    ydata1(nanMask1) = [];
end

% Find x values for plotting the fit based on xlim
axesLimits1 = xlim(axes1);
xplot1 = linspace(axesLimits1(1), axesLimits1(2));

% Prepare for plotting residuals
set(axes1,'position',[0.1300    0.5811    0.7750    0.3439]);
residAxes1 = axes('position', [0.1300    0.1100    0.7750    0.3439], ...
    'parent', gcf);
savedResids1 = zeros(length(xdata1), 1);
% Sort residuals
[sortedXdata1, xInd1] = sort(xdata1);


fitResults1 = polyfit(xdata1, ydata1, 1);
% Evaluate polynomial
yplot1 = polyval(fitResults1, xplot1);

% Calculate and save residuals - evaluate using original xdata
Yfit1 = polyval(fitResults1, xdata1);
resid1 = ydata1 - Yfit1(:);
savedResids1(:,1) = resid1(xInd1);
% Plot the fit
fitLine1 = plot(xplot1,yplot1,'DisplayName','ajuste lineal','Parent',axes1,...
    'Tag','linear',...
    'Color',[1 0 0]);

% Set new line in proper position
setLineOrder(axes1, fitLine1, plot1);

% Plot residuals in a bar plot
residPlot1 = bar(residAxes1, sortedXdata1, savedResids1);
% Set colors to match fit lines
set(residPlot1(1), 'facecolor', [1 0 0],'edgecolor', [1 0 0]);
% Set residual plot axis title
set(get(residAxes1, 'title'),'string','residuos');

% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.634523809523806 0.615079365079366 0.248214285714286 0.114285714285714]);

%-------------------------------------------------------------------------%
function setLineOrder(axesh1, newLine1, associatedLine1)
%SETLINEORDER(AXESH1,NEWLINE1,ASSOCIATEDLINE1)
%  Set line order
%  AXESH1:  axes
%  NEWLINE1:  new line
%  ASSOCIATEDLINE1:  associated line

% Get the axes children
hChildren = get(axesh1,'Children');
% Remove the new line
hChildren(hChildren==newLine1) = [];
% Get the index to the associatedLine
lineIndex = find(hChildren==associatedLine1);
% Reorder lines so the new line appears with associated data
hNewChildren = [hChildren(1:lineIndex-1);newLine1;hChildren(lineIndex:end)];
% Set the children:
set(axesh1,'Children',hNewChildren);

