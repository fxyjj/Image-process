%Otsu thresholding
% ori = rgb2gray(imread('retina_images_01_10/1.tif'));
k=graythresh(Ivessel);              %得到最优阈值
J=imbinarize(Ivessel,k);
figure;
imshow(J);
edge = [0.001,0.001:0.001:0.1,0.1];
h = histogram(Ivessel,edge);
%figure;
%imshow(dilation(dilation(J)));
