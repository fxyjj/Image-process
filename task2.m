% 3 x 3 mean filter
Mean_filter = zeros(3,3);
for i = 1 : 3
    Mean_filter(i,1) = 1/9;
    Mean_filter(i,2) = 1/9;
    Mean_filter(i,3) = 1/9;
end
% 5 x 5 Gaussian filter with ∂ = 1
gaussian_filter = G_Filter(1,3);
img = conv2(I,gaussian_filter,'same');
% 3 x 3 median filter
img = meidianFilter(I,3);
% 3 x 3 anisotropic filter with similarity function of (D - d) / D
img = Anisotropic(I,3);
% 5 x 5 bilaterial filter with ∂ = 1
img = BF(I,5);
