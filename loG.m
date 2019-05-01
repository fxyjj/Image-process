%loG
function loG(ori)
g1filter = fspecial('gaussian',7,1);
%ori = rgb2gray(imread('retina_images_01_10/1.tif'));
img_con_by_g1 = conv2(ori,g1filter,'same');
lapf = [0,-1,0;-1,4,-1;0,-1,0];
img = conv2(img_con_by_g1,lapf,'same');
%imshow(img);
g2filter = fspecial('gaussian',7,2);
img_con_by_g2 = conv2(ori,g2filter,'same');
img2 = conv2(img_con_by_g2,lapf,'same');

g3filter = fspecial('gaussian',7,3);
img_con_by_g3 = conv2(ori,g3filter,'same');
img3 = conv2(img_con_by_g3,lapf,'same');

g4filter = fspecial('gaussian',7,4);
img_con_by_g4 = conv2(ori,g4filter,'same');
img4 = conv2(img_con_by_g4,lapf,'same');
%close all;
figure;
subplot(2,2,1);
imshow(img);
title('sig = 1');
subplot(2,2,2);
imshow(img2);
title('sig = 2');
subplot(2,2,3);
imshow(img3);
title('sig = 3');
subplot(2,2,4);
imshow(img4);
title('sig = 4');