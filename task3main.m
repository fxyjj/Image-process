function [P,N,T] = task3main()

clc;
close all;  
I=imread ('1.tif');  
mask = imread('mask.tif');
label = imread('label.tif');
vessel_region = sum(label(:) == 255);
background_region = sum(label(:) == 0) - sum(mask(:) == 0);
I=double(rgb2gray(I)); 
%% process by FrangiFilter
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
%   Mean_filter = zeros(3,3);
% for i = 1 : 3
%     Mean_filter(i,1) = 1/9;
%     Mean_filter(i,2) = 1/9;
%     Mean_filter(i,3) = 1/9;
% end
%   % gamma correction 
% l_img = imadjust(res,[],[],0.5);
% ll_img = imadjust(res,[],[],1);
figure;  
imshow(uint8(I));
title('原灰度图');
figure;
imshow(res);
title('Frangi_1滤波结果');
figure;
imshow(res1);
title('Frangi滤波结果');
  figure;
  imshow(Ivessel);
  title('more clear,more noisy');
%  Otsu(l_img);
frangi_res =  Otsu(res1);
% cacluate the accuracy rate ,P,T,N
%P,The percentage of blood vessel pixels that is being correctly classified as blood vessel.
%N,The percentage of background pixels (only consider the region in the mask.) that is being correctly classified as background.
%T,The percentages of pixels are being correctly classified. (only consider the region in the mask).
right_background = 0;
right_retina_pixel = 0;
for i = 1 : r
    for j = 1 : c
        if mask(i,j) == 255 && frangi_res(i,j) == 0 && label(i,j) == 0
            right_background = right_background + 1;
        end
        if mask(i,j) == 255 && frangi_res(i,j) == 1 && label(i,j) == 255
            right_retina_pixel = right_retina_pixel + 1;
        end
    end
end
P = right_retina_pixel / vessel_region;
N = right_background / background_region;
T = (right_retina_pixel + right_background) / (vessel_region + background_region);

%% process image using sobel filter
sobel_img = sobel(I);

%% process image using loG filter
loG(I);

%% process image with DoG filter
DoG(I);

%% process image with Canny filter(unfinished)
Canny(I);
end