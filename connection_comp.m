% function c_img = connection_comp(I,t)%receive only binarized image
I = img2dd;
t = 1000;
[r,c] = size(I);
m_img = zeros(r,c);
c_img = zeros(r,c);
char = 2;
for i = 2 : r
    for j = 2 : c
        if I(i,j) == 1
            if I(i-1,j) == 0 && I(i,j-1) == 0
                m_img(i,j) = char;
                char = char + 1;
            else
                if I(i-1,j) ~= 0 && I(i,j-1) ~= 0
                    ram = randi(2,1,1);
                    if ram(1,1) == 1
                        m_img(i,j) = m_img(i-1,j);
                    else
                        m_img(i,j) = m_img(i,j-1);
                    end
                else
                    if I(i-1,j) ~= 0 && I(i,j-1) == 0
                        m_img(i,j) = m_img(i-1,j);
                    
                    else
                        if I(i,j-1) ~= 0 && I(i-1,j) == 0
                        m_img(i,j) = m_img(i,j-1);
                        end
                    end
                end
            end
        end
    end
end
curmin = intmax;
for x = 2 : r-1
    for y = 2 : c-1
        if m_img(x,y) ~= 0
        for x1 = -1 : 1 : 1
            for y1 = -1 : 1 : 1
                if m_img(x+x1,y+y1) ~= 0 && m_img(x+x1,y+y1) < curmin
                     curmin = m_img(x+x1,y+y1);
                end
            end
        end
        min_v = curmin;
        for x2 = -1 : 1 
            for y2 = -1 : 1 
               if m_img(x+x2,y+y2) ~= 0
                   c_img(x+x2,y+y2) = min_v;
               end
            end
        end
        end
    end
end

for i = 2 : max(max(c_img))
    if sum(c_img(:)==i) < t
        c_img(c_img==i) = 0;
    end
end
 c_img(c_img ~= 0) = 1;
% end
    



                