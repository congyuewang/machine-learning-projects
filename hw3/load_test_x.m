clc;
load diabetic_test.mat;
%xload=diabetic_test;
 pretest_x=x;
 pretest_y=y;
% fid = fopen('spamdata.txt','w');
% x = repmat('%5.4f\t',1,19);
% fprintf(fid,[x,'%d\n'],spambase');
% fclose(fid) ;
% %x_1=fopen('spamdata.txt');
% A=importdata('spamdata.txt');
disp(size(x));
pretest_x=(pretest_x-min(pretest_x(:)))./(max(pretest_x(:))-min(pretest_x(:)));
max(pretest_x(:));
min(pretest_x(:));
disp(y);