function C = getF()
clear all;
close all;
ori = imread('training_face_image/train8.jpg');
%ori = imread('face2.jpg');
hsv_img = rgb2hsv(ori);
cluster_H = zeros(3,20);
cluster_S = zeros(3,20);
s = [1,501,1001,1501,2001,2501,3001,3501,4001,4501,5001,5501,6001,6501,7001,7501,8001,8501,9001,9501];
e = [500,1000,1500,2000,2500,3000,3500,4000,4500,5000,5500,6000,6500,7000,7500,8000,8500,9000,9500,10000];
mat = zeros(20,20);
[x,y,z] = size(hsv_img);
%che = 0;
for i = 1 : x
    for j = 1 : y
        pix_H = hsv_img(i,j,1)*10000;
        pix_S = hsv_img(i,j,2)*10000;
        che = 0;
        for i1 = 1 : 20
            if s(1,i1) <= pix_H && e(1,i1) >= pix_H
                for j1 = 1 : 20
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
bar3(mat);
maxR = max(max(mat));
[Cs,Ce] = find(mat == maxR);
Hc = [s(1,Cs),e(1,Cs)];
Sc = [s(1,Ce),e(1,Ce)];
C = [Hc,Sc];