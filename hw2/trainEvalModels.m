function trainEvalModels()
    load toyGMM.mat
    
    %% MLE learning of model1, Gaussian Discriminative Analysis I
    % your code here
    % e.g. 
    % model1 = ...;
    % acc1 = ...;
    mu_1_1=mean(dataTe.x1);
   % pi_1=0.3;
    sigma_1_1=cov(dataTe.x1);
    %disp(size(sigma));
   
   
   mu_2_2=mean(dataTe.x2);
   % pi_2=0.4;
    sigma_2_2=cov(dataTe.x2);
    %disp(size(sigma));
   
   mu_3_3=mean(dataTe.x3);
   % pi_3=0.3;
    sigma_3_3=cov(dataTe.x3);
    
   
    %disp(size(sigma));
    N=[dataTe.x1;dataTe.x2;dataTe.x3];
%     m=size(N,2);
%     disp(m);
   % para{1}=50;
    para_2=[mu_1_1',mu_2_2',mu_3_3'];
   % disp(size(para{2}));
    s(:,:,1)=sigma_1_1;
    s(:,:,2)=sigma_2_2;
    s(:,:,3)=sigma_3_3;
    
    para_3=s;
    %para{3}=[1,1;1,1];
    para_4=[0.3;0.3;0.4];
%     disp(length(varargin));
%     disp(size(varargin{3}));
    %[mu,sigma,prob,labels] = emclustering(N,3,varargin);
    [mu_1,sigma_1,prob_1,label_1] = em(N,3,para_2,para_3,para_4);
     model1.pi(1)=prob_1(1);
   % disp(size(model1));
   model1.m1=mu_1(:,1)';
   model1.S1=sigma_1(:,:,1);
   %disp(mu(:,1));
   
   model1.pi(2)=prob_1(2);
   % disp(size(model1));
   model1.m2=mu_1(:,2)';
   model1.S2=sigma_1(:,:,2);
   
   model1.pi(3)=prob_1(3);
   % disp(size(model1));
   model1.m3=mu_1(:,3)';
   model1.S3=sigma_1(:,:,3);
   accurary_1=(sum(label_1(1:2500)==1)+sum(label_1(2501:5000)==2)+sum(label_1(5001:end)==3))/length(N);
   fprintf('parameters for model1\n');
   disp(prob_1);
   disp(model1.m1);
   disp(model1.m2);
   disp(model1.m3);
   disp(model1.S1);
   disp(model1.S2);
   disp(model1.S3);
   fprintf('accurary for model1\n');
   disp(accurary_1);
   
   
   
    % MLE learning of model2, Gaussian Discriminative Analysis II
    % your code here
   % mu_1_1=mean(dataTe.x1);
   mu_1_1=[1,1];
    %pi_1=0.3;
    %sigma_1=cov(dataTe.x1);
    %disp(size(sigma));
   
   
  % mu_2_2=mean(dataTe.x2);
  mu_2_2=[1,2];
   % pi_2=0.4;
   % sigma_2=cov(dataTe.x2);
    %disp(size(sigma));
   
  % mu_3_3=mean(dataTe.x3);
  mu_3_3=[2,2];
   % pi_3=0.3;
   % sigma_3=cov(dataTe.x3);
    
   
    %disp(size(sigma));
    N=[dataTe.x1;dataTe.x2;dataTe.x3];
   % para{1}=50;
    para_2=[mu_1_1',mu_2_2',mu_3_3'];
  %  disp(size(para{2}));
   
    para_3=[1,1;1,1];
    para_4=[0.2;0.2;0.5];

    %[mu,sigma,prob,labels] = emclustering(N,3,varargin);
    [mu_2,sigma_2,prob_2,label_2] = em(N,3,para_2,para_3,para_4);
   % disp(label_2');
    
   model2.pi(1)=prob_2(1);
   % disp(size(model1));
   model2.m1=mu_2(:,1)';
   model2.S1=sigma_2(:,:,1);
   %disp(sigma_1);
   
   model2.pi(2)=prob_2(2);
   % disp(size(model1));
   model2.m2=mu_2(:,2)';
   model2.S2=sigma_2(:,:,2);
   
   model2.pi(3)=prob_2(3);
   % disp(size(model1));
   model2.m3=mu_2(:,3)';
   model2.S3=sigma_2(:,:,3);
   accurary_2=(sum(label_2(1:2500)==3)+sum(label_2(2501:5000)==2)+sum(label_2(5001:end)==1))/length(N);
   fprintf('parameters for model2\n');
   disp(prob_2);
   disp(model2.m1);
   disp(model2.m2);
   disp(model2.m3);
   disp(model2.S1);
   disp(model2.S2);
   disp(model2.S3);
   fprintf('accurary for model2\n');
   disp(accurary_2);
   
    
    %% learning of model3, the MLR classifeir
    % your code here
    N=[dataTe.x1;dataTe.x2;dataTe.x3];
    n=size(N,1);
     Y(1:2500,1)=1;
     Y(2501:5000,1)=2;
     Y(5001:8750,1)=3;
    %disp(size(Y));
   [w,label_3]=multi_lr(N,Y);
   model3.w=w;
   accurary_3=(sum(label_3(1:2500)==1)+sum(label_3(2501:5000)==2)+sum(label_3(5001:end)==3))/length(N);
   fprintf('parameters for model3\n');
   disp(model3.w);
    fprintf('accurary for model3\n');
   disp(accurary_3);
  % disp(label_3);
    %% visualize and compare learned models
     plotBoarder(model1, model2, model3, dataTe)
