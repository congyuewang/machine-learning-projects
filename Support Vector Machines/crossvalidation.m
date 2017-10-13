function accu_total=crossvalidation(x,y)

c = [ 4^-6 ; 4^-5 ; 4^-4 ; 4^-3 ; 4^-2 ; 4^-1 ; 4^0 ; 4^1 ; 4^2 ];
accu_total=[];

for c_n = 1:length(c)
    
    index=crossvalind('Kfold', size(y, 1), 3);
    accu_cross=[];
    time_cross=[];
    
    for i = 1:3
        test = (index == i); train = ~test;
        % ADD time measurements
        begin = cputime;
        [w, b] = trainsvm(x(train, :), y(train, :), c(c_n));
        end_time = cputime-begin;
        accuracy = testsvm(x(test, :), y(test, :), w, b); 
        accu_cross = [ accu_cross ; accuracy ];
        time_cross = [ time_cross ; end_time ];
    end
    accu_total = [ accu_total ; c(c_n) mean(time_cross) mean(accu_cross) ];
end




end