clear all
close all

NI = 5;%Número de imágenes a ser promediadas. Etiquetadas consecutivamente
sum_I = 0;
SumaTotal = 0;

%Carga de la imagenes y promedio aritmético para cada color
%---------------------------------------------------------------------------------------------------------------------------------

for j = 0:9
for i = 1:NI

    %Entrada para Windows
    f=['J:\incertidumbre\CUAD4\9-' num2str(j) '\ima' num2str(i) '.bmp'];
    
    %bmp ingresa color por canal? o mezcla colores
    rgb_img = imread(f);
    I = .2989*rgb_img(:,:,1) + .5870*rgb_img(:, :, 2) + .1140*rgb_img(:, :, 3);

    sum_I = sum_I + (double(I) + 1);

end

%Imagen promedio en I_new
I_new = sum_I / NI;
%Muestro imagen promedio
%figure; imagesc(I_new); colormap(gray)%1

%Niego imagen promedio y la muestro
%Enhance white and grey values that are in a predominant dark region. And
%put the gaussian peaks positives
%I_new_neg = imcomplement(I_new); se puede hacer de esta manera
I_new_neg = 1 - (I_new ./ 255);
%figure; imagesc(I_new_neg); colormap(gray)%2
%--------------------------------------------------------------------------------------------------------------------------------------

%Elijo un sector de imagen que encierre 8 líneas para hacer procesamiento y
%lo muestro.
%------------------------------------------------------------------------
yy = 1:40;
xx = 1:160;%distancia óptima para esta experiencia

%II = I_new_neg(570+yy, 680 + xx); %CUAD1 
%II = I_new_neg(570+yy, 680 + xx); %CUAD2
II = I_new_neg(570+yy, 675 + xx); %CUAD3 %CUAD4

%figure; imagesc(II); colormap(gray)%3
%------------------------------------------------------------------------

%Se hace un fitting de la zona preseleccionada
%--------------------------------------------------------------------------------
%fitresult entrega los coeficientes que arman la función de fiteo para el fondo.
%La función siguiente es creada mediante "cftool" la herramienta de fitting
%de matlab.

[fitresult, gof] = Fit_fondo_H2(xx, yy, II)

[xData, yData, zData] = prepareSurfaceData( xx, yy, II );
% 
% Set up fittype and options.
ft = fittype( 'poly22' );
opts = fitoptions( ft );
opts.Lower = [-Inf -Inf -Inf -Inf -Inf -Inf];
opts.Robust = 'Bisquare';
opts.Upper = [Inf Inf Inf Inf Inf Inf];
% 
% Fit model to data.
[fitresult, gof] = fit( [xData, yData], zData, ft, opts );

%Para ver superficie completa con fondo y con los picos gaussianos
%figure; surf(xx, yy, II);%4
%-------------------------------------------------------------------------------

%Obtengo el fondo y luego lo resto de la imagen completa para obtener
%la imagen sin fondo
%----------------------------------------------------------------------------------
%Con meshgrid genero una matriz con los dos vectores xx and yy.
%En promfit obtengo el fondo separado de los picos.
[t1,t2] = meshgrid(xx, yy);
promfit = fitresult(t1, t2);% Si corro fitresult en funciÃ³n de las variables independientes obtengo el fondo

%figura del fondo
%figure; surf(t1, t2, promfit);%5

%Resto el fondo y grafico la imagen final. Es necesario usar "abs" para que
%los picos no queden al revés.
J= abs(promfit - II);

%figure; imagesc(J); colormap(gray)%6
%figure; surf(t1, t2, J);%7
%---------------------------------------------------------------------------------


%Procesamiento sobre cortes de las gaussianas 3D
%----------------------------------------------------------------------------------
%Corto la gaussiana 3D para obtener una 2D
cv = squeeze(II(30,:));
cv2= squeeze(J(30,:));

%figure; plot(xx, cv, 'r', 'LineWidth', 2); hold on%8
%plot(xx, cv2, 'b', 'LineWidth', 2); hold on%8
%legend('corte imagen', 'corte imagen sin fondo')
%---------------------------------------------------------------------------------


