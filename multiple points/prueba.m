

NI = 100;%Número de imágenes a ser promediadas. Etiquetadas consecutivamente
sum_I = 0;
SumaTotal = 0;

%Carga de la imagenes y promedio aritmético para cada color
%---------------------------------------------------------------------------------------------------------------------------------
%for i = 1:NI

    %Entrada para Windows
    %f=['I:\datos_paper_pattern\Exp 2\ret\ima' num2str(i) '.bmp'];
   
    %bmp ingresa color por canal? o mezcla colores
    rgb_img = ima10;
    I = .2989*rgb_img(:,:,1) + .5870*rgb_img(:, :, 2) + .1140*rgb_img(:, :, 3);

    sum_I = sum_I + (double(I) + 1);

%end

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


[Isf]=centercruz_function_p(I_new_neg);
figure; imagesc(Isf); colormap(gray)


%Center definition
%X position
s=sum(Isf);
s(1)=0;
s(1624)=0;
[m,xp]=max(s);

%Y position
s2=sum(Isf,2);
s2(1)=0;
s2(1234)=0;
[m2,yp]=max(s2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% HORIZONTAL ANALISYS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%primeras 8 gaussianas horizontales
cv= squeeze(Isf(yp-50,(xp - 730):(xp + 50)));
x=(xp-730):(xp+50);
[fit, gof] = Fit_8gauss_H_v2(x, cv);

cH= coeffvalues(fit);%coeffvalues entrega los coeficientes de c/u de las 8 gaussianas
bH= reshape(cH, 3, 8);%acomodamos la matriz de coeficientes para que queden agrupados por columnas
b_fH= sort( bH(2, :));

%segundas 8 gaussianas horizontales
cv2= squeeze(Isf(yp-50,(xp-50):(xp+730)));
x2= (xp-50):(xp+730);
[fit2, gof2] = Fit_8gauss_H_v3(x2, cv2);

cH2= coeffvalues(fit2);%coeffvalues entrega los coeficientes de c/u de las 8 gaussianas
bH2= reshape(cH2, 3, 8);%acomodamos la matriz de coeficientes para que queden agrupados por columnas
b_fH2= sort( bH2(2, :));

%vector de posiciones horizontales
BH = 1:15;
BH(1:8) = b_fH(1:8); 
BH(9:15) = b_fH2(2:8);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% VERTICAL ANALISYS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%primeras 8 gausianas verticales
ch = squeeze(Isf((yp-610):(yp + 136),(xp-50)));
y = (yp-610):(yp + 136);
[fit3, gof3] = Fit_8gauss_V_v2(y, ch);

cH3= coeffvalues(fit3);%coeffvalues entrega los coeficientes de c/u de las 8 gaussianas
bH3= reshape(cH3, 3, 8);%acomodamos la matriz de coeficientes para que queden agrupados por columnas
b_fH3= sort( bH3(2, :));

%segundas 8 gaussianas verticales
ch2 = squeeze(Isf((yp-250):(yp+526),(xp-50)));
y2 = (yp-250):(yp+526);
[fit4, gof4] = Fit_8gauss_V_v3(y2, ch2);

cH4= coeffvalues(fit4);%coeffvalues entrega los coeficientes de c/u de las 8 gaussianas
bH4= reshape(cH4, 3, 8);%acomodamos la matriz de coeficientes para que queden agrupados por columnas
b_fH4= sort( bH4(2, :));

%vector de posiciones horizontales
BV = 1:12;
BV(1:8) = b_fH3(1:8); 
BV(9:12) = b_fH4(5:8);




