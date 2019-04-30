 function sharped_img = laplacian(ori)
sizef = 3;
% ori = rgb2gray(imread('retina_images_01_10/1.tif'));
offset = (sizef + 1)/2;
[r,c] = size(ori);
new_img = zeros(r,c);
lapf = [0,1,0;1,-4,1;0,1,0];
sharped_img = conv2(ori,lapf,'same');
for i = 1 : r
    for j = 1 : c
       new_img1(i,j) = ori(i,j) - sharped_img(i,j);
    end
end
figure;
imshow(uint8(sharped_img));
end