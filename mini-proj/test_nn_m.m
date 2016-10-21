clc;
close all;
clear all;
M_test=csvread('test_data.csv',1);
%M_x=M(:,1:end-1);
%M_test_y=M_test(:,end);
%disp(M(1,:));
 M_test_mean=mean(M_test);
 %sd=std(M_test);
 %sd(sd==0)=1;
 M_test_n=bsxfun(@minus,M_test,M_test_mean);
 %M_test_n=bsxfun(@rdivide,M_test_n,sd);
% disp(M_n(1,:));
unipolarBipolarSelector = 0;
% mx=max(M_test);
% mn=min(M_test);
% mmd=mx-mn;
%disp(mmd==0);
% for i=1:size(M_test,1)
%     M_n(i,:)=((M_test(i,:)-mn+(mmd==0))./(mmd+(mmd==0)*2))*2-1; 
% end
%disp(Mn(1,:));
M_test_x=M_test_n(:,2:end);
n_test=size(M_test,1);
C_X_test=(M_test_x'*M_test_x)/n_test;


[V_test,D_test]=eig(C_X_test);

[D_test,idx]=sort(diag(D_test),'descend');
eigenvecs_test=V_test(:,idx);
eigenvecs_test=eigenvecs_test(:,1:10);
M_test_c=M_test_x*eigenvecs_test;
M_c_test_part=M_test_c(1:35000,:);


sample=M_c_test_part;
%disp(size(M_x));
[node_activation,Weight_train]=NN_training_weight_m();
%disp(size(Weight_train));
test_weight_1=Weight_train;
node_activation_1=node_activation;

%nbrOfNodesPerLayer(1:end-1) = nbrOfNodesPerLayer(1:end-1) + 1;
sample = [ones(length(sample(:,1)),1) sample];


for sample_row = 1:length(sample(:,1))
        nbrOfLayers = length(node_activation_1);

node_activation_1{1} = sample(sample_row,:);
for Layer = 2:nbrOfLayers
%     disp(size(node_activation_1{Layer-1}));
%     disp(size(test_weight_1{Layer-1}));
    node_activation_1{Layer} = node_activation_1{Layer-1}*test_weight_1{Layer-1};
    node_activation_1{Layer} = act_fun(node_activation_1{Layer});
    if (Layer ~= nbrOfLayers) %Because bias nodes don't have weights connected to previous layer
       node_activation_1{Layer}(1) = 1;
    end
end
outputs = node_activation_1{end};
        bound = 1/2;
        if (outputs(1) >= bound && outputs(2) < bound) %TODO: Not generic role for any number of output nodes
            ActualClasses(sample_row) = 1;
        elseif (outputs(1) < bound && outputs(2) >= bound)
            ActualClasses(sample_row) = 0;
        else
            if (outputs(1) >= outputs(2))
                ActualClasses(sample_row) = 1;
            else
                ActualClasses(sample_row) = 0;
            end
        end
end
fileID = fopen('test_m.txt','w');

fprintf(fileID,'%4.2f\n',ActualClasses);
fclose(fileID);
    