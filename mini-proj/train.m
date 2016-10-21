clc;
M=csvread('train_data.csv',2);
M_x=M(:,1:end-1);
M_y=M(:,end);
%disp(size(M_x));
% M_mean=mean(M);
% sd=std(M);
% sd(sd==0)=1;
% M_n=bsxfun(@minus,M,M_mean);
% M_n=bsxfun(@rdivide,M_n,sd);
% disp(M_n(1,:));
mx=max(M);
mn=min(M);
mmd=mx-mn;

%disp(size(mmd));
for i=1:size(M,1)
    M_n(i,:)=((M(i,:)-mn+(mmd==0))./(mmd+(mmd==0)*2))*2-1; 
end
disp(M_n(1,:));
