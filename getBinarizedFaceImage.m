%function img = getBinarizedFaceImage(testImage,faceModel)
C = getF();
testImage = imread('face2.jpg');
testImg_hsv = rgb2hsv(testImage);
[x,y,z] = size(testImage);
img = zeros(x,y);
img2 =zeros(x,y);
H = testImg_hsv(:,:,1);
S = testImg_hsv(:,:,2);
V = testImg_hsv(:,:,3);
for i = 1 : x
    for j = 1 : y
          if(H(i,j) <= C(1,2)/10000 && S(i,j)>=C(1,3)/10000 && S(i,j)<=C(1,4)/10000)
             img2(i,j) = 1;
             %testImg_hsv(i,j,3) = 255;
          end
           if(H(i,j) <= C(2,2)/10000 && S(i,j)>=C(2,3)/10000 && S(i,j)<=C(2,4)/10000)
             img2(i,j) = 1;
             %testImg_hsv(i,j,3) = 255;
          end
    end
end
img2d = dilation(img2);
img2dd = dilation(img2d);
img2e = erosion(img2);
img2ee = erosion(img2e);
img2eee = erosion(img2ee);
figure;
subplot(2,2,1);
imshow(img2e);
subplot(2,2,2);
imshow(img2ee);
subplot(2,2,3);
imshow(img2eee);
subplot(2,2,4);
imshow(img2);
%img = testImg_hsv(:,:,3);


