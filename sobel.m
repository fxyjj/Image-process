 %sobel operators;
 ori = rgb2gray(imread('retina_images_01_10/1.tif'));
%offset = (sizef + 1)/2;
[r,c] = size(ori);    
 reb1 = [-1,0,1;-2,0,2;-1,0,1];
 reb2 = [-1,-2,-1;0,0,0;1,2,1];
  sharped_img = zeros(r,c);
% for i = 2 : r-1
%     for j = 2 : c-1
%         fx = 0;
%         fy = 0;
%        for x = 1 : 3
%            for y = 1 : 3
%                fx = fx + reb1(x,y)*ori(i-x+2,j-y+2);
%                fy = fy + reb2(x,y)*ori(i-x+2,j-y+2);
%            end
%        end
%        fx2 = double(fx)^2;
%        fy2 = double(fy)^2;
%        f = double(fx2 + fy2)^(1/2);
%        sharped_img(i,j) = f;
%     end
%     
% end   
img_x = conv2(ori,reb1,'same');
img_y = conv2(ori,reb2,'same');
for i = 1 : r
    for j = 1 : c
        sharped_img(i,j) = double(double(img_x(i,j))^2 + double(img_y(i,j))^2)^(1/2);
    end
end



           close all;
           imshow(uint8(sharped_img));
           figure;
           imshow(ori); 
