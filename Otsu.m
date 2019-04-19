%Otsu thresholding
ori = rgb2gray(imread('retina_images_01_10/1.tif'));
k=graythresh(sharped_img);              %得到最优阈值
J=imbinarize(sharped_img,k);
figure;
imshow(J);
%figure;
%imshow(dilation(dilation(J)));
