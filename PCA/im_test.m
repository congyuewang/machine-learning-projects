function im_test()
load('x_train.mat')
I=x_train;

%imshow(double(reshape(X(9000,:), 16, 16)),[]);
eigenvecs = get_sorted_eigenvecs(I);
%disp(eigenvecs);
figure
subplot(2,4,1);
imshow(double(reshape(eigenvecs(:,1), 16, 16)),[]);
subplot(2,4,2);
imshow(double(reshape(eigenvecs(:,2), 16, 16)),[]);
subplot(2,4,3);
imshow(double(reshape(eigenvecs(:,3), 16, 16)),[]);
subplot(2,4,4);
imshow(double(reshape(eigenvecs(:,4), 16, 16)),[]);
subplot(2,4,5);
imshow(double(reshape(eigenvecs(:,5), 16, 16)),[]);
subplot(2,4,6);
imshow(double(reshape(eigenvecs(:,6), 16, 16)),[]);
subplot(2,4,7);
imshow(double(reshape(eigenvecs(:,7), 16, 16)),[]);
subplot(2,4,8);
imshow(double(reshape(eigenvecs(:,8), 16, 16)),[]);
end