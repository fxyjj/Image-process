function new_img = Canny(ori)
sigma = 2;
sizef = 5;
offset = (sizef+1)/2;
gfilter = fspecial('gaussian',sizef,sigma);
%ori = rgb2gray(imread('retina_images_01_10/1.tif'));
[r,c] = size(ori);
img_conv_by_g = conv2(ori,gfilter,'same');
gfilter_x = zeros(sizef,sizef);
gfilter_y = zeros(sizef,sizef);
for i = 1 : sizef
    for j = 1 : sizef
        gfilter_x(i,j) = -(i-offset)/(2*pi*double(sigma)^4)*exp(-((i-offset)^2+(j-offset)^2)/(2*sigma*sigma));
        gfilter_y(i,j) = -(j-offset)/(2*pi*double(sigma)^4)*exp(-((i-offset)^2+(j-offset)^2)/(2*sigma*sigma));
    end
end

img_x = conv2(img_conv_by_g,gfilter_x,'same');
img_y = conv2(img_conv_by_g,gfilter_y,'same');
new_img = zeros(r,c);
for s = 1 : r
    for k = 1 : c
        new_img(s,k) = double(double(img_x(s,k))^2 + double(img_y(s,k))^2)^(1/2);
    end
end

tanM = zeros(r,c);
for t1 = 1 : r
    for t2 = 1 : c
        check = atan(img_y(t1,t2)/img_x(t1,t2));
        tanM1(t1,t2) = check;
        if 0 < check && check <= pi/8 || 7*pi/8 < check && check < pi
            tanM(t1,t2) = 0;
        else 
            if pi/8 < check && check <= 3*pi/8
                tanM(t1,t2) = 1;
            else
                if 3*pi/8 < check && check <= 5*pi/8
                    tanM(t1,t2) = 2;
                else
                    if 5*pi/8 < check && check <= 7*pi/8
                        tanM(t1,t2) = 3;
                    end
                end
            end
        end
    end
end
arr_dam = [];
indx_dam = 1;
for s1 = 2 : r-1
    for s2 = 2 : c-1
        if new_img(s1,s2) ~= 0
        if(tanM(s1,s2) == 0)
            if new_img(s1,s2) < new_img(s1,s2-1) || new_img(s1,s2) < new_img(s1,s2+1)
                 M_img(s1,s2) = 0;
                  
            else
                M_img(s1,s2) = new_img(s1,s2);
                arr_dam(1,indx_dam) =M_img(s1,s2);
                indx_dam = indx_dam + 1;
            end
        end
        if tanM(s1,s2) == 1
            if new_img(s1,s2) < new_img(s1-1,s2+1) || new_img(s1,s2) < new_img(s1+1,s2-1)
                 M_img(s1,s2) = 0;
            else
                M_img(s1,s2) = new_img(s1,s2);
                arr_dam(1,indx_dam) =M_img(s1,s2);
                indx_dam = indx_dam + 1;
            end
        end
        if tanM(s1,s2) == 2
            if new_img(s1,s2) < new_img(s1-1,s2) || new_img(s1,s2) < new_img(s1+1,s2+1)
                 M_img(s1,s2) = 0;
            else
                M_img(s1,s2) = new_img(s1,s2);
                arr_dam(1,indx_dam) =M_img(s1,s2);
                indx_dam = indx_dam + 1;
            end
        end
        if tanM(s1,s2) == 3
            if new_img(s1,s2) < new_img(s1-1,s2) || new_img(s1,s2) < new_img(s1+1,s2)
                 M_img(s1,s2) = 0;
            else
                M_img(s1,s2) = new_img(s1,s2);
                arr_dam(1,indx_dam) =M_img(s1,s2);
                indx_dam = indx_dam + 1;
            end
        end
        end
    end
end
%close all;
figure;
imshow(new_img);
end
% build in function in Matlab
% BW2 = edge(ori,'canny');
% figure;
% imshow(BW2);