function k_image(X,k)

[A, map] = imread(X);
size_A = size(A);
size_map = size(map);

if (size_map(1)==0)
    image=A;
else
    
    image = ind2rgb(A, map);
    image = round(image .* 255);
end
r = image(:,:,1);
g = image(:,:,2);
b = image(:,:,3);
input_image = zeros((size_A(1) * size_A(2)), 3);
input_image(:,1) = r(:);
input_image(:,2) = g(:);
input_image(:,3) = b(:);
input_image = double(input_image);
[index, c] = kmeans(input_image, k, 'EmptyAction', 'singleton');
c = round(c);
index = uint8(index);
out_image = zeros(size_A(1),size_A(2),3);
re_image = reshape(index, [size_A(1) size_A(2)]);
for i = 1 : size_A(1)
    for j = 1 : size_A(2)
        out_image(i,j,:) = c(re_image(i,j),:);
    end
end
image_name = ['k_image', '_', int2str(k), '.jpg'];
imwrite(uint8(out_image), image_name);
end

