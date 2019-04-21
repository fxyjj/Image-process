function C = getFaceModel(ori)
% clear all;
% close all;
% ori = imread(fileURL);
%ori = imread('face2.jpg');
hsv_img = rgb2hsv(ori);
% cluster_H = zeros(3,20);
% cluster_S = zeros(3,20);
% s = [1,501,1001,1501,2001,2501,3001,3501,4001,4501,5001,5501,6001,6501,7001,7501,8001,8501,9001,9501];
% e = [500,1000,1500,2000,2500,3000,3500,4000,4500,5000,5500,6000,6500,7000,7500,8000,8500,9000,9500,10000];
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

maxR = max(max(mat));
[Cs,Ce] = find(mat == maxR);
mat(Cs,Ce) = 0;
[Cs2,Ce2] = find(mat == max(max(mat)));
Hc = [s(1,Cs),e(1,Cs)];
Sc = [s(1,Ce),e(1,Ce)];
Hc1 = [s(1,Cs2),e(1,Cs2)];
Sc1 = [s(1,Ce2),e(1,Ce2)];
C = [Hc,Sc;Hc1,Sc1];