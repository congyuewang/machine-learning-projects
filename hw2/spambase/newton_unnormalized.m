clc;

% load spambase.data;
% x=spambase(:,1);
% %disp(x);
% sizedata=size(spambase);
x=importdata('spamdata.txt');
%disp(x);
sizedata=size(x,1);
%disp(sizedata(1));
x_1=x(1:int64(sizedata(1)/2),1:end-1);
%disp(sizedata(1));
%x_1=spambase(1:int64(sizedata(1)/2),1:end-1);
x_1_size=size(x_1);
%disp(x_1_size);
x_2=x(int64(sizedata(1)/2):end,1:end-1);
x_2_size=size(x_2);
%disp(x_2_size);
x_1_y=x(1:size(x_1,1),end);
disp(size(x_1_y));
x_2_y=x_2(:,end);
%disp(size(x_2_y));
b=0.1;
dim=size(x_1,2);
w_1=zeros(size(x_1,2),1);
w=[b;w_1];
disp(size(w));

%g=sigmoid(x_1_1*w);
%x_1_y=ones-x_1_y;
%M=eye(dim+1);
%M(1,1)=0;
%lambda=0.05;
eta=0.001;
for i=1:40;

hypothesis = sigmoid(x_1_1*w);     
crossEntropy = -(x_1_y.*log(hypothesis) + (1-x_1_y).*log(1-hypothesis));
crossEntropy = sum(crossEntropy);
    
grad = x_1_1'* (hypothesis-x_1_y);
Hessian = x_1_1' * diag(hypothesis) * diag(1-hypothesis) * x_1_1;

w = w - Hessian\grad;
%disp(w);

end
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


%disp([probability,x_1_y]);