clc;close all;  
I=imread ('retina_images_01_10/1.tif');  
mask = imread('mask_images/1.tif');
I=double(rgb2gray(I));  
Ivessel=FrangiFilter2D(I);
[r,c] = size(I);
for i = 1 : r
    for j = 1 : c
        if mask(i,j) == 0 
            Ivessel(i,j) = 0;
        end
    end
end
res = im2uint8( mat2gray( log(1 + double(Ivessel)) ) );
  res1 = im2uint8( mat2gray( log(1 + double(res)) ) );
  Mean_filter = zeros(3,3);
for i = 1 : 3
    Mean_filter(i,1) = 1/9;
    Mean_filter(i,2) = 1/9;
    Mean_filter(i,3) = 1/9;
end
%  res_g =  BF(res,3,10,10);
  
  % gamma correction 
  l_img = imadjust(res,[],[],0.5);
   ll_img = imadjust(res,[],[],1);
  res_g =  BF(ll_img,3,1,1);
  res_A = Anisotropic(ll_img,3);
   res_M = conv2(ll_img,Mean_filter,'same');
  
%   s_img = realpow(f_img,1/gamma);
  
 
figure;  
imshow(uint8(I));
title('原灰度图');
figure;
imshow(res_M);
title('Frangi滤波结果');
figure;
imshow(l_img);
title('more clear,more noisy');
figure;  
imshow(ll_img);
title('Gamma图');
