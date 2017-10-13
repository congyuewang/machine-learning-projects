clc;
load spambase.data;
spambase = spambase(randperm(size(spambase,1)),:);
x=spambase(:,1);
%disp(x);
sizedata=size(spambase);
%disp(sizedata(1));
x_1=spambase(1:int64(sizedata(1)/2),1:end-1);
%x_1=spambase(1:10,1:end-1);
x_1_size=size(x_1);
%disp(x_1);
x_2=spambase(int64(sizedata(1)/2):end,1:end-1);
x_2_size=size(x_2);
%disp(x_2_size);
x_1_y=spambase(1:size(x_1,1),end);
%disp(x_1_y);
x_2_y=x_2(:,end);

sortvals = sort(x_1(:,3));
disp([sortvals,x_1_y]);
binwidth = floor(length(sortvals)/10);
cellwidths = binwidth*ones(1,10);
%distribute leftovers evenly in interior
leftover = length(sortvals) - binwidth*10;
leftovers_at = floor(linspace(0,11,leftover+2));   %not linspace(1,10) !!
leftovers_at = leftovers_at(2:end-1);   %trim 0, 11
cellwidths(leftovers_at) = cellwidths(leftovers_at) + 1;
%bincontents = cell2mat(sortvals(:), cellwidths, 1);

%disp(size(x_2_y));
% b=0;
% %dim=size(x_1,2);
% w_1=zeros(size(x_1,2),1);
% w=[b;w_1];
%disp(size(w));

% disp(size(x_1));
% mycdf=cumsum(x_1);
% mycdf = bsxfun(@rdivide,mycdf,mycdf(end,:));
% %plot(mycdf);
% % disp(size(mycdf));
% % disp([x_1(:,30),mycdf(:,30)]);
% binstouse=round(length(x_1)/10);
% edges(1,:) = 1; % Location of first bin.
% %i=1;
% %disp(size(x_1,2));
% for  i=1:size(x_1,2)
%     X=x_1(:,i);
% for b = 1 : 9
% 	% Find out bin that will give CDFs of 10%, 20%, 30%,...100%
% 	endingBin = find(mycdf(:,i) < b*0.1, 1, 'last');
% 	edges(b+1,i) = endingBin;
% 	% Sum those bins to form new histogram
%     %disp(endingBin);
%     
% 	newHist(b,i) = sum(X(edges(b,i):edges(b+1,i)));
% end
% newHist(10,i)=sum(X(edges(9,i) + 1:end));
% %disp(newHist(1:10));
% %disp(edges(1:10));
% end
% edges(11,:)=length(x_1);
% disp(edges);