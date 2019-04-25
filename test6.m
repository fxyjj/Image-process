%suppression
close all;
ori = rgb2gray(imread('retina_images_01_10/1.tif'));
lap_pic = laplacian(ori);
figure;
imshow(lap_pic);
sob_pic = sobel(ori);
figure;
imshow(uint8(sob_pic));
meidian_pic = meidianFilter(sob_pic,5);
figure;
imshow(uint8(meidian_pic));
[r,c] = size(ori);
pro_pic = zeros(r,c);
for i = 1 : r
    for j = 1 : c
        pro_pic(i,j) = lap_pic(i,j) * meidian_pic(i,j);
    end
end
figure;
imshow(pro_pic);
last2_pic =zeros(r,c);
for i = 1 : r
    for j = 1 : c
        last2_pic(i,j) = pro_pic(i,j) + ori(i,j);
    end
end
figure;
 imshow(last2_pic);