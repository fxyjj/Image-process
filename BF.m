function img = BF(I,sizef,s1,s2)
sigmaG = s1;% space sigma
sigmaR = s2;% range sigma
%space filter outside the loop
f_coeff = G_Filter(sigmaG,sizef);
offset = (sizef + 1)/2;
[r,c] = size(I);
new_I = zeros(r+2*(offset-1),c+2*(offset-1));
new_I(offset:r+offset-1,offset:c+offset-1) = I;
img = zeros(r,c);
for i = offset : r+offset-1
    for j = offset : c+offset-1
        % range filter inside the loop
        lf = zeros(sizef,sizef);
        cen = new_I(i,j);
        for x = 1 : sizef
            for y = 1 : sizef
                lf(x,y) = exp(-(cen - new_I(i+x-offset,j+y-offset))^2/(2*sigmaR*sigmaR))*f_coeff(x,y);
            end
        end
        all_sum = 0;
        for k = 1 : sizef
            for l = 1 : sizef
                all_sum = all_sum + new_I(i+k-offset,j+l-offset)*lf(k,l);
            end
        end
        genzi = sum(sum(lf));
        img(i-offset+1,j-offset+1) = all_sum/genzi;
    end
end
end