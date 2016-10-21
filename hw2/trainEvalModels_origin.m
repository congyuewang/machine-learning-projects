function trainEvalModels()
    load toyGMM.mat
    % model1 attributes include prior component probability, mean and covariance of three components:
%     model1.pi: [1x1 double]
%     model1.m1: [2x1 double]
%     model1.m2: [2x1 double]
%     model1.m3: [2x1 double]
%     model1.S1: [2x2 double]
%     model1.S2: [2x2 double]
%     model1.S3: [2x2 double]
    
    %% MLE learning of model1, Gaussian Discriminative Analysis I
    % your code here
    % e.g. 
    % model1 = ...;
    % acc1 = ...;
    % so here we basically train the pi mu covariance 
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
    n=size(N,1);

prob1 = zeros(n,3); 
respon_x=zeros(n,3);
converge=0;
%for i=1:50
prelike=1;
while converge~=1
prob1(:,1) = 1/sqrt(det(model1.S1))*exp(-0.5*sum(bsxfun(@minus, N, model1.m1)/(model1.S1).*bsxfun(@minus, N, model1.m1),2))*model1.pi(1);
prob1(:,2) = 1/sqrt(det(model1.S2))*exp(-0.5*sum(bsxfun(@minus, N, model1.m2)/(model1.S2).*bsxfun(@minus, N, model1.m2),2))*model1.pi(2);
prob1(:,3) = 1/sqrt(det(model1.S3))*exp(-0.5*sum(bsxfun(@minus, N, model1.m3)/(model1.S3).*bsxfun(@minus, N, model1.m3),2))*model1.pi(3);
respon = bsxfun(@rdivide, prob1, sum(prob1,2)); %responsibility for each sample
postlike=sum(log(sum(prob1,2)));
%disp(postlike);
%disp(size(respon));
Nk_1=sum(respon(:,1));
Nk_2=sum(respon(:,2));
Nk_3=sum(respon(:,3));
respon_x_1=bsxfun(@times,respon(:,1),N);
respon_x_2=bsxfun(@times,respon(:,2),N);
respon_x_3=bsxfun(@times,respon(:,2),N);
%disp(size(respon_x_1));
model1.m1=1/Nk_1*sum(respon_x_1);
model1.m2=1/Nk_2*sum(respon_x_2);
model1.m3=1/Nk_3*sum(respon_x_3);
%disp(size(model1.m1));
N_minus_mu1=bsxfun(@minus, N, model1.m1);
N_minus_mu2=bsxfun(@minus, N, model1.m2);
N_minus_mu3=bsxfun(@minus, N, model1.m3);
model1.S1=1/Nk_1*(bsxfun(@times,respon(:,1),N_minus_mu1))'*N_minus_mu1;
model1.S2=1/Nk_2*(bsxfun(@times,respon(:,2),N_minus_mu2))'*N_minus_mu2;
model1.S3=1/Nk_3*(bsxfun(@times,respon(:,3),N_minus_mu3))'*N_minus_mu3;
%disp(model1.S1);
model1.pi(1)=Nk_1/length(N);
model1.pi(2)=Nk_2/length(N);
model1.pi(3)=Nk_3/length(N);
%disp(model1.pi(1));
if abs(prelike-postlike)>0.1
    prelike=postlike;
else
    converge=1;
end

end
%disp(model1.pi(1));
%postlike=sum(log(sum(prob1,2))); 
%disp(postlike);
 %disp(N(2,:)) ; 
 %disp(model1.S1) ; 
 for i=1:length(N)
 k1=1/sqrt(det(model1.S1))*exp(-0.5*sum((N(i,:)-model1.m1)/(model1.S1).*(N(i,:)-model1.m1),2))*model1.pi(1);
 k2=1/sqrt(det(model1.S2))*exp(-0.5*sum((N(i,:)-model1.m2)/(model1.S2).*(N(i,:)-model1.m2),2))*model1.pi(2);
 k3=1/sqrt(det(model1.S3))*exp(-0.5*sum((N(i,:)-model1.m3)/(model1.S3).*(N(i,:)-model1.m3),2))*model1.pi(3);
 A=[k1,k2,k3];
 [M,I]=max(A);
 c(i)=I;
 end
 disp(c);
