%Otsu thresholding
 ori = rgb2gray(imread('retina_images_01_10/1.tif'));
k=graythresh(Ivessel);              %得到最优阈值
J=imbinarize(Ivessel,0.028);
  BW2 = edge(ori,'Canny');
  figure;
  imshow(BW2);
figure;
imshow(J+BW2);
figure;
 edge = [0.001,0.001:0.001:0.1,0.1];
 h = histogram(Ivessel,edge);
%figure;
%imshow(dilation(dilation(J)));
