function main()
% 4.1

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

%4.2 
% dear TA/grader: as intialization is random, it may get some error  and the result has
% been print out. It may take long to run so it may be more convient to
% check data in hw4.doc and also check the matlab code. 
load emGMM.mat;


for i=1:5
  fprintf('the NO. %d  model.\n',i);  
 obj(i)=gmmem(dataTr,3);
end
for i=1:5
  fprintf('the NO. %d  model for holdout data.\n',i);  
 obj_val(i)=mggmmemval(dataVal, obj(i));
end

for i=6:10
  fprintf('the NO. %d  model.\n',i);  
 obj(i)=gmmem(dataTr,5);
end
for i=6:10
  fprintf('the NO. %d  model for holdout data.\n',i);  
 obj_val(i)=mggmmemval(dataVal, obj(i));
end

for i=11:15
  fprintf('the NO. %d  model.\n',i);  
 obj(i)=mggmmemfit(dataTr,7);
end

for i=11:15
  fprintf('the NO. %d  model for holdout data.\n',i);  
 obj_val(i)=mggmmemval(dataVal, obj(i));
end

 for i=16:20
  fprintf('the NO. %d  model.\n',i);  
 obj(i)=mggmmemfit(dataTr,9);
 end
 
 for i=16:20
  fprintf('the NO. %d  model for holdout data.\n',i);  
 obj_val(i)=mggmmemval(dataVal, obj(i));
end
 
for i=21:25
  fprintf('the NO. %d  model.\n',i);  
 obj(i)=mggmmemfit(dataTr,11);
end
for i=21:25
  fprintf('the NO. %d  model for holdout data.\n',i);  
 obj_val(i)=mggmmemval(dataVal, obj(i));
end
 

%4.3
k_image('hw4.jpg',8);
k_image('hw4.jpg',4);
k_image('hw4.jpg',24);
end