%     %% MLE learning of model2, Gaussian Discriminative Analysis II
%     % your code here
%     
%     mu_1=mean(dataTe.x1);
%     pi_1=0.3;
%     sigma_1=cov(dataTe.x1);
%     %disp(size(sigma));
%    
%    
%    mu_2=mean(dataTe.x2);
%     pi_2=0.4;
%     sigma_2=cov(dataTe.x2);
%     %disp(size(sigma));
%    
%    mu_3=mean(dataTe.x3);
%     pi_3=0.3;
%     sigma_3=cov(dataTe.x3);
%     
%     model1.pi(1)=pi_1;
%    % disp(size(model1));
%    model1.m1=mu_1;
%    model1.S1=sigma_1;
%    %disp(sigma_1);
%    
%    model1.pi(2)=pi_2;
%    % disp(size(model1));
%    model1.m2=mu_2;
%    model1.S2=sigma_1;
%    
%    model1.pi(3)=pi_3;
%    % disp(size(model1));
%    model1.m3=mu_3;
%    model1.S3=sigma_1;
%     %disp(size(sigma));
%     N=[dataTe.x1;dataTe.x2;dataTe.x3];
%     n=size(N,1);
% 
% prob1 = zeros(n,3); 
% respon_x=zeros(n,3);
% converge=0;
% %for i=1:50
% prelike=1;
% while converge~=1
% prob1(:,1) = 1/sqrt(det(model1.S1))*exp(-0.5*sum(bsxfun(@minus, N, model1.m1)/(model1.S1).*bsxfun(@minus, N, model1.m1),2))*model1.pi(1);
% prob1(:,2) = 1/sqrt(det(model1.S2))*exp(-0.5*sum(bsxfun(@minus, N, model1.m2)/(model1.S2).*bsxfun(@minus, N, model1.m2),2))*model1.pi(2);
% prob1(:,3) = 1/sqrt(det(model1.S3))*exp(-0.5*sum(bsxfun(@minus, N, model1.m3)/(model1.S3).*bsxfun(@minus, N, model1.m3),2))*model1.pi(3);
% respon = bsxfun(@rdivide, prob1, sum(prob1,2)); %responsibility for each sample
% postlike=sum(log(sum(prob1,2)));
% %disp(postlike);
% %disp(size(respon));
% Nk_1=sum(respon(:,1));
% Nk_2=sum(respon(:,2));
% Nk_3=sum(respon(:,3));
% respon_x_1=bsxfun(@times,respon(:,1),N);
% respon_x_2=bsxfun(@times,respon(:,2),N);
% respon_x_3=bsxfun(@times,respon(:,2),N);
% %disp(size(respon_x_1));
% model1.m1=1/Nk_1*sum(respon_x_1);
% model1.m2=1/Nk_2*sum(respon_x_2);
% model1.m3=1/Nk_3*sum(respon_x_3);
% %disp(size(model1.m1));
% N_minus_mu1=bsxfun(@minus, N, model1.m1);
% N_minus_mu2=bsxfun(@minus, N, model1.m2);
% N_minus_mu3=bsxfun(@minus, N, model1.m3);
% model1.S1=1/Nk_1*(bsxfun(@times,respon(:,1),N_minus_mu1))'*N_minus_mu1;
% model1.S2=1/Nk_2*(bsxfun(@times,respon(:,2),N_minus_mu2))'*N_minus_mu2;
% model1.S3=1/Nk_3*(bsxfun(@times,respon(:,3),N_minus_mu3))'*N_minus_mu3;
% %disp(model1.S1);
% model1.pi(1)=Nk_1/length(N);
% model1.pi(2)=Nk_2/length(N);
% model1.pi(3)=Nk_3/length(N);
% %disp(model1.pi(1));
% if abs(prelike-postlike)>0.1
%     prelike=postlike;
% else
%     converge=1;
% end
% 
% end
% %disp(model1.pi(1));
% %postlike=sum(log(sum(prob1,2))); 
% %disp(postlike);
%  %disp(N(2,:)) ; 
%  %disp(model1.S1) ; 
%  for i=1:length(N)
%  k1=1/sqrt(det(model1.S1))*exp(-0.5*sum((N(i,:)-model1.m1)/(model1.S1).*(N(i,:)-model1.m1),2));
%  k2=1/sqrt(det(model1.S2))*exp(-0.5*sum((N(i,:)-model1.m2)/(model1.S2).*(N(i,:)-model1.m2),2));
%  k3=1/sqrt(det(model1.S3))*exp(-0.5*sum((N(i,:)-model1.m3)/(model1.S3).*(N(i,:)-model1.m3),2));
%  A=[k1,k2,k3];
%  [M,I]=max(A);
%  c(i)=I;
%  end
%  %disp(c);
%     
%     %% learning of model3, the MLR classifeir
%     % your code here
%     
%     %% visualize and compare learned models
%     % plotboarder_1(model1, dataTe)
