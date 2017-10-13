function [w,label]=multi_lr(X,Y)
    
    
   
    %disp(size(Y));
    B = mnrfit(X,Y);
    p = mnrval(B,X);
   % disp(pihat);
   for i=1:length(X)
      A=[p(i,1),p(i,2),p(i,3)];
     [M,I]=max(A);
     label(i,1)=I;
   end
  % disp(c);
  b_inv=B';
w=[b_inv(1,2),b_inv(1,3),b_inv(1,1);b_inv(2,2),b_inv(2,3),b_inv(2,1);0,0,0];
%disp(w)