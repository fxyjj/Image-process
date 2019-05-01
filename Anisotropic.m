function img = Anisotropic(I,sizef)
%%
% size_I, the matrix used to contain the calculated value, when finally put
% the value in here into the out put image matrix
% offset, the size to padding the image for convolution
% Af, an sizef x sizef matrix cantain the difference
% D, the max pixel value difference between the current pixel and the adjacent pixels. 
%%
[r,c] = size(I);% get the size of the image
offset = (sizef+1)/2;% used to shift the filter on the image  
new_I = zeros(r+sizef-1,c+sizef-1);%add 0 range to the image
new_I(offset:r+offset-1,offset:c+offset-1) = I;
img = zeros(r,c);
%iterate all the pixel in the image to do the anisotropic operation
for i = offset : r+offset-1
    for j = offset : c+offset-1
        cen = new_I(i,j);
        Af = zeros(sizef,sizef);
        for x = 1 : sizef
            for y = 1 : sizef
                Af(x,y) = abs(cen - new_I(i+x-offset,j+y-offset));
            end
        end
        %apply the similarity function (D-d)/d
        D = max(max(Af));
        if D == 0
            img(i-offset+1,j-offset+1) = cen;
        else
            set_deal = abs(D - Af)/D;
            val_sum = 0;
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
