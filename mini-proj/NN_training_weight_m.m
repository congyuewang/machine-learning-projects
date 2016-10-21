
function [node_activation,Weight_train]=NN_training_weight_m()
%% parameter

nodes_per_hidden_layer = [10 10];
output_unit = 2;
selector = 0; 
learning_rate = 1;
max_num_run = 10;

resilient_gradient_descent = 1; %1 for enable,0 for disable
learning_rate_positive = 1;
learning_rate_negative = 0.5;
delta_s = 0.9;
delta_min = 10^-6;
delta_max = 5;

decrease_learning_rate = 0; %1 for enable,0 for disable
decrease_learning = 0.05;
min_learning_rate =0.5;



%% load data

% M=csvread('train_data.csv',2);
% %M_x=M(:,1:end-1);
% M_y=M(:,end);
% %disp(M(1,:));
%  M_mean=mean(M);
%  sd=std(M);
%  sd(sd==0)=1;
%  M_nn=bsxfun(@minus,M,M_mean);
%  M_nn=bsxfun(@rdivide,M_nn,sd);
% % disp(M_n(1,:));
% % mx=max(M);
% % mn=min(M);
% % mmd=mx-mn;
% % %disp(mmd==0);
% % for i=1:size(M,1)
% %     Mn(i,:)=((M(i,:)-mn+(mmd==0))./(mmd+(mmd==0)*2))*2-1; 
% % end
% %disp(Mn(1,:));
% M_x=M_nn(:,2:end-1);
%disp(size(M_x));
M=csvread('train_data.csv',1);
M_y=M(:,end);
M_x=M(:,2:end-1);
M_mean=mean(M_x);
M_n=bsxfun(@minus,M_x,M_mean);
n=size(M_x,1);
C_X=(M_n'*M_n)/n;
[V,D]=eig(C_X);

[D,idx]=sort(diag(D),'descend');
eigenvecs=V(:,idx);
eigenvecs=eigenvecs(:,1:10);
M_c=M_x*eigenvecs;
M_c_part=M_c(1:35000,:);

%M_x=M(:,1:end-1);
% M_y=M(:,end);
% i=1;
% for in=1:length(M_y)
%     if(M_y(in)==1)
%         M_less(i,:)=M_c(in,2:end);
%         i=i+1;
%     end
% end
% disp(size(M_less,1));
% 
% [M_sort,idx] = sort(M_y, 'descend');
% 
% for i=1:4*size(M_less,1)
%     M_reset(i,:)=M_c(idx(i),2:end);
% end
% M_reset = M_reset(randperm(size(M_reset,1)),:);
% M_reset_x=M_reset(:,1:end-1);
%  M_mean=mean(M_reset_x);
%  sd=std(M_reset_x);
%  sd(sd==0)=1;
% M_x=bsxfun(@minus,M_reset_x,M_mean);
% M_x=bsxfun(@rdivide,M_reset_x,sd);
%importedData = importdata(dataFileName, '\t', 6);
%disp(size(M_x))\

%% initialize

Input = M_c_part;
Target =M_y(1:length(M_c_part));
Target = Target - min(Target);
Output = -1*ones(size(Target));


input_nodes = length(Input(1,:)); 


num_layers = 2 + length(nodes_per_hidden_layer);
num_node_per_layer = [input_nodes nodes_per_hidden_layer output_unit];


num_node_per_layer(1:end-1) = num_node_per_layer(1:end-1) + 1;
Input = [ones(length(Input(:,1)),1) Input];


target_outputs = zeros(length(Target), output_unit);
for i=1:length(Target)
    if (Target(i) == 1)
        target_outputs(i,:) = [1 selector];
    else
        target_outputs(i,:) = [selector 1];
    end
end


weight_feature = cell(1, num_layers); 
delta_weight = cell(1, num_layers);
resilient_deltas = delta_weight; 
for i = 1:length(weight_feature)-1
    weight_feature{i} = rand(num_node_per_layer(i), num_node_per_layer(i+1)); 
    weight_feature{i}(:,1) = 0; 
    delta_weight{i} = zeros(num_node_per_layer(i), num_node_per_layer(i+1));
    resilient_deltas{i} = delta_s*ones(num_node_per_layer(i), num_node_per_layer(i+1));
end
weight_feature{end} = ones(num_node_per_layer(end), 1);

old_delta_weight = delta_weight;

node_activations = cell(1, num_layers);
for i = 1:length(node_activations)
    node_activations{i} = zeros(1, num_node_per_layer(i));
end
Errors = node_activations; 

MSE_zero = 0;
num_inter_done = 0;


MSE = -1 * ones(1,max_num_run);

%% interaction

for inter = 1:max_num_run
    
    for row = 1:length(Input(:,1))
 
        
        node_activations{1} = Input(row,:);
        for Layer = 2:num_layers
            node_activations{Layer} = node_activations{Layer-1}*weight_feature{Layer-1};
            node_activations{Layer} = act_fun(node_activations{Layer});
            if (Layer ~= num_layers) 
                node_activations{Layer}(1) = 1;
            end
        end
        
        
        Errors{num_layers} =(target_outputs(row,:)-node_activations{num_layers});
        for Layer = num_layers-1:-1:1
            gradient = act_fun_diff(node_activations{Layer+1});
            for node=1:length(Errors{Layer})
                Errors{Layer}(node) =  sum( Errors{Layer+1} .* gradient .* weight_feature{Layer}(node,:) );
            end
        end
        
        
        for Layer = num_layers:-1:2
            derivative = act_fun_diff(node_activations{Layer});    
            delta_weight{Layer-1} = delta_weight{Layer-1} + node_activations{Layer-1}' * (Errors{Layer} .* derivative);
        end
    end
    

    if (resilient_gradient_descent==1) 
        if (mod(inter,20000)==0) 
            for Layer = 1:num_layers
                resilient_deltas{Layer} = learning_rate*delta_weight{Layer};
            end
        end
        for Layer = 1:num_layers-1
            change_sign = old_delta_weight{Layer} .* delta_weight{Layer};
            resilient_deltas{Layer}(change_sign > 0) = resilient_deltas{Layer}(change_sign > 0) * learning_rate_positive; 
            resilient_deltas{Layer}(change_sign < 0) = resilient_deltas{Layer}(change_sign < 0) * learning_rate_negative; 
            resilient_deltas{Layer} = max(delta_min, resilient_deltas{Layer});
            resilient_deltas{Layer} = min(delta_max, resilient_deltas{Layer});

            old_delta_weight{Layer} = delta_weight{Layer};

            delta_weight{Layer} = sign(delta_weight{Layer}) .* resilient_deltas{Layer};
        end
    end
   
    if (resilient_gradient_descent==0)
        for Layer = 1:num_layers
            delta_weight{Layer} = learning_rate * delta_weight{Layer};
        end
    end

    for Layer = 1:num_layers-1
        weight_feature{Layer} = weight_feature{Layer} + delta_weight{Layer};
    end
    

    for Layer = 1:length(delta_weight)
        delta_weight{Layer} = 0 * delta_weight{Layer};
    end


    if (decrease_learning_rate==1)
        new_learning_rate = learning_rate - decrease_learning;
        learning_rate = max(min_learning_rate, new_learning_rate);
    end

    for row = 1:length(Input(:,1))
        res = evaluate_nn(Input(row,:), node_activations, weight_feature);
        bound = 1/2;
        if (res(1) >= bound && res(2) < bound) 
            Output(row) = 1;
        elseif (res(1) < bound && res(2) >= bound)
            Output(row) = 0;
        else
            if (res(1) >= res(2))
                Output(row) = 1;
            else
                Output(row) = 0;
            end
        end
    end
    
    MSE(inter) = sum((Output-Target).^2)/(length(Input(:,1)));
    if (MSE(inter) == 0)
        MSE_zero = 1;
    end
  
    
        
  
    display([int2str(inter) ' interaction from ' int2str(max_num_run) ' interaction. MSE = ' num2str(MSE(inter)) ' Learning Rate = ' ...
        num2str(learning_rate) '.']);
    
    num_inter_done = inter;
    if (MSE_zero)
        
        break;
    end
    
end
display(['Mean Square Error = ' num2str(MSE(num_inter_done)) '.']);
accuracy=sum(Output==Target)/length(Input(:,1));
display(['Accuracy: ' num2str(accuracy)]);
Weight_train=weight_feature;
node_activation=node_activations;
end
