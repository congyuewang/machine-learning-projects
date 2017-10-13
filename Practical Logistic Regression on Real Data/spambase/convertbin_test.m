clc;
% load spambase.data;
% spambase = spambase(randperm(size(spambase,1)),:);
x=importdata('spamdata.txt');
disp(size(x));
y=x(1:length(x),end);
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
% p = convertBin(x,y);
%  disp([p{1} p{54}]);
% 
%         
%   bin1=0;
%   bin2=0;
%  % for i=1:10
%       u = unique(x(:,2));%u is in sorted order
%         [a,c] = hist(x(:,2),u);%If xbins is a vector of unevenly spaced values, then hist uses the midpoints between consecutive values as the bin edges.
%         %disp(u);
%         a = a(:);
%         %disp(a);
%         acum = cumsum(a);
%        % disp(acum);
%   for j=1:length(u)
%             if j==1
%                 bin1(j,1) = 1;
%                 bin2(j,1) = ceil(acum(j,1)/460);
%             else
%                 bin1(j,1) = ceil((acum(j-1,1)+1)/460);
%                 bin2(j,1) = ceil(acum(j)/460);
%             end 
%             if bin2(j,1)==11
%             bin2(j,1)=10;
%             end
%             
%   end
%  % end
%  
%             disp([ u  bin2]);
% %             bin_max=[u bin2];
% %             disp(size(bin_max));
%             begin=bin2(1);
%             ending=bin2(end);
%             max_num=0;
%             for i=begin:ending
%                 index_max=find(bin2(:)==i,1,'last');
%                 max_num(rem(i,begin)+1,1)=u(index_max,1);
%                 max_num(rem(i,begin)+1,2)=bin2(index_max,1);
%             end
%              disp(max_num);
             x_bin=0;
             for i=1:57
             [bin_index,probability]=setbin(x(:,i));
             x_bin(1:length(x),i)=bin_index;
             x_pro(1:length(x),i)=probability;
             
             end  
             disp(x_pro);
%              
%             
% u=0;
% a=0;
% acum=0;
% 
%   bin1=0;
%   bin2=0;
%  % for i=1:10
%       u = unique(x(:,1));%u is in sorted order
%         [a,c] = hist(x(:,1),u);%If xbins is a vector of unevenly spaced values, then hist uses the midpoints between consecutive values as the bin edges.
%         %disp(u);
%         a = a(:);
%         %disp(a);
%         acum = cumsum(a);
%        % disp(acum);
%   for j=1:length(u)
%             if j==1
%                 bin1(j,1) = 1;
%                 bin2(j,1) = ceil(acum(j,1)/460);
%             else
%                 bin1(j,1) = ceil((acum(j-1,1)+1)/460);
%                 bin2(j,1) = ceil(acum(j)/460);
%             end 
%             if bin2(j,1)==11
%             bin2(j,1)=10;
%             end
%             
%   end
%  % end
%  
%            % disp([ u  bin2]);
% %             bin_max=[u bin2];
% %             disp(size(bin_max));
%             begin=bin2(1);
%             ending=bin2(end);
%             max_num=0;
%             x_bin=0;
%             probability=0;
%             for r=begin:ending
%                 index_max=find(bin2(:)==r,1,'last');
%                 max_num(rem(r,begin)+1,1)=u(index_max,1);
%                 max_num(rem(r,begin)+1,2)=bin2(index_max,1);
%             end
%              disp(max_num);
%              for i=1:length(x(:,1))
%                  if x(i,1)<=max_num(1,1)
%                      bin_index(i,1)=max_num(1,2);
%                      
%                  end
%                  for j=2:length(max_num)
%                 if x(i,1)<=max_num(j,1) && x(i,1)>max_num(j-1,1)
%                     bin_index(i,1)=max_num(j,2);
%                 end
%                 
%                  end
%                  if x(i,1)==0
%                  probability(i,1)=bin_index(i,1)/10;
%                  else
%                  probability(i,1)=1/10;
%                  end
%              end
%              disp(size(probability));
             
            
            
        
        
        
        