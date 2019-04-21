%task1
%generate the clusters of face pixels for face1.jpg
close all;
testImg = imread('face1.jpg');
url = imread('training_face_image/train15.jpg');
FaceModel = getFaceModel(url);
BinarizedFaceImage = getBinarizedFaceImage(testImg,FaceModel);

figure;
imshow(BinarizedFaceImage);
FinalFaceImage = getMorphFace1(BinarizedFaceImage);

figure;
imshow(FinalFaceImage);
%generate the clusters of face pixels for face2.jpg
 testImg2 = imread('face2.jpg');
 url2 = imread('training_face_image/train10.jpg');
 FaceModel2 = getFaceModel(url2);
 BinarizedFaceImage2 = getBinarizedFaceImage(testImg2,FaceModel2);
 figure;
 imshow(BinarizedFaceImage2);
FinalFaceImage2 = getMorphFace2(BinarizedFaceImage2);
figure;
imshow(FinalFaceImage2);