%Fitting 2 Gaussianas 2D del corte
%------------------------------------------------------------------------------------
%Corte de 8 Gaussianas, para hacerlo se obsrva la imagen previamente

[fit2, gof2] = Fit_2gauss_H(xx, cv2);%Hice el fiteo de nuevo con cftool y cree una nueva función

%----------------------------------------------------------------------------------------------------------

%Cálculo de incertidumbres
%-----------------------------------------------------------------------------------------------------
cH= coeffvalues(fit2);%coeffvalues entrega los coeficientes de c/u de las 8 gaussianas
bH= reshape(cH, 3, 2);%acomodamos la matriz de coeficientes para que queden agrupados por columnas
b_fH= sort( bH(2, :));%me interesan los valores "b" de cada gaussiana
% 
X=[ones(1,2)' (1:2)'];

%Columna de valores centrales de gaussianas
BH= b_fH';


%Presento valores en terminal
bh = BH(2)-BH(1);
incertezaH = ((cH(3) +cH(6))*0.05)/2;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Región VERTICAL de la RETÍCULA 

%Elijo un sector de imagen para hacer proceso y la muestro
%------------------------------------------------------------------------
yy2= 1:160;
xx2= 1:40;

%III= I_new_neg(510+yy2, 750+xx2);%CUAD1
%III= I_new_neg(500+yy2, 750+xx2); %CUAD2
III= I_new_neg(500+yy2, 750+xx2); %CUAD3 CUAD4

%figure; imagesc(III); colormap(gray)%14 gráfico de las 8 líneas verticales cortadas

%Fución del fondo.
[fitresult2, gof2] = Fit_fondo_V(xx2, yy2, III);

%Para ver superficie completa con fondo y con los picos gaussianos
%figure; surf(xx2, yy2, III);%15

%Función del fondo
[t_1, t_2]= meshgrid(xx2, yy2);
promfit2= fitresult2(t_1, t_2);
%figure; surf(t_1,t_2, promfit2);%16 figura del fondo fitiado.

%Resto el fondo
J2= abs(promfit2 - III);
%figure; imagesc(J2); colormap(gray)%17 líneas sin fondo (similar a 14)

%Figura en 3D sin fondo
%figure; surf(t_1, t_2, J2);% 18 picos en 3D sin el fondo


%Tomamos una sección de la 3D
cv_1=squeeze(III(:,20));
cv_2= squeeze( J2(:, 20));

%figure; plot(yy2, cv_1, 'r', 'LineWidth', 2); hold on%19
%plot(yy2, cv_2, 'b', 'LineWidth', 2); hold on%19
%legend('cv_2')

%Se busca un fiteo en la zona
%--------------------------------------------------------------------------------
%fitresult entrega los coeficientes que arman la función de fiteo para el fondo.
%La función siguiente es creada mediante "cftool" la herramienta de fitting
%de matlab.
%Fitting del corte
[fitv, gofv] = Fit_2gauss_V(yy2', cv_2);%Nuevo



%Cálculo de incertidumbres
%-------------------------------------------------------------------------------------
cV= coeffvalues(fitv);
bV= reshape( cV, 3, 2);
b_fV= sort( bV(2, :));
% 
X= [ones(1,2)' (1:2)'];
% 
% %Columna de valores centrales de gaussianas
BV= b_fV';


% %Presento valores
bv = BV(2)-BV(1);
incertezaV = ((cV(3) +cV(6))*0.05)/2;

exce(1)= BH(2);
exce(2)= BH(1);
exce(3)= bh;
exce(4)= incertezaH;
exce(5)= BV(2);
exce(6)= BV(1);
exce(7)= bv;
exce(8)= incertezaV;

for k= 1:8
    matrix(j+1,k) = exce(k);
end
% s1=num2str(j+2)
% str = ['B' s1 ':' 'I' s1];

end
xlswrite('cuad3D.xlsx',matrix,4,'B92:I101');%escribo en tabla
