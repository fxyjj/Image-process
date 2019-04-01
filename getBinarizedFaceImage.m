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
             img2(i,j) = 255;
             %testImg_hsv(i,j,3) = 255;
          end
           if(H(i,j) <= C(2,2)/10000 && S(i,j)>=C(2,3)/10000 && S(i,j)<=C(2,4)/10000)
             img2(i,j) = 255;
             %testImg_hsv(i,j,3) = 255;
          end
    end
end
figure;
%subplot(2,2,1);
imshow(img2);
% subplot(2,2,2);
% imshow(img2);
% subplot(2,2,3);
% imshow(testImage);
%img = testImg_hsv(:,:,3);


