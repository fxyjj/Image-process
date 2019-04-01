function img = G_Filter(sig,sizef)
g_filter = zeros(sizef,sizef);
offset = (sizef + 1)/2;
sigma = sig;
g_coeff = 1/(pi*2*sigma*sigma);
for i = 1 : sizef
    for j = 1 : sizef
        g_filter(i,j) = g_coeff*exp(-((i-offset)^2+(j-offset)^2)/(2*sigma*sigma));
    end
end
val_sum = sum(sum(g_filter));
g_filter = g_filter/val_sum;
img = g_filter;
end

