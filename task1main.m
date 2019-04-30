%task1
%generate the clusters of face pixels for face1.jpg
close all;
testImg = imread('face1.jpg');
url = imread('training_face_image/train15.jpg');
%get the HSV face model by using FaceMOdel function
FaceModel = getFaceModel(url);
%transform the gray image into binarized image
BinarizedFaceImage = getBinarizedFaceImage(testImg,FaceModel);

figure;
imshow(BinarizedFaceImage);
FinalFaceImage = getMorphFace1(BinarizedFaceImage);

figure;
imshow(FinalFaceImage);
%generate the clusters of face pixels for face2.jpg
 testImg2 = imread('face2.jpg');
 url2 = imread('training_face_image/train10.jpg');
 %get the HSV face model by using FaceMOdel function
 FaceModel2 = getFaceModel(url2);
 %transform the gray image into binarized image
 BinarizedFaceImage2 = getBinarizedFaceImage(testImg2,FaceModel2);
 %show the image before mophological operations
 figure;
 imshow(BinarizedFaceImage2);
 %reduce the noise in the picture to get clearer face regions
 FinalFaceImage2 = getMorphFace2(BinarizedFaceImage2);
 figure;
 imshow(FinalFaceImage2);