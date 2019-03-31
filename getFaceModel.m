function [model,model2] = getFaceModel()
clear all;
close all;
ori = imread('training_face_image/train11.jpg');
%ori = imread('face2.jpg');
hsv_img = rgb2hsv(ori);
H = hsv_img(:,:,1);
S = hsv_img(:,:,2);
arr = zeros(3,10000);
for t = 1 : 10000
    arr(1,t) = t;
end
[r,c] = size(H);
for i = 1 : r
    for j = 1 : c
        if(H(i,j) == 0)
            arr(2,1) = arr(2,1) + 1;
        else
            arr(2,uint16(10000*H(i,j))) = arr(2,uint16(10000*H(i,j))) + 1;
        end
        if(S(i,j) == 0)
            arr(3,1) = arr(3,1) + 1;
        else
            arr(3,uint16(10000*S(i,j))) = arr(3,uint16(10000*S(i,j))) + 1;
        end
    end
end
x = arr(1,:);
y = arr(2,:);
z = arr(3,:);
figure;
subplot(1,2,1);
plot(x,y);
title('H-domain');
subplot(1,2,2);
plot(x,z);
title('S-domain');
arr2 = zeros(2,10000);
arr2(1,:) = arr(1,:);
arr2(2,:) = arr(3,:);
arr(3,:) = [];
  for k1 = 1 : 10000
      indac = 0;
      for k2 = 1 : 9999
          if arr(2,k2) < arr(2,k2+1)
              indx2 = arr(2,k2);
              arr(2,k2) = arr(2,k2+1);
              arr(2,k2+1) = indx2;
              % = 1;
              indx1 = arr(1,k2);
              arr(1,k2) = arr(1,k2+1);
              arr(1,k2+1) = indx1;
              indac = 1;
          end
      end
      if indac == 0
          break
      end
  end
  H_domain = [];
  for q = 1 : 10000
      if(arr(2,q)<500)
          break;
      end
      if isempty(H_domain)
          H_domain = [H_domain,arr(1,q)];
      else
          H_domain = [H_domain,arr(1,q)];
          for q2 = length(H_domain) : -1 : 2
              if H_domain(1,q2-1) > H_domain(1,q2)
                  mei = H_domain(1,q2-1);
                  H_domain(1,q2-1) = H_domain(1,q2);
                  H_domain(1,q2) = mei;
              else
                  break;
              end
          end
      end
  end
  
  for l1 = 1 : 10000
      indac = 0;
      for l2 = 1 : 9999
          if arr2(2,l2) < arr2(2,l2+1)
              indx2 = arr2(2,l2);
              arr2(2,l2) = arr2(2,l2+1);
              arr2(2,l2+1) = indx2;
              % = 1;
              indx1 = arr2(1,l2);
              arr2(1,l2) = arr2(1,l2+1);
              arr2(1,l2+1) = indx1;
              indac = 1;
          end
      end
      if indac == 0
          break
      end
  end
  S_domain = [];
  for q = 1 : 10000
      if(arr2(2,q)<30)
          break;
      end
      if isempty(S_domain)
          S_domain = [S_domain,arr2(1,q)];
      else
          S_domain = [S_domain,arr2(1,q)];
          for q2 = length(S_domain) : -1 : 2
              if S_domain(1,q2-1) > S_domain(1,q2)
                  mei = S_domain(1,q2-1);
                  S_domain(1,q2-1) = S_domain(1,q2);
                  S_domain(1,q2) = mei;
              else
                  break;
              end
          end
      end
  end
  model = H_domain/10000;
  model2 = S_domain/10000;
 