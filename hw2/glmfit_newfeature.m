function [accuracy,w]=glmfit_newfeature()
x=importdata('spamdata.txt');
w=0;
x_1_1=0;
x_1_y=0;
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
[mutual_x , pearson]=mutual_info();
[sort_mutual,index]=sort(mutual_x,'descend');
new_index=index(1:20);
disp(new_index);
for i=1:20
new_data(:,i)=x_1(:,new_index(i));
end

mX = mean(new_data); 
%mX(1) = 0; 
sX = std(new_data); 
%sX(1) = 1; 
new_data_norm = bsxfun(@rdivide, bsxfun(@minus, new_data, mX), sX);
[w,dev,stats] = glmfit(new_data_norm,x_1_y,'binomial','link','logit');
%disp(size(b));
x_1_1=[ones(size(new_data_norm,1),1),new_data_norm];
probability=1.0./(1.0+exp(-x_1_1*w));
accuracy=0;
for i=1:length(x_1_1)
if probability(i)>=0.5
    probability(i)=1;
else
    probability(i)=0;
end
if probability(i)==x_1_y(i)
    accuracy=accuracy+1;
end
end
accuracy=accuracy/length(x_1_1);


disp(accuracy);






