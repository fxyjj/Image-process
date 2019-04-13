%DoG
g1filter = fspecial('gaussian',5,1.4);
%test1 = G_Filter(1.6,3);
g2filter = fspecial('gaussian',5,1);
%test2 = G_Filter(1,3);
ori = rgb2gray(imread('retina_images_01_10/1.tif'));
[r,c] = size(ori);
img1 = conv2(ori,g1filter,'same');
img2 = conv2(ori,g2filter,'same');
for i = 1 : r
    for j = 1 : c
        new_img(i,j) = img2(i,j) - img1(i,j);
    end
end
imshow(new_img);