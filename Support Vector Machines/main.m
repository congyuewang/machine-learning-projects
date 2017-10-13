function main()
disp(sprintf('this is the result from own_linear '));
own_linear();
addpath(genpath('..\hw3\libsvm-3.21\matlab'));
cd '..\hw3\libsvm-3.21\matlab'
disp(sprintf('this is the result from linear_libsvm which is compared to own_linear '));
linear_libsvm();
disp(sprintf('this is the result from libsvm including the two kernels '));
libsvm(); 

