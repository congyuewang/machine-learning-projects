function [bin_index, probability]=setbin(x)
u=0;
a=0;
acum=0;

  bin1=0;
  bin2=0;
 % for i=1:10
      u = unique(x);%u is in sorted order
        [a,c] = hist(x,u);%If xbins is a vector of unevenly spaced values, then hist uses the midpoints between consecutive values as the bin edges.
        %disp(u);
        a = a(:);
        %disp(a);
        acum = cumsum(a);
        %disp(acum);
  for j=1:length(u)
            if j==1
                bin1(j,1) = 1;
                bin2(j,1) = ceil(acum(j,1)/460);
            else
                bin1(j,1) = ceil((acum(j-1,1)+1)/460);
                bin2(j,1) = ceil(acum(j)/460);
            end 
            if bin2(j,1)==11
            bin2(j,1)=10;
            end
            
  end
 % end
 
           % disp([ u  bin2]);
            %bin_max=[u bin2];
%             disp(size(bin_max));
            begin=bin2(1);
            ending=bin2(end);
            max_num=0;
            x_bin=0;
            probability=0;
            for r=begin:ending
                index_max=find(bin2(:)==r,1,'last');
                max_num(r-begin+1,1)=u(index_max,1);
                max_num(r-begin+1,2)=bin2(index_max,1);
            end
            % disp(max_num);
             for i=1:length(x)
                 if x(i)<=max_num(1,1) || length(max_num)==1
                     bin_index(i,1)=max_num(1,2);
                     
                 else
                 for j=2:length(max_num)
                if x(i)<=max_num(j,1) && x(i)>max_num(j-1,1)
                    bin_index(i,1)=max_num(j,2);
                end
                end
                
                 end
                 if x(i)==0
                 probability(i,1)=bin_index(i,1)/10;
                 else
                 probability(i,1)=1/10;
                 end
             end
             