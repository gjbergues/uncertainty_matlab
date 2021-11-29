function  [point]=centercruz_function(I)

    NI = 20;%Numero de imagenes a ser 	promediadas.Etiquetadas consecutivamente
	sum_I = 0;
	SumaTotal = 0;
 
	

    
    wx = 203;
    wy = 617;
	y = 1:wy;
	x = 1:wx;
    Isf=zeros(1234,1624);
    
    k=1;
    for i = 0:1
        ymin= i*617+1;
        for j=0:7
            k=k+1;
            xmin= j*203+1;
            Ic = imcrop(I,[xmin ymin 202 616]);%[xmin ymin width height]%
        
        
            [fitresult, gof] = Fit_fondo_H(x, y, Ic);
            %figure; surf(x, y, I);
            [t1,t2] = meshgrid(x,y);
            promfit = fitresult( t1, t2);
            %figure; surf(t1, t2, promfit);
        
            J = abs(promfit-Ic);
            Isf((1+i*617):(617*(i+1)),(1+j*203):(203*(j+1)))=J;
            %figure; imagesc(J); colormap(gray)
            %figure; surf(x, y, J);
        end
        xmin = 0;
    end
    
%figure; imagesc(Isf); colormap(gray)


    
%Center definition
%X position
s=sum(Isf);
s(1)=0;
s(1624)=0;
[m,xp]=max(s);

if(xp > 910)
xp=902;
end

%Y position
s2=sum(Isf,2);
s2(1)=0;
s2(1234)=0;
[m2,yp]=max(s2);


if(yp > 570)
yp=556;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% HORIZONTAL ANALISYS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%primeras 8 gaussianas horizontales
cv= squeeze(Isf(yp-50,(xp - 830):(xp - 50)));
x=(xp-830):(xp-50);
[fit, gof] = Fit_8gauss_H_v2(x, cv);

cH= coeffvalues(fit);%coeffvalues entrega los coeficientes de c/u de las 8 gaussianas
bH= reshape(cH, 3, 8);%acomodamos la matriz de coeficientes para que queden agrupados por columnas
b_fH= sort( bH(2, :));

%segundas 8 gaussianas horizontales
cv2= squeeze(Isf(yp-50,(xp-150):(xp+630)));
x2= (xp-150):(xp+630);
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
ch = squeeze(Isf((yp-510):(yp + 236),(xp-50)));
y = (yp-510):(yp + 236);
[fit3, gof3] = Fit_8gauss_V_v2(y, ch);

cH3= coeffvalues(fit3);%coeffvalues entrega los coeficientes de c/u de las 8 gaussianas
bH3= reshape(cH3, 3, 8);%acomodamos la matriz de coeficientes para que queden agrupados por columnas
b_fH3= sort( bH3(2, :));

%segundas 8 gaussianas verticales
ch2 = squeeze(Isf((yp-150):(yp+626),(xp-50)));
y2 = (yp-150):(yp+626);
[fit4, gof4] = Fit_8gauss_V_v3(y2, ch2);

cH4= coeffvalues(fit4);%coeffvalues entrega los coeficientes de c/u de las 8 gaussianas
bH4= reshape(cH4, 3, 8);%acomodamos la matriz de coeficientes para que queden agrupados por columnas
b_fH4= sort( bH4(2, :));

%vector de posiciones horizontales
BV = 1:12;
BV(1:8) = b_fH3(1:8); 
BV(9:12) = b_fH4(5:8);

point= 1:27;
point(1:15) = BH;
point(16:27) = BV;

point

end