function C = getFaceModel(ori)
%%
% s,start range of teh cluster set, there are ten cluster set in total,from
% 0,0.1,0.2 ... 1 
% e, end range of the cluster set.
% mat, sluster set
% 
%%
hsv_img = rgb2hsv(ori);
%cluster set, 0 ~ 1, here multiple with 10000 for better observe
s = [1,1001,2001,3001,4001,5001,6001,7001,8001,9001];
e = [1000,2000,3000,4000,5000,6000,7000,8000,9000,10000];

mat = zeros(length(s),length(e));
[x,y,z] = size(hsv_img);
%che = 0;
for i = 1 : x
    for j = 1 : y
        pix_H = hsv_img(i,j,1)*10000;
        pix_S = hsv_img(i,j,2)*10000;
        che = 0;
        for i1 = 1 : length(s)
            if s(1,i1) <= pix_H && e(1,i1) >= pix_H
                for j1 = 1 : length(e)
                    if s(1,j1) <= pix_S && e(1,j1) >= pix_S
                        mat(i1,j1) = mat(i1,j1) + 1;
                        che = 1;
                    end
                end
            end
            if che == 1
                break;
            end
        end
    end
end
figure;
bar3(mat);
%%
%find the highest two cluster set to be the out put as teh HSV cluster set.
maxR = max(max(mat));% highest value in the cluster, here is try to find teh cluster set that the most pixel dropped in, which represent teh face cluster set
[Cs,Ce] = find(mat == maxR);
mat(Cs,Ce) = 0;
[Cs2,Ce2] = find(mat == max(max(mat)));
Hc = [s(1,Cs),e(1,Cs)];
Sc = [s(1,Ce),e(1,Ce)];
Hc1 = [s(1,Cs2),e(1,Cs2)];
Sc1 = [s(1,Ce2),e(1,Ce2)];
C = [Hc,Sc;Hc1,Sc1];
end