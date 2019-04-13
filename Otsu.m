%Otsu thresholding
ori = rgb2gray(imread('retina_images_01_10/1.tif'));
k=graythresh(M_img);              %得到最优阈值
J=imbinarize(M_img,k);
figure;
imshow(J);
%figure;
%imshow(dilation(dilation(J)));
