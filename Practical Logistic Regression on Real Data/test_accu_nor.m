function [accuracy]=test_accu_nor(w)
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
x_2_y=x(int64(sizedata(1)/2):end,end);
x_2_2=[ones(size(x_2,1),1),x_2];

mX = mean(x_2); 
%mX(1) = 0; 
sX = std(x_2); 
%sX(1) = 1; 
x_new = bsxfun(@rdivide, bsxfun(@minus, x_2, mX), sX);

x_2_2=[ones(size(x_new,1),1),x_new];

probability=1.0./(1.0+exp(-x_2_2*w));
accuracy=0;
for i=1:length(x_2_2)
if probability(i)>=0.5
    probability(i)=1;
else
    probability(i)=0;
end
if probability(i)==x_2_y(i)
    accuracy=accuracy+1;
end
end
accuracy=accuracy/length(x_2_2);


disp(accuracy);

end