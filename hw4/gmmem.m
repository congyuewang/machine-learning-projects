
% this one is to get parameter from training data
function  [obj]=gmmem(X, cluster)

[observation, dimension ] = size(X);
min_x = min(min(X));
max_x = max(max(X));
mu = min_x + (max_x - min_x) * rand(cluster, dimension);

Sigma = zeros(dimension, dimension, cluster);
for i=1:dimension
    for j=1:dimension
        for k=1:cluster
            if (i==j)
                
                Sigma(i,j,k) = var(X(:,i));
            end
        end
    end
end
                
sigma_noise=[rand(1),0;0,rand(1)];
                   
for k=1:cluster
Sigma(:,:,k) = Sigma(:,:,k) + sigma_noise;
 end
prop = ones(1,cluster) * 1/cluster;


    disp('initial mu');
    disp(mu);
    disp('initial sigma');
    disp(Sigma);
    disp('inital prior probs');
    disp(prop);
%EM
old_likelihood = 0;
for n=1:observation
    log_k_lp = zeros(1, cluster);
    for k=1:cluster
        log_k_lp(k) = log( mvnpdf(X(n,:), mu(k,:), Sigma(:,:,k)) );
        log_k_lp(k) = log_k_lp(k) + log( prop(1, k) );
    end
   
    log_sum_k_lp = logsumexp(log_k_lp,2);
    
    old_likelihood = old_likelihood + log_sum_k_lp;
end

    disp('initial log likelihood is:');
    disp(old_likelihood);
iter = 1;
while ( true )
log_lp = zeros(observation, cluster); 
log_prop_x = zeros(observation, cluster);

for n=1:observation
    for k=1:cluster
        log_lp(n,k) = log( mvnpdf(X(n,:), mu(k,:), Sigma(:,:,k)) );
        log_lp(n,k) = log_lp(n,k) + log(prop(1, k) );
    end
end

log_sum_lp = logsumexp(log_lp,2);

for n=1:observation
    for k=1:cluster
        log_prop_x(n, k) = log_lp(n,k) - log_sum_lp(n);       
    end
end


log_Nk = logsumexp(log_prop_x, 1);


for k=1:cluster
    for d=1:dimension
        mu_indi = 0;
        for n=1:observation
           mu_indi = mu_indi + exp( log_prop_x(n,k) - log_Nk(k) ) * X(n,d); 
        end
        mu(k,d) = mu_indi;
    end
end

for k=1:cluster
    sig_indi = 0;
    for n=1:observation
        
        sig_indi = sig_indi + exp(log_prop_x(n,k) - log_Nk(k)) * (X(n,:)-mu(k,:))'*(X(n,:)-mu(k,:)); 
    end
    Sigma(:,:,k) = sig_indi;
end

for k=1:cluster
    prop(k) = exp(log_Nk(k)) / observation;
end

    
new_likelihood = 0;
for n=1:observation
    log_k_lp = zeros(1, cluster);
    for k=1:cluster
        log_k_lp(k) = log( mvnpdf(X(n,:), mu(k,:), Sigma(:,:,k)) );
        log_k_lp(k) = log_k_lp(k) + log( prop(1, k) );
    end
    
    log_sum_k_lp = logsumexp(log_k_lp,2);
    
    new_likelihood = new_likelihood + log_sum_k_lp;
end
diff = new_likelihood - old_likelihood;

if ( (diff >= 0 && diff < 1e-8 * abs(new_likelihood) ) )
    disp('final iteration is');
    disp(iter);
    disp('final likelihood is:');
    disp(new_likelihood);
    disp('difference');
    disp(diff);
    break;
else
    iter = iter + 1;
end


old_likelihood = new_likelihood;
end % end of while loop



    disp('my gmm:');
    disp('my mu');
    disp(mu);
    disp('my Sigma');
    disp(Sigma);
    disp('my prop');
    disp(prop);
   
%obj = gmdistribution(mu, Sigma, prop);
obj.mu=mu;
obj.Sigma=Sigma;
obj.prop=prop;

end



