function classification()
load('x_train.mat')
load('x_test.mat')
load('y_train.mat')
load('y_test.mat')
X_train=x_train;
X_test=x_test;
Y_train=y_train;
Y_test=y_test;
X_test = bsxfun(@minus, X_test, mean(X_train));
%X_train = bsxfun(@minus, X_train, mean(X_train));
eigenvecs_train = get_sorted_eigenvecs(X_train);
eigenvecs_test = get_sorted_eigenvecs(X_test);

V_C_train_1=eigenvecs_train(:,1);
V_C_train_3=eigenvecs_train(:,1:3);
V_C_train_5=eigenvecs_train(:,1:5);
V_C_train_15=eigenvecs_train(:,1:15);
V_C_train_100=eigenvecs_train(:,1:100);

train_c_1=X_train*V_C_train_1;
train_c_3=X_train*V_C_train_3;
train_c_5=X_train*V_C_train_5;
train_c_15=X_train*V_C_train_15;
train_c_100=X_train*V_C_train_100;

V_C_train_1=eigenvecs_train(:,1);
V_C_train_3=eigenvecs_train(:,1:3);
V_C_train_5=eigenvecs_train(:,1:5);
V_C_train_15=eigenvecs_train(:,1:15);
V_C_train_100=eigenvecs_train(:,1:100);

train_c_1=X_train*V_C_train_1;
train_c_3=X_train*V_C_train_3;
train_c_5=X_train*V_C_train_5;
train_c_15=X_train*V_C_train_15;
train_c_100=X_train*V_C_train_100;


t_1=cputime;
tree_1 = fitctree(train_c_1,y_train,'SplitCriterion', 'deviance');
train_label_1 = predict(tree_1,train_c_1);
e_1=cputime-t_1;
disp('training time k=1')
disp(e_1);
disp('accurary for k=1')
disp(sum(y_train==train_label_1)/9298);

t_3=cputime;
tree_3 = fitctree(train_c_3,y_train,'SplitCriterion', 'deviance');
train_label_3 = predict(tree_3,train_c_3);
e_3=cputime-t_3;
disp('training time k=3')
disp(e_3);
disp('accurary for k=3')
disp(sum(y_train==train_label_3)/9298);

t_5=cputime;
tree_5 = fitctree(train_c_5,y_train,'SplitCriterion', 'deviance');
train_label_5 = predict(tree_5,train_c_5);
e_5=cputime-t_5;
disp('training time k=5')
disp(e_5);
disp('accurary for k=5')
disp(sum(y_train==train_label_5)/9298);

t_15=cputime;
tree_15 = fitctree(train_c_15,y_train,'SplitCriterion', 'deviance');
train_label_15 = predict(tree_15,train_c_15);
e_15=cputime-t_15;
disp('training time k=15')
disp(e_15);
disp('accurary for k=15')
disp(sum(y_train==train_label_15)/9298);

t_100=cputime;
tree_100 = fitctree(train_c_100,y_train,'SplitCriterion', 'deviance');
train_label_100 = predict(tree_100,train_c_100);
e_100=cputime-t_100;
disp('training time k=100')
disp(e_100);
disp('accurary for k=100')
disp(sum(y_train==train_label_100)/9298);

V_C_test_1=eigenvecs_test(:,1);
V_C_test_3=eigenvecs_test(:,1:3);
V_C_test_5=eigenvecs_test(:,1:5);
V_C_test_15=eigenvecs_test(:,1:15);
V_C_test_100=eigenvecs_test(:,1:100);

test_c_1=X_test*V_C_test_1;
test_c_3=X_test*V_C_test_3;
test_c_5=X_test*V_C_test_5;
test_c_15=X_test*V_C_test_15;
test_c_100=X_test*V_C_test_100;



t_test_1=cputime;
tree_test_1 = fitctree(test_c_1,y_test,'SplitCriterion', 'deviance');
test_label_1 = predict(tree_test_1,test_c_1);
e_test_1=cputime-t_test_1;
disp('test time for k=1')
disp(e_test_1);
disp('accurary for k=1')
disp(sum(y_test==test_label_1)/2200);

t_test_3=cputime;
tree_test_3 = fitctree(test_c_3,y_test,'SplitCriterion', 'deviance');
test_label_3 = predict(tree_test_3,test_c_3);
e_test_3=cputime-t_test_3;
disp('test time for k=3')
disp(e_test_3);
disp('accurary for k=3')
disp(sum(y_test==test_label_3)/2200);

t_test_5=cputime;
tree_test_5 = fitctree(test_c_5,y_test,'SplitCriterion', 'deviance');
test_label_5 = predict(tree_test_5,test_c_5);
e_test_5=cputime-t_test_5;
disp('test time for k=5')
disp(e_test_5);
disp('accurary for k=5')
disp(sum(y_test==test_label_5)/2200);

t_test_15=cputime;
tree_test_15 = fitctree(test_c_15,y_test,'SplitCriterion', 'deviance');
test_label_15 = predict(tree_test_15,test_c_15);
e_test_15=cputime-t_test_15;
disp('test time for k=15')
disp(e_test_15);
disp('accurary for k=15')
disp(sum(y_test==test_label_15)/2200);

t_test_100=cputime;
tree_test_100 = fitctree(test_c_100,y_test,'SplitCriterion', 'deviance');
test_label_100 = predict(tree_test_100,test_c_100);
e_test_100=cputime-t_test_100;
disp('test time for k=100')
disp(e_test_100);
disp('accurary for k=100')
disp(sum(y_test==test_label_100)/2200);

end
