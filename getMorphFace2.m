function img = getMorphFace2(bImg)
%reduce noise using connection_comp
 img_conn_2 = connection_comp(bImg,300);
%  figure;
%  imshow(img_conn_2);
%erosion operation
 img2_2e = erosion(img_conn_2);
%  figure;
%  imshow(img2_2e);
%reduce noise
 img2_conn_2e = connection_comp(img2_2e,300);
%  figure;
%  imshow(img2_conn_2e);
%erosion operation
 img2_2ee = erosion(img2_conn_2e);
%  figure;
%  imshow(img2_2ee);
%erosion operation
 img2_conn_2ee = erosion(img2_2ee);
%  figure;
%  imshow(img2_conn_2ee);
%reduce noise
 img2_conn2 = connection_comp(img2_conn_2ee,350);
%  figure;
%  imshow(img2_conn2_2ee);
%dilation operation
 img = dilation(dilation(img2_conn2));