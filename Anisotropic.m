function img = Anisotropic(I,sizef)
% I_ = imread('face2.jpg');
% 
% I__ = rgb2gray(I_);
% I = imnoise(I__,'gaussian',0,20^2/225^2);

%sizef = 3;
[r,c] = size(I);
offset = (sizef+1)/2;
new_I = zeros(r+sizef-1,c+sizef-1);
new_I(offset:r+offset-1,offset:c+offset-1) = I;
%img_p = zeros(r+2,c+2);
img = zeros(r,c);
for i = offset : r+offset-1
    for j = offset : c+offset-1
        cen = new_I(i,j);
        Af = zeros(sizef,sizef);
        for x = 1 : sizef
            for y = 1 : sizef
                Af(x,y) = abs(cen - new_I(i+x-offset,j+y-offset));
            end
        end
        D = max(max(Af));
        if D == 0
            img(i-offset+1,j-offset+1) = cen;
        else
            set_deal = abs(D - Af)/D;
            val_sum = 0;%set_deal(1,1)*new_I(i,j-1)+set_deal(1,2)*new_I(i-1,j)+set_deal(1,3)*new_I(i,j+1)+set_deal(1,4)*new_I(i+1,j)+set_deal(1,5)*new_I(i+1,j+1)+set_deal(1,6)*new_I(i-1,j-1)+set_deal(1,7)*new_I(i-1,j+1)+set_deal(1,8)*new_I(i+1,j-1);
            for x1 = 1 : sizef
                for y1 = 1 : sizef
                    val_sum = val_sum+set_deal(x1,y1)*new_I(i+x1-offset,j+y1-offset);
                end
            end
            set_sum = sum(sum(set_deal));
            if set_sum == 0
                img(i-offset+1,j-offset+1) = new_I(i+1,j);
            else
                img(i-offset+1,j-offset+1) = val_sum/set_sum;
            end
        end
    end
end
end
