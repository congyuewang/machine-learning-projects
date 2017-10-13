clc;
% load spambase.data;
% spambase = spambase(randperm(size(spambase,1)),:);
x=importdata('spamdata.txt');
disp(size(x));
sizedata=size(x);
%disp(sizedata(1));
x_1=x(1:int64(sizedata(1)/2),1:end-1);
%x_1=spambase(1:10,1:end-1);
x_1_size=size(x_1);
disp(x_1_size);
x_2=x(int64(sizedata(1)/2):end,1:end-1);
x_2_size=size(x_2);
%disp(x_2_size);
x_1_y=x(1:size(x_1,1),end);
%disp(x_1_y);
x_2_y=x_2(:,end);

%disp(size(x_2_y));
% b=0;
% %dim=size(x_1,2);
% w_1=zeros(size(x_1,2),1);
x_sort=sort(x_1);
disp(x_sort(:,1))
for i=1:57
    a=find(x_sort(:,i)==0, 1, 'last');
    disp(a);
    
end