function img = getMorphFace2(bImg)
 img_conn_2 = connection_comp(bImg,300);
%  figure;
%  imshow(img_conn_2);
 img2_2e = erosion(img_conn_2);
%  figure;
%  imshow(img2_2e);
 img2_conn_2e = connection_comp(img2_2e,300);
%  figure;
%  imshow(img2_conn_2e);
 img2_2ee = erosion(img2_conn_2e);
%  figure;
%  imshow(img2_2ee);
 img2_conn_2ee = erosion(img2_2ee);
%  figure;
%  imshow(img2_conn_2ee);
 img2_conn2 = connection_comp(img2_conn_2ee,350);
%  figure;
%  imshow(img2_conn2_2ee);
 img = dilation(dilation(img2_conn2));