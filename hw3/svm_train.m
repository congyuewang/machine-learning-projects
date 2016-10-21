clc;
 %load diabetic_test.mat;

% pre_y = y(:);
% pre_y(find(pre_y==0)) = -1;
% % [px] = process_data(x);
% % max(px(:))
% % min(px(:))
% %disp(pre_y);
% pre_x=x;
% pre_x=(pre_x-min(pre_x(:)))./(max(pre_x(:))-min(pre_x(:)));
% max(pre_x(:));
% min(pre_x(:));
% c=4;
 
[x_train,y_train,x_test,y_test]=processdata();
M = distance(x_train,x_train);
disp(size(M));
 [dist, d] = distMetric(x_train', x_train', M);
 disp(d);
% C = [ 4^-6 ; 4^-5 ; 4^-4 ; 4^-3 ; 4^-2 ; 4^-1 ; 4^0 ; 4^1 ; 4^2 ];
% accus = [];
% %disp(size(y_train));
% 
% for i = 1:size(C, 1)
%     %opts = sprintf('-v 5 -c %f -q', C(i));
%     opts = '-v 5 -c %f -q';
%     t = cputime;
%     model = svmtrain(x_train, y_train,'options',opts);
%     e = cputime-t;
%     accus = [ accus ; C(i) model e ];
% end
% 
% disp(' ');
% disp('5 fold cross validation for Linear LibSVM')
% disp('======================================');
% for i = 1:size(C, 1)
%     disp(sprintf('%0.6f & %0.6f & %0.6f \\\\', accus(i, 1), accus(i, 3), accus(i, 2)));
%     disp('\hline');
% end
% [a, max_ind] = max(accus);
% bestC = accus(max_ind(2), 1);
% 
% opts = sprintf('-c %f -q', C(i));
% model = svmtrain(x_train, y_train, opts);
% [predicted, test_accu, decision_values] = ...
%     svmpredict(x_test, y_test, model);
% disp(sprintf('Best C = %.4f', bestC));
% accus=crossvalidation(x_train,y_train);
%  [a, max_ind] = max(accus);
% bestC = accus(max_ind(3), 1);
% [w, b] = trainsvm(x_train, y_train, bestC);
% disp(' ');
% disp(sprintf('Best: C = %.4f | Test Accuracy = %.8f', bestC, ...
%           testsvm(x_test, y_test, w, b)));
% a=testsvm(x_test, y_test, w, b);
% disp(a);
% accuracy=own_linear();
% disp(accuracy);
% index=crossvalind('Kfold', size(y, 1), 3);
% val=(index==1);
% disp(val);
% [w,b]=svmtrain(pre_x,pre_y,c);
% accuracy=svmtest(pre_x,pre_y,w,b);
% disp(accuracy);
% [w_1,b_1] = trainsvm(pre_x, pre_y, c);
% accu = testsvm(pre_x, pre_y, w_1, b_1);
%  disp(accu);
% H =(pre_y*pre_y').*(pre_x*pre_x');
% H = H + 1e-5*(size(H,1));
% %disp(size(H));
% %num_data=length(H);
% %disp(num_data);
% %vectorC = ones(num_data,1);
% %vectorC =inf;
% %vectorC = 1./(2*vectorC);
%  % H = H + diag(vectorC);
% 
% f=-ones(1,num_data);
% %a=zeros(1,num_data);
% beq=0;
% aeq=y';
% 
% lb=zeros(num_data,1);
% ub=0.004*ones(num_data,1);
% alpha=quadprog(H,f,[],[],aeq,beq,lb,ub);
% %disp(alpha);
% 
