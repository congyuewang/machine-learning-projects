function accuracy=testsvm(x,y,w,b)


   predictions = sign(x * w + b);
    accuracy = sum(predictions == y) / size(y, 1);


end