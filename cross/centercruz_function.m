function  [bvu, bhu]=centercruz_function(I)

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
        
        
            [fitresult, gof] = Fit_fondo_cruz_H(x, y, Ic);
            %figure; surf(x, y, I);
            [t1,t2] = meshgrid(x,y);
            promfit = fitresult( t1, t2);
            %figure; surf(t1, t2, promfit);
        
            J = abs(promfit-Ic);
            Isf((1+i*617):(617*(i+1)),(1+j*203):(203*(j+1)))=J;
            %figure; imagesc(J); colormap(gray)
            %figure; surf(xx, yy, J2);
        end
        xmin = 0;
    end
    
    %figure; imshow(Isf);

    i = 0;
    acbh = 0;
     
    for j = 1:1624
        i=i+1;
        cv = squeeze(Isf(:,j));%cortes verticales       
 
        [M,Inh] = max(cv);%M= valor, I=�ndices.      
        
        bh(i) = Inh; %valor central detectado para cada corte             
    end
    
        bhu = median(bh);  %posici�n l�nea horizontal 
      
     
     acbv = 0;
     i = 0;
     for j = 1:1234
        i=i+1;
        ch = squeeze(Isf(j,:));%cortes horizontales
      
        [M,Inv] = max(ch);%M= valor, I=�ndices.
       
        bv(i) = Inv; %valor central detectado de la gaussiana para cada corte                
     end
     
      bvu = median(bv);  %posici�n l�nea vertical
      
end