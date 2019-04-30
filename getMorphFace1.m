function img = getMorphFace1(bImg)
%reduce image noise using connection_comp.m
img_conn = connection_comp(bImg,15);
%dilation operations
img2d = dilation(img_conn);
%reduce teh noise again
img2d_conn = connection_comp(img2d,40);
%erosion operation
img2e = erosion(img2d_conn);
%reduce noise
img2e_conn = connection_comp(img2e,80);
%erosoin operation
img2ee = erosion(img2e_conn);
%reduce noise
img2ee_conn = connection_comp(img2ee,12);
%dilation operation
img22d = dilation(dilation(dilation(dilation(img2ee_conn))));
%reduce noise
img = connection_comp(img22d,400);
end