function main
[accuracy_2 , w_2 ]=logistic_regression_normalized();
fprintf('accuracy for training normalized logistic regression %f\n',accuracy_2);
[accuracy_w_2]=test_accu_nor(w_2);
fprintf('accuracy for testing normalized logistic regression %f\n',accuracy_w_2);
[accuracy_1 , w_1 ]=logistic_regression_unnormalized();
fprintf('accuracy for training unnormalized logistic regression %f\n',accuracy_1);
[accuracy_w_1]=test_accu(w_1);
fprintf('accuracy for testing unnormalized logistic regression %f\n',accuracy_w_1);
[accuracy_3,w_3]=newton_unnormalized();
fprintf('accuracy for training unnormalized newton %f\n',accuracy_3);
[accuracy_w_3]=test_accu(w_3);
fprintf('accuracy for testing unnormalized newton %f\n',accuracy_w_3);
[accuracy_4,w_4]=newton_normalized();
fprintf('accuracy for training normalized newton %f\n',accuracy_4);
[accuracy_w_4]=test_accu_nor(w_4);
fprintf('accuracy for testing normalized newton %f\n',accuracy_w_4);
[accuracy_5,b_1]=glmit_unnormalized();
fprintf('accuracy for training unnormalized glmit %f\n',accuracy_5);
[accuracy_b_1]=test_accu(b_1);
fprintf('accuracy for testing unnormalized glmfit %f\n',accuracy_b_1);
[accuracy_6,b_2]=glmfit_normalized();
fprintf('accuracy for training normalized glmit %f\n',accuracy_6);
[accuracy_b_2]=test_accu_nor(b_2);
fprintf('accuracy for testing normalized glmfit %f\n',accuracy_b_2);
[accuracy_new,w_new]=glmfit_newfeature();
fprintf('accuracy for new training normalized glmit %f\n',accuracy_new);
trainEvalModels()


end