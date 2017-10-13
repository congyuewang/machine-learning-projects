function [accuracy,b]=glmit_unnormalized()

% load spambase.data;
% x=spambase(:,1);
x=importdata('spamdata.txt');
%disp(x);
sizedata=size(x,1);
%disp(sizedata(1));
x_1=x(1:int64(sizedata(1)/2),1:end-1);
%x_1=spambase(1:10,1:end-1);
x_1_size=size(x_1);
%disp(x_1);
x_2=x(int64(sizedata(1)/2):end,1:end-1);
x_2_size=size(x_2);
%disp(x_2_size);
x_1_y=x(1:size(x_1,1),end);
%disp(x_1_y);
x_2_y=x_2(:,end);

%disp(size(x_2_y));
%b=0;
%dim=size(x_1,2);
% w_1=zeros(size(x_1,2),1);
% w=[b;w_1];
% disp(size(w));

% disp(size(x_1));
% mX = mean(x_1); 
% mX(1) = 0; 
% sX = std(x_1); 
% %sX(1) = 1; 
% x_new = bsxfun(@rdivide, bsxfun(@minus, x_1, mX), sX);
% 
% %x_1_1=[ones(size(x_new,1),1),x_new];
x_1_1=x_1;

disp(size(x_1_1));
%disp(x_1_1)
%g=sigmoid(x_1_1*w);
%x_1_y=ones-x_1_y;
%M=eye(dim+1);
%M(1,1)=0;
%lambda=0.05;



[b,dev,stats] = glmfit(x_1_1,x_1_y,'binomial','link','logit');
%disp(b);
x_1_1=[ones(size(x_1_1,1),1),x_1_1];

probability=1.0./(1.0+exp(-x_1_1*b));
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

