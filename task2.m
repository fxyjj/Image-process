% 3 x 3 mean filter
Mean_filter = zeros(3,3,3);
for i = 1 : 3
    for j = 1 : 3
        Mean_filter(i,j,1) = 1/9;
        Mean_filter(i,j,2) = 1/9;
        Mean_filter(i,j,3) = 1/9;
    end
    
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

%add salt & pepper noise with 10% intensity on RGB channals of lena.jpg
ori_saltpepper_noise = imnoise(ori_1,'salt & pepper',0.1);

%convolute picture with 7 x 7 gaussian filter with ∂ = 2;
fter = G_Filter(2,7);
fter_3 = zeros(7,7,3);
fter_3(:,:,1) = fter;
fter_3(:,:,2) = fter;
fter_3(:,:,3) = fter;
img_conv_gaussian = convn(ori_gaussian_noise,fter_3,'same');
img_conv_salt = convn(ori_saltpepper_noise,fter_3,'same');


% applying to the five implemented filters on the destorted images

% 3 x 3 mean filter:

% ---- deal with gaussian noise image ---- %
  g_img_by_Mfter = convn(ori_gaussian_noise,Mean_filter,'same');

  % ---- deal with salt & pepper noise image ---- %
  s_img_by_Mfter = convn(ori_saltpepper_noise,Mean_filter,'same');

  
% 5 x 5 gaussian filter with ∂ = 1:
  g_filter = G_Filter(1,5);
  g_filter_3 = zeros(5,5,3);
  g_filter_3(:,:,1) = g_filter;
  g_filter_3(:,:,2) = g_filter;
  g_filter_3(:,:,3) = g_filter;
  % ---- deal with gaussain noise image ---- %
  g_img_by_Gfter = convn(ori_gaussian_noise,g_filter_3,'same');
  
  % ---- deal with salt & pepper noise image ---- %
  s_img_by_Gfter = convn(ori_saltpepper_noise,g_filter_3,'same');
  % === figure show === %
  figure;
  subplot(1,2,1);
  title('Origin');
  imshow(ori_gaussian_noise);
  subplot(1,2,2);
  title('after_Conv');
  imshow(uint8(g_img_by_Gfter));
  
% % 3 x 3 meidian filter:
% 
%   % ---- deal with gaussain noise image ---- %
%   g_img_by_Meifter = meidianFilter(ori_gaussain_noise,3);
%   
%   % ---- deal with salt & pepper noise image ---- %
%   s_img_by_Meifter = meidianFilter(ori_saltpepper_noise,3);
%   
%   
% % 3 x 3 Anisotropic filter with similarity funcion of (D - d)/D:
% 
%   % ---- deal with gaussain noise image ---- %
%   g_img_by_Anisofter = Anisotropic(ori_gaussain_noise,3);
%   
%   % ---- deal with salt & pepper noise image ---- %
%   s_img_by_Anisofter = Anisotropic(ori_saltpepper_noise,3);
%   
%   
% % 5 x 5 bilteral filter with ∂s = 1 and ∂r = 10:
% 
%   % ---- deal with gaussain noise image ---- %
%   g_img_by_Bfter = BF(ori_gaussain_noise,5,1,10);
%   
%   % ---- deal with salt & pepper noise image ---- %
%   s_img_by_Bfter = BF(ori_saltpepper_noise,5,1,10);
%   

  
  
  







