function im_cons()
load('x_train.mat')
I=x_train;

%imshow(double(reshape(X(9000,:), 16, 16)),[]);
eigenvecs = get_sorted_eigenvecs(I);
%disp(eigenvecs);
V_C_100=eigenvecs(:,1:100);
V_C_1=eigenvecs(:,1);
V_C_3=eigenvecs(:,1:3);
V_C_5=eigenvecs(:,1:5);
V_C_15=eigenvecs(:,1:15);
I_c_r_100=I*V_C_100*V_C_100';
I_c_r_1=I*V_C_1*V_C_1';
I_c_r_3=I*V_C_3*V_C_3';
I_c_r_5=I*V_C_5*V_C_5';
I_c_r_15=I*V_C_15*V_C_15';

figure
subplot(2,3,1)
imshow(double(reshape(I(250,:), 16, 16)),[]);
subplot(2,3,2)
imshow(double(reshape(I_c_r_1(250,:), 16, 16)),[]);
subplot(2,3,3)
imshow(double(reshape(I_c_r_3(250,:), 16, 16)),[]);
subplot(2,3,4)
imshow(double(reshape(I_c_r_5(250,:), 16, 16)),[]);
subplot(2,3,5)
imshow(double(reshape(I_c_r_15(250,:), 16, 16)),[]);
subplot(2,3,6)
imshow(double(reshape(I_c_r_100(250,:), 16, 16)),[]);

figure
subplot(2,3,1)
imshow(double(reshape(I(300,:), 16, 16)),[]);
subplot(2,3,2)
imshow(double(reshape(I_c_r_1(300,:), 16, 16)),[]);
subplot(2,3,3)
imshow(double(reshape(I_c_r_3(300,:), 16, 16)),[]);
subplot(2,3,4)
imshow(double(reshape(I_c_r_5(300,:), 16, 16)),[]);
subplot(2,3,5)
imshow(double(reshape(I_c_r_15(300,:), 16, 16)),[]);
subplot(2,3,6)
imshow(double(reshape(I_c_r_100(300,:), 16, 16)),[]);
figure
subplot(2,3,1)
imshow(double(reshape(I(450,:), 16, 16)),[]);
subplot(2,3,2)
imshow(double(reshape(I_c_r_1(450,:), 16, 16)),[]);
subplot(2,3,3)
imshow(double(reshape(I_c_r_3(450,:), 16, 16)),[]);
subplot(2,3,4)
imshow(double(reshape(I_c_r_5(450,:), 16, 16)),[]);
subplot(2,3,5)
imshow(double(reshape(I_c_r_15(450,:), 16, 16)),[]);
subplot(2,3,6)
imshow(double(reshape(I_c_r_100(450,:), 16, 16)),[]);

figure
subplot(2,3,1)
imshow(double(reshape(I(500,:), 16, 16)),[]);
subplot(2,3,2)
imshow(double(reshape(I_c_r_1(500,:), 16, 16)),[]);
subplot(2,3,3)
imshow(double(reshape(I_c_r_3(500,:), 16, 16)),[]);
subplot(2,3,4)
imshow(double(reshape(I_c_r_5(500,:), 16, 16)),[]);
subplot(2,3,5)
imshow(double(reshape(I_c_r_15(500,:), 16, 16)),[]);
subplot(2,3,6)
imshow(double(reshape(I_c_r_100(500,:), 16, 16)),[]);

figure
subplot(2,3,1)
imshow(double(reshape(I(3000,:), 16, 16)),[]);
subplot(2,3,2)
imshow(double(reshape(I_c_r_1(3000,:), 16, 16)),[]);
subplot(2,3,3)
imshow(double(reshape(I_c_r_3(3000,:), 16, 16)),[]);
subplot(2,3,4)
imshow(double(reshape(I_c_r_5(3000,:), 16, 16)),[]);
subplot(2,3,5)
imshow(double(reshape(I_c_r_15(3000,:), 16, 16)),[]);
subplot(2,3,6)
imshow(double(reshape(I_c_r_100(3000,:), 16, 16)),[]);
end
