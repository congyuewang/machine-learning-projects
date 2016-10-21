function [x_train,y_train,x_test,y_test]=processdata()
train='diabetic_train.mat';
test='diabetic_test.mat';
    train = load(train);
    test = load( test);
    
    x_train=(train.x-min(train.x(:)))./(max(train.x(:))-min(train.x(:)));
    x_test=(test.x-min(test.x(:)))./(max(test.x(:))-min(test.x(:)));
   
   train.y(find(train.y==0)) = -1;
   test.y(find(test.y==0)) = -1;
   y_train=train.y;
   y_test=test.y;

end