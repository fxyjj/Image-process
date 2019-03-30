%function img = getBinarizedFaceImage(testImage,faceModel)
[H_faceModel,S_faceModel] = getFaceModel();
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
          if(H_faceModel(1,1) <= H(i,j) <= H_faceModel(1,length(H_faceModel)))
             img2(i,j) = 255;
             %testImg_hsv(i,j,3) = 255;
          end
        if(S_faceModel(1,1) <= S(i,j) <= S_faceModel(1,length(S_faceModel)))
           img(i,j) = 255;
           %testImg_hsv(i,j,3) = 255;
        end 
        V(i,j) = 1;
    end
end
figure;
subplot(2,2,1);
imshow(img);
subplot(2,2,2);
imshow(img2);
%img = testImg_hsv(:,:,3);


