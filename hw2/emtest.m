clc;
load toyGMM.mat
    mu_1=mean(dataTe.x1);
    pi_1=0.3;
    sigma_1=cov(dataTe.x1);
    %disp(size(sigma));
   
   
   mu_2=mean(dataTe.x2);
    pi_2=0.4;
    sigma_2=cov(dataTe.x2);
    %disp(size(sigma));
   
   mu_3=mean(dataTe.x3);
    pi_3=0.3;
    sigma_3=cov(dataTe.x3);
    
    model1.pi(1)=pi_1;
   % disp(size(model1));
   model1.m1=mu_1;
   model1.S1=sigma_1;
   %disp(sigma_1);
   
   model1.pi(2)=pi_2;
   % disp(size(model1));
   model1.m2=mu_2;
   model1.S2=sigma_2;
   
   model1.pi(3)=pi_3;
   % disp(size(model1));
   model1.m3=mu_3;
   model1.S3=sigma_3;
    %disp(size(sigma));
    N=[dataTe.x1;dataTe.x2;dataTe.x3];
    m=size(N,2);
    disp(m);
    para{1}=50;
    para{2}=[model1.m1',model1.m2',model1.m3'];
    disp(size(para{2}));
    s(:,:,1)=model1.S1;
    s(:,:,2)=model1.S2;
    s(:,:,3)=model1.S3;
    
    %varargin{3}=s;
    para{3}=[1,1;1,1];
    para{4}=0.333;
%     disp(length(varargin));
%     disp(size(varargin{3}));
    %[mu,sigma,prob,labels] = emclustering(N,3,varargin);
    [mu,sigma,prob,labels] = em(N,3,para);
    disp(labels');
    
    
    
    