load hw4_circle.mat;
load hw4_blob.mat;
%disp(points);
[label_c_2,C_c_2] = kmeans(points,2,'Start','sample');
[label_c_3,C_c_3] = kmeans(points,3,'Start','sample');
[label_c_5,C_c_5] = kmeans(points,5,'Start','sample');
%disp(label);
plotClass(points',label_c_2' );
figure;
plotClass(points',label_c_3' );
figure;
plotClass(points',label_c_5' );
figure;
[label_b_2,b_2] = kmeans(data2,2,'Start','sample');
[label_b_3,b_3] = kmeans(data2,3,'Start','sample');
[label_b_5,b_5] = kmeans(data2,5,'Start','sample');
plotClass(data2',label_b_2' )
figure;
plotClass(data2',label_b_3' )
figure;
plotClass(data2',label_b_5' )
