function d_img = dilation(I) %receive only binaried image
%%
%d_img, out image
%r,row of the origin image
%c,column of the origin image
%%
[r,c] = size(I);
d_img = zeros(r,c);
for i = 2 : r-1
    for j = 2 : c-1
        if I(i,j) == 1
                for x = 1 : 3
                    for y = 1 : 3
                        d_img(i+x-2,j+y-2) = 1;
                    end
                end
        end
    end
end
