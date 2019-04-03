function e_img = erosion(I)%only receive binarized image
sizef = 3;
[r,c] = size(I);
e_img = zeros(r,c);
e_img(:,:) = 1;
for i = 2 : r-1
    for j = 2 : c-1
        if I(i,j) == 0
                for x = 1 : 3
                    for y = 1 : 3
                        e_img(i+x-2,j+y-2) = 0;
                    end
                end
        end
    end
end