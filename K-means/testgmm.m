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
 
