% 3 x 3 mean filter
close all;
Mean_filter = zeros(3,3);
for i = 1 : 3
    Mean_filter(i,1) = 1/9;
    Mean_filter(i,2) = 1/9;
    Mean_filter(i,3) = 1/9;
end

% 5 x 5 Gaussian filter with ∂ = 1

%%img = conv2(I,g_filter,'same');

% 3 x 3 median filter
%img = meidianFilter(I,3);

% 3 x 3 anisotropic filter with similarity function of (D - d) / D
%img = Anisotropic(I,3);

% 5 x 5 bilaterial filter with ∂ = 1
%img = BF(I,5);

%add gaussian noise with ∂ = 20 on RGB channals of lena.jpg
ori_1 = imread('lena.jpg');
ori_gaussian_noise = imnoise(ori_1,'gaussian',0,20^2/225^2);
figure;
imshow(ori_gaussian_noise);
%add salt & pepper noise with 10% intensity on RGB channals of lena.jpg
ori_saltpepper_noise = imnoise(ori_1,'salt & pepper',0.1);
figure;
imshow(ori_saltpepper_noise);
%convolute picture with 7 x 7 gaussian filter with ∂ = 2;
fter = G_Filter(2,7);

img_conv_gaussian(:,:,1) = conv2(ori_gaussian_noise(:,:,1),fter,'same');
img_conv_gaussian(:,:,2) = conv2(ori_gaussian_noise(:,:,2),fter,'same');
img_conv_gaussian(:,:,3) = conv2(ori_gaussian_noise(:,:,3),fter,'same');

img_conv_salt(:,:,1) = conv2(ori_saltpepper_noise(:,:,1),fter,'same');
img_conv_salt(:,:,2) = conv2(ori_saltpepper_noise(:,:,2),fter,'same');
img_conv_salt(:,:,3) = conv2(ori_saltpepper_noise(:,:,3),fter,'same');

 figure;
   subplot(1,2,1);
   imshow(ori_gaussian_noise);
   title('Origin');
   subplot(1,2,2);
   imshow(uint8(img_conv_gaussian));
   title('Gaussian noise after Conv');
 figure;
   subplot(1,2,1);
   imshow(ori_saltpepper_noise);
   title('Origin');
   subplot(1,2,2);
   imshow(uint8(img_conv_salt));
   title('Saltpepper after Conv');
% applying to the five implemented filters on the destorted images

% 3 x 3 mean filter:

% ---- deal with gaussian noise image ---- %
  g_img_by_Mfter(:,:,1) = conv2(ori_gaussian_noise(:,:,1),Mean_filter,'same');
  g_img_by_Mfter(:,:,2) = conv2(ori_gaussian_noise(:,:,2),Mean_filter,'same');
  g_img_by_Mfter(:,:,3) = conv2(ori_gaussian_noise(:,:,3),Mean_filter,'same');

  % ---- deal with salt & pepper noise image ---- %
  s_img_by_Mfter(:,:,1) = conv2(ori_saltpepper_noise(:,:,1),Mean_filter,'same');
  s_img_by_Mfter(:,:,2) = conv2(ori_saltpepper_noise(:,:,2),Mean_filter,'same');
  s_img_by_Mfter(:,:,3) = conv2(ori_saltpepper_noise(:,:,3),Mean_filter,'same');

% === figure show === %
figure;
  subplot(1,2,1);
  imshow(ori_gaussian_noise);
  title('Origin');
  subplot(1,2,2);
  imshow(uint8(g_img_by_Mfter));
  title('Guaasian noise after Mfter Conv');
figure;
  subplot(1,2,1);
  imshow(ori_saltpepper_noise);
  title('Origin');
  subplot(1,2,2);
  imshow(uint8(s_img_by_Mfter));
  title('Saltpepper noise after Mfter Conv');
% === figure show === %

% 5 x 5 gaussian filter with ∂ = 1:
  g_filter = G_Filter(1,5);
  
  % ---- deal with gaussain noise image ---- %
  g_img_by_Gfter(:,:,1) = conv2(ori_gaussian_noise(:,:,1),g_filter,'same');
  g_img_by_Gfter(:,:,2) = conv2(ori_gaussian_noise(:,:,2),g_filter,'same');
  g_img_by_Gfter(:,:,3) = conv2(ori_gaussian_noise(:,:,3),g_filter,'same');
  
  % ---- deal with salt & pepper noise image ---- %
  s_img_by_Gfter(:,:,1) = conv2(ori_saltpepper_noise(:,:,1),g_filter,'same');
  s_img_by_Gfter(:,:,2) = conv2(ori_saltpepper_noise(:,:,2),g_filter,'same');
  s_img_by_Gfter(:,:,3) = conv2(ori_saltpepper_noise(:,:,3),g_filter,'same');
  
  % === figure show === %
figure;
  subplot(1,2,1);
  imshow(ori_gaussian_noise);
  title('Origin');
  subplot(1,2,2);
  imshow(uint8(g_img_by_Gfter));
  title('Gaussian noise after Gfter Conv');
