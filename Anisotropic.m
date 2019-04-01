function img = Anisotropic(I,sizef)
[r,c] = size(I);
new_I = zeros(r+2,c+2);
new_I(2:r+1,2:c+1) = I;
img_p = zeros(r+2,c+2);
img = zeros(r,c);
for i = 2 : r+1
    for j = 2 : c+1
        cen = new_I(i,j);
        n1 = abs(cen - new_I(i,j-1));
        n2 = abs(cen - new_I(i-1,j));
        n3 = abs(cen - new_I(i,j+1));
        n4 = abs(cen - new_I(i+1,j));
        n5 = abs(cen - new_I(i+1,j+1));
        n6 = abs(cen - new_I(i-1,j-1));
        n7 = abs(cen - new_I(i-1,j+1));
        n8 = abs(cen - new_I(i+1,j-1));
        set = [n1,n2,n3,n4,n5,n6,n7,n8];
        D = max(set);
        if D == 0
            img(i-1,j-1) = cen;
        else
            set_deal = abs(D - set)/D;
            val_sum =  set_deal(1,1)*new_I(i,j-1)+set_deal(1,2)*new_I(i-1,j)+set_deal(1,3)*new_I(i,j+1)+set_deal(1,4)*new_I(i+1,j)+set_deal(1,5)*new_I(i+1,j+1)+set_deal(1,6)*new_I(i-1,j-1)+set_deal(1,7)*new_I(i-1,j+1)+set_deal(1,8)*new_I(i+1,j-1);
            set_sum = sum(set_deal);
            if set_sum == 0
                img(i-1,j-1) = new_I(i+1,j);
            else
                img(i-1,j-1) = val_sum/set_sum;
            end
        end
    end
end
end
