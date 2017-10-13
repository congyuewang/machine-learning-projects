function [mutual_x , pearson]=mutual_info()
clc;
% load spambase.data;
% spambase = spambase(randperm(size(spambase,1)),:);
x_all=importdata('spamdata.txt');
y=x_all(1:length(x_all),end);
x=x_all(1:length(x_all),1:end-1);
bin_all = convertBin(x,y);
%disp(bin_all{1});
             x_bin=0;
             x_pro=0;
             for i=1:57
             [bin_index,probability]=setbin(x(:,i));
             x_bin(1:length(x),i)=bin_index;
             x_pro(1:length(x),i)=probability;
            % disp(x_pro);
             end  
             %disp(x_bin);
  %here we need joint probability
num_1=sum(y);
num_0=length(y)-num_1;
pro_y_1=num_1/length(y);
pro_y_0=num_0/length(y);
for r_y=1:length(y)
    if y(r_y)==1
       pro_y(r_y)=pro_y_1;
    else
        pro_y(r_y)=pro_y_0;
        
    end
end
for i=1:57
all(1:10,i)=bin_all{i}(:,1)+bin_all{i}(:,2);
con_pro{i}(:,1)=bsxfun(@rdivide,bin_all{i}(:,1),all(:,i));
con_pro{i}(:,2)=bsxfun(@rdivide,bin_all{i}(:,2),all(:,i));
end

joint_pro=0;
s=0;
for i=1:57
    for j=1:length(x)
        if x(j,i)~=0
            if y(j)==0
                joint_pro(j,i)=x_pro(j,i)*con_pro{i}(x_bin(j,i),1);
            else
               joint_pro(j,i)=x_pro(j,i)*con_pro{i}(x_bin(j,i),2); 
            end
        else %x(j,i)=0
            if y(j)==0
               % for s=1:x_bin(j,i)
                
                joint_pro(j,i)=(1/10)*sum(con_pro{i}(1:x_bin(j,i),1));
               % end
             else
                % for s=1:x_bin(j,i)
                    % disp(s);
                joint_pro(j,i)=(1/10)*sum(con_pro{i}(1:x_bin(j,i),2));
                % end
             end
          end
            
        end
       
end
mutual_x=0;
  %  disp(joint_pro);
  % mutual information
  for i=1:57
      for j=1:length(x)
          mutual_x(j,i)=joint_pro(j,i)*log(joint_pro(j,i)/(x_pro(j,i)*pro_y(j)));
      end
  end
  mutual_x=sum(mutual_x);
  [sort_mutual,index]=sort(mutual_x,'descend');
  %disp(sort_mutual);
  %pearson information
  for p_i=1:size(x,2)
C=cov(x(:,p_i),y);
pearson(p_i)=C(2)/(std(x(:,p_i))*std(y));
  end
 % disp(pearson);
 X_1=1:57;
 Y_1=mutual_x;
 X_2=1:57;
 Y_2=pearson;
 
 figure
 subplot(1,2,1);
 plot(X_1,Y_1)
 title('feature ID vs mutual information ')
 xlabel('feature ID')
 ylabel('mutual information')
 
 subplot(1,2,2);
 plot(X_2,Y_2)
 title('feature ID vs pearson coefficient ')
 xlabel('feature ID')
 ylabel('pearson coefficient')
 
 


  



             
