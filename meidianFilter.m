function img = meidianFilter(I,sizef)
% I = ori_gray;
%sizef = 3;
[r,c] = size(I);
offset = (sizef+1)/2;
new_I = zeros(r+2*(offset-1),c+2*(offset-1));
new_I(offset:r+offset-1,offset:c+offset-1) = I;
img = zeros(r,c);
for i = offset : r+offset-1
    for j = offset : c+offset-1
        lf = zeros(1,sizef^2);
        for x = 1 : sizef
            for y = 1 : sizef
                lf(1,(x-1)*sizef+y) = new_I(i+x-offset,j+y-offset);
                if (x-1)*sizef+y > 1
                    for i1 = (x-1)*sizef+y:-1:2
                        if lf(1,i1) < lf(1,i1-1)
                            mei = lf(1,i1);
                            lf(1,i1) = lf(1,i1-1);
                            lf(1,i1-1) = mei;
                        end
                    end
                end
            end
        end
        img(i-offset+1,j-offset+1) = lf(1,(sizef^2+1)/2);
    end
end
        