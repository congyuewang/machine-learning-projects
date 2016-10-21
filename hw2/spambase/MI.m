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
% w=[b;w_1];
%disp(size(w));

disp(size(x_1));
mycdf=cumsum(x_1);
mycdf = bsxfun(@rdivide,mycdf,mycdf(end,:));
%plot(mycdf);
% disp(size(mycdf));
% disp([x_1(:,30),mycdf(:,30)]);
binstouse=round(length(x_1)/10);
edges(1,:) = 1; % Location of first bin.
%i=1;
%disp(size(x_1,2));
for  i=1:size(x_1,2)
    X=x_1(:,i);
for b = 1 : 9
	% Find out bin that will give CDFs of 10%, 20%, 30%,...100%
	endingBin = find(mycdf(:,i) < b*0.1, 1, 'last');
	edges(b+1,i) = endingBin;
	% Sum those bins to form new histogram
    %disp(endingBin);
    
	newHist(b,i) = sum(X(edges(b,i):edges(b+1,i)));
end
newHist(10,i)=sum(X(edges(9,i) + 1:end));
%disp(newHist(1:10));
%disp(edges(1:10));
end
edges(11,:)=length(x_1);
%disp(newHist);
%probability of each bin
disp(edges)

probability=diff(edges);
probability=bsxfun(@rdivide,probability,edges(end,:));
%probability(find(probability==0))=0.001;
%disp(find(probability));
% probability=bsxfun(@rdivide,newHist,sum(newHist(1:end,:)));
 disp(probability);
x_mutual=x_1;
% disp(size(x_mutual));
% 
edges_mu=edges;
disp(size(edges_mu));
edges_mu(1,:)=0;
%edges(1,:)=0;
for i=1:10
%x_mutual(edges(i,:)+1:edges(i+1))=1;
   % disp([size(x_mutual(edges(i,:)+1:edges(i+1))),size(repmat(probability(i,:),edges(i+1,1)-edges(i,1),1))]);
x_mutual(edges_mu(i,1)+1:edges_mu(i+1),:)=repmat(probability(i,:),edges_mu(i+1,1)-edges_mu(i,1),1);
end
%disp(x_mutual(1,:));
%disp([x_mutual(:,1),x_1_y]);
%disp(x_mutual(1));

%conditional probability ready go!


edges_con=edges;
edges_con(1,:)=0;
%con_pro=diff(edges);
%disp(edges_con);
num_1=sum(x_1_y);
num_0=length(x_1_y)-num_1;

for c=1:57
    for r_e=1:10
        num_1_in=sum(x_1_y(edges_con(r_e,c)+1:edges_con(r_e+1,c)));
        con_pro_1=num_1_in/num_1;
        
        num_0_in=(edges_con(r_e+1,c)-edges_con(r_e,c));
        con_pro_0=num_0_in/num_0;
        for r=edges_con(r_e,c)+1:edges_con(r_e+1,c)
            
            if x_1_y(r)==1
            con_pro(r,c)= con_pro_1;
            else
            con_pro(r,c)= con_pro_0;  
            end
                
                
            
        end
        
            
            
            
            
    end
    

end
%disp(con_pro(:,3));
%joint probability ready go!
pro_y_1=num_1/length(x_1_y);
pro_y_0=num_0/length(x_1_y);
for r_y=1:length(x_1_y)
    if x_1_y(r_y)==1
       pro_y(r_y)=pro_y_1;
    else
        pro_y(r_y)=pro_y_0;
        
    end
end
%disp(pro_y);
% P(X=x,Y=y)=P(Y=y)*P(X=x|Y=y)

for c_c=1:57
    for c_r=1:length(x_1_y)
        joint_pro(c_r,c_c)=pro_y(c_r)*con_pro(c_r,c_c);
    end
 
end
%disp(joint_pro(:,3));
%mutual information ready go!
indi_px_py=diag(pro_y)*x_mutual;
disp(size(indi_px_py));
I_x_y=joint_pro.*log(joint_pro./indi_px_py);
I_x_y=sum(I_x_y);
[sort_I,index]=sort(I_x_y,'descend');
disp(index(1:20));



%pearson coefficient ready go!
for p_i=1:size(x_1,2)
C=cov(x_1(:,p_i),x_1_y);
pearson(p_i)=C(2)/(std(x_1(:,p_i))*std(x_1_y));
end
%disp(pearson);

new_index=index(1:20);
for i=1:20
new_data(:,i)=x_1(:,new_index(i));
end

mX = mean(new_data); 
%mX(1) = 0; 
sX = std(new_data); 
%sX(1) = 1; 
new_data_norm = bsxfun(@rdivide, bsxfun(@minus, new_data, mX), sX);
[w,dev,stats] = glmfit(new_data_norm,x_1_y,'binomial','link','logit');
disp(size(b));
new_data_norm=[ones(size(new_data_norm,1),1),new_data_norm];


%disp([1.0./(1.0+exp(-new_data_norm*w)),x_1_y]);







 
 


