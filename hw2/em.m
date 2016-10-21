function [mu,sigma,prob,labels] = em(data,k,para_2,para_3,para_4)
  
   n = size(data,1);
   
   m = size(data,2);
   
   %num_iter = para{1};
%     mu = 0;
%     mu = varargin{2};


   
   
       mu = para_2;
    
   
  
     
 
   if length(para_3) > 2 && ndims(para_3) == 3
     
       sigma = para_3;
       
     
     else
       sigma = repmat(diag(var(data))*((1/k)^2),[1 1 k]);
    
   end
   
     prob = para_4;
   
   it = 0;
   converged = 1;
   p = zeros(n,k);
 
   while (it < 50) && converged
  
     it = it + 1;

     pre_p = p;
     
    
     for i = 1:k
            
           
         inv_sigma = inv(sigma(:,:,i));
	 
      
	     d_sigma = det(sigma(:,:,i));
       
       
       diff = bsxfun(@minus, data, mu(:,i)');
      

       p(:,i) =(1/sqrt(d_sigma))*exp(-0.5*(sum((diff*inv_sigma).*diff,2)))*prob(i);
     end
     
     
     nf = sum(p,2);
     nf2 = nf;
     p = p./repmat(nf2,1,k);
  
     
     for i = 1:k
       prob(i) = mean(p(:,i));
       mu(:,i) = (sum(repmat(p(:,i),1,m).*data)/(n*prob(i)))';
       diff = bsxfun(@minus, data, mu(:,i)');
       sigma(:,:,i) = (repmat(p(:,i),1,m).*diff)'*diff/(n*prob(i));
     end
     converge = sum(sum(abs(p - pre_p)))/(n*k); 
     converged = converge > 0.001;
     
   end
   for i = 1:k
     inv_sigma = inv(sigma(:,:,i));
     d_sigma = det(sigma(:,:,i));
       
     diff = bsxfun(@minus, data, mu(:,i)');
     p(:,i) =(1/sqrt(d_sigma))*exp(-0.5*(sum((diff*inv_sigma).*diff,2)))*prob(i);
   end
   
   nf = sum(p,2);
   p = p./repmat(nf,1,k);
   [tmp labels] = max(p,[],2);
   