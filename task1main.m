%task1
%generate the clusters of face pixels for face1.jpg
testImg = imread('face1.jpg');
url = imread('training_face_image/train15.jpg');
FaceModel = getFaceModel(url);
BinarizedFaceImage = getBinarizedFaceImage(testImg,FaceModel);
img_conn = connection_comp(BinarizedFaceImage,15);

img2d = dilation(img_conn);
img2d_conn = connection_comp(img2d,40);
img2e = erosion(img2d_conn);
% img2dd = dilation(img2d_conn);
img2e_conn = connection_comp(img2e,25);
% img2e = erosion(BinarizedFaceImage);
img2ee = erosion(img2e);
img2eee = erosion(img2ee);
figure;
%  subplot(2,2,1);
%  imshow(img2d);
%  subplot(2,2,2);
%  imshow(img2dd);
%  subplot(2,2,3);
%  imshow(img2eee);
%  subplot(2,2,4);
% imshow(BinarizedFaceImage);
% figure;
% imshow(img_conn);
% figure;
% imshow(img2d);
% figure;
% imshow(img2e);
% figure;
% imshow(img2e_conn);

%generate the clusters of face pixels for face2.jpg
testImg2 = imread('face2.jpg');
url2 = imread('training_face_image/train10.jpg');
FaceModel2 = getFaceModel(url2);
BinarizedFaceImage2 = getBinarizedFaceImage(testImg2,FaceModel2);
figure;
imshow(BinarizedFaceImage2);

