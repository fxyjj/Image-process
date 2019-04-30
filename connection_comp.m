function m_img = connection_comp(I,t)%receive only binarized image
%%
% this function aims to reduce the noise pixels in the binarized image 
% firstly, find the white pixels and use numbers to mark them, the mark
% strategy is, use the same number to mark the pixels in Adjacency.
% m_img is the processed image used as the output
%r, row of the origin image
%c, column of the origin image
%%
[r,c] = size(I);
m_img = zeros(r,c);
char = 2;
%mark the white region with numbers
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
% calculate pixels of each region and translate the timy region into
% background if their size is less than a certain range t.
for x = 2 : r-1
    for y = 2 : c-1
       cen = m_img(x,y);
       if cen ~= 0
           arr = [m_img(x-1,y),m_img(x+1,y),m_img(x,y-1),m_img(x,y+1)];
           for check = 1 : 4
               if arr(1,check) ~= 0 && arr(1,check) ~= cen
                   if arr(1,check) < cen
                       m_img(m_img == arr(1,check)) = cen;
                   else
                       m_img(m_img == cen) = arr(1,check);
                   end
               end
           end
       end        
    end
end

for i = 2 : max(max(m_img))
    if sum(m_img(:)==i) < t
        m_img(m_img==i) = 0;
    end
end
m_img(m_img ~= 0) = 1;
end
    



                