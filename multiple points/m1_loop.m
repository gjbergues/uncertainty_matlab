m = zeros(122,27);

for n = 0:121
n
    
sum_I = 0;
SumaTotal = 0;

%Carga de la imagenes y promedio aritmético para cada color
%---------------------------------------------------------------------------------------------------------------------------------
i = 0;
for i = 1:5
    f = ['I:\incertidumbre2\M2\ima' num2str(n) '_' num2str(i) '.bmp'];
   
    rgb_img = imread(f);
    I = .2989*rgb_img(:,:,1) + .5870*rgb_img(:, :, 2) + .1140*rgb_img(:, :, 3);

    sum_I = sum_I + (double(I) + 1);
end

%Imagen promedio en I_new
I_new = sum_I / 5;

%Niego imagen promedio y la muestro
%Enhance white and grey values that are in a predominant dark region. And
%put the gaussian peaks positives
%I_new_neg = imcomplement(I_new); se puede hacer de esta manera
I_new_neg = 1 - (I_new ./ 255);
%figure; imagesc(I_new_neg); colormap(gray)%2
%---------------------------------------------------------------------------------------

%Peaks detection
[p]= centercruz_function(I_new_neg);

m(n+1,:) = p;


end

xlswrite('M2.xlsx', m, 2,'E2:AE123');
