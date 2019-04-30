function J = Otsu(img)%Otsu thresholding
k=graythresh(img);              
J=imbinarize(img,k);
j = connection_comp(J,9);
figure;
imshow(j);
end