figure;  
  subplot(1,2,1);
  imshow(ori_saltpepper_noise);
  title('Origin');
  subplot(1,2,2);
  imshow(uint8(s_img_by_Gfter));
  title('Saltpepper noise after Gfter Conv');
 % 3 x 3 meidian filter:
 
   % ---- deal with gaussain noise image ---- %
   g_img_by_Meifter(:,:,1) = meidianFilter(ori_gaussian_noise(:,:,1),3);
   g_img_by_Meifter(:,:,2) = meidianFilter(ori_gaussian_noise(:,:,2),3);
   g_img_by_Meifter(:,:,3) = meidianFilter(ori_gaussian_noise(:,:,3),3);
   
   % ---- deal with salt & pepper noise image ---- %
   s_img_by_Meifter(:,:,1) = meidianFilter(ori_saltpepper_noise(:,:,1),3);
   s_img_by_Meifter(:,:,2) = meidianFilter(ori_saltpepper_noise(:,:,2),3);
   s_img_by_Meifter(:,:,3) = meidianFilter(ori_saltpepper_noise(:,:,3),3);
   
   % === figure show === %
   figure;
  subplot(1,2,1);
  imshow(ori_gaussian_noise);
  title('Origin');
  subplot(1,2,2);
  imshow(uint8(g_img_by_Meifter));
  title('Gaussain noise after Meifter Conv');
figure;  
  subplot(1,2,1);
  imshow(ori_saltpepper_noise);
  title('Origin');
  subplot(1,2,2);
  imshow(uint8(s_img_by_Meifter));
  title('Saltpepper noise after Meifter Conv');
 % 3 x 3 Anisotropic filter with similarity funcion of (D - d)/D:
 
   % ---- deal with gaussain noise image ---- %
   g_img_by_Anisofter(:,:,1) = Anisotropic(ori_gaussian_noise(:,:,1),3);
   g_img_by_Anisofter(:,:,2) = Anisotropic(ori_gaussian_noise(:,:,2),3);
   g_img_by_Anisofter(:,:,3) = Anisotropic(ori_gaussian_noise(:,:,3),3);
   
   % ---- deal with salt & pepper noise image ---- %
   s_img_by_Anisofter(:,:,1) = Anisotropic(ori_saltpepper_noise(:,:,1),3);
   s_img_by_Anisofter(:,:,2) = Anisotropic(ori_saltpepper_noise(:,:,2),3);
   s_img_by_Anisofter(:,:,3) = Anisotropic(ori_saltpepper_noise(:,:,3),3);
   
   % === figure show === %
   figure;
  subplot(1,2,1);
  imshow(ori_gaussian_noise);
  title('Origin');
  subplot(1,2,2);
  imshow(uint8(g_img_by_Anisofter));
  title('Gaussian noise after Anisofter Conv');
figure;  
  subplot(1,2,1);
  imshow(ori_saltpepper_noise);
  title('Origin');
  subplot(1,2,2);
  imshow(uint8(s_img_by_Anisofter));
  title('Saltpeeper noise after Anisofter Conv');
 % 5 x 5 bilteral filter with ∂s = 1 and ∂r = 10:
 
   % ---- deal with gaussain noise image ---- %
   g_img_by_BFfter(:,:,1) = BF(ori_gaussian_noise(:,:,1),5,1,10);
   g_img_by_BFfter(:,:,2) = BF(ori_gaussian_noise(:,:,2),5,1,10);
   g_img_by_BFfter(:,:,3) = BF(ori_gaussian_noise(:,:,3),5,1,10);
   
   % ---- deal with salt & pepper noise image ---- %
   s_img_by_BFfter(:,:,1) = BF(ori_saltpepper_noise(:,:,1),5,1,10);
   s_img_by_BFfter(:,:,2) = BF(ori_saltpepper_noise(:,:,2),5,1,10);
   s_img_by_BFfter(:,:,3) = BF(ori_saltpepper_noise(:,:,3),5,1,10);
   
   % === figure show === %
   figure;
  subplot(1,2,1);
  imshow(ori_gaussian_noise);
  title('Origin');
  subplot(1,2,2);
  imshow(uint8(g_img_by_BFfter));
  title('Gaussian noise after BFfter Conv');
figure;  
  subplot(1,2,1);
  imshow(ori_saltpepper_noise);
  title('Origin');
  subplot(1,2,2);
  imshow(uint8(s_img_by_BFfter));
  title('Saltpepper noise after BFofter Conv');
  
%   close all;
%    figure;
%   imshow(ori_gaussian_noise);
%   title('Origin');
%   figure;
%   imshow(uint8(g_img_by_BFfter));
%   title('after BFfter Conv');
%   figure;%subplot(2,2,3);
%   imshow(ori_saltpepper_noise);
%   title('Origin');
%   figure;%subplot(2,2,4);
%   imshow(uint8(s_img_by_BFfter));
%   title('after BFofter Conv');

  
  
  







