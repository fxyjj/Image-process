%Otsu thresholding
 ori = rgb2gray(imread('retina_images_01_10/1.tif'));
k=graythresh(res1);              %得到最优阈值
J=imbinarize(res1,k);
j = connection_comp(J,5);
%   BW2 = edge(ori,'Canny');
%   figure;
%   imshow(BW2);
  
figure;
imshow(j);

% figure;
%  edge = [0.001,0.001:0.001:0.1,0.1];
%  h = histogram(Ivessel,edge);
%figure;
%imshow(dilation(dilation(J)));
