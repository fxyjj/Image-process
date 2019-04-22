clc;close all;clear all;  
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
figure;  
imshow(uint8(I));
title('原灰度图');
figure;
imshow(Ivessel);
title('Frangi滤波结果');
