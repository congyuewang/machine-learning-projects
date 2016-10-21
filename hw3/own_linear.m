function accuracy=own_linear()
warning off;
[x_train,y_train,x_test,y_test]=processdata();
accus=crossvalidation(x_train,y_train);
disp(sprintf('the c,time,accuracy are ')); 
disp(accus);

[c, index] = max(accus);
C = accus(index(3), 1);
disp(sprintf('the best c is '));
disp(C);
[w, b] = trainsvm(x_train,y_train, C);

 accuracy=testsvm(x_test, y_test, w, b);
 disp(sprintf('the accuracy from the test data is '));
 disp(accuracy);

end