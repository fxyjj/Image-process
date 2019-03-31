% 3 x 3 mean filter
Mean_filter = zeros(3,3);
for i = 1 : 3
    Mean_filter(i,1) = 1/9;
    Mean_filter(i,2) = 1/9;
    Mean_filter(i,3) = 1/9;
end

% 5 x 5 Gaussian filter with ∂ = 1
Guassian_filter = fspecial('gaussian',5,1);

% 3 x 3 median filter

% 3 x 3 anisotropic filter with similarity function of (D - d) / D

% 5 x 5 bilaterial filter with ∂ = 1
function img = BF(I,sizef)
