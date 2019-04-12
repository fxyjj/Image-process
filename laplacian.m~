%laplacian
sizef = 3;
ori = rgb2gray(imread('retina_images_01_10/1.tif'));
offset = (sizef + 1)/2;

[r,c] = size(ori);
sharped_img = zeros(r,c);
lapf = [0,-1,0;-1,5,-1;0,-1,0];
new_I = zeros(r+2*(offset-1),c+2*(offset-1));
new_I(offset:r+offset-1,offset:c+offset-1) = ori;
img = zeros(r,c);
for i = offset : r+offset-1
    for j = offset : c+offset-1
        indx = 0;
        for x = 1 : sizef
            for y = 1 : sizef
                indx = indx + lapf(x,y)*new_I(i+x-offset,j+y-offset);
            end
        end
         sharped_img(i-offset+1,j-offset+1) = indx;
    end
    
end
%        close all;
%         imshow(sharped_img);
%         figure;
%         imshow(ori);
    %robert operator;
reb1 = [1,0;0,-1];
reb2 = [0,1;-1,0];
sharped_img2 = zeros(r,c);
for i = 1 : r-1
    for j = 1 : c-1
        fx = ori(i,j) - ori(i+1,j+1);
        fy = ori(i,j+1) - ori(i+1,j);
        f = double(fx^2 + fy^2)^(1/2);
         sharped_img2(i,j) = f;
    end
    
end   
        close all;
        imshow(uint8(sharped_img2));
        figure;
        imshow(ori);
        
      %sobel operators;
      