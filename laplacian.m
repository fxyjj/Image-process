 function new_img1 = laplacian(ori)
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
%            close all;
%             imshow(sharped_img);
%             figure;
%             imshow(ori);
%             figure;
%             imshow(new_img1);
           
    %robert operator;

% sharped_img2 = zeros(r,c);
% for i = 1 : r-1
%     for j = 1 : c-1
%         fx = ori(i,j) - ori(i+1,j+1);
%         fy = ori(i,j+1) - ori(i+1,j);
%         f = double(fx^2 + fy^2)^(1/2);
%          sharped_img2(i,j) = f;
%     end
%     
% end   
%             close all;
%             imshow(uint8(sharped_img2));
%             figure;
%             imshow(ori);
        
     

      
      
      
      
      
      