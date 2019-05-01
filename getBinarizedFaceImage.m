function img = getBinarizedFaceImage(testImage,faceModel)
C = faceModel;
% testImage = imread('face2.jpg');
testImg_hsv = rgb2hsv(testImage);
[x,y,z] = size(testImage);
% img = zeros(x,y);
img =zeros(x,y);
H = testImg_hsv(:,:,1); % H channel
S = testImg_hsv(:,:,2); % S channel
V = testImg_hsv(:,:,3); % V channel
for i = 1 : x
    for j = 1 : y
          if(H(i,j) <= C(1,2)/10000 && S(i,j)>=C(1,3)/10000 && S(i,j)<=C(1,4)/10000)
             img(i,j) = 1;
             %testImg_hsv(i,j,3) = 255;
          end
           if(H(i,j) <= C(2,2)/10000 && S(i,j)>=C(2,3)/10000 && S(i,j)<=C(2,4)/10000)
             img(i,j) = 1;
             %testImg_hsv(i,j,3) = 255;
          end
    end
end
end


