function [w,b]=trainsvm(x,y,c)
    [num_data,num_feature] = size(x);
    
    
    
    w = zeros(num_feature, 1);
    b = 0;
    
    
    para = [ w ; zeros(num_data,1) ; b ];
    f = c * [ zeros(num_feature, 1) ; ones(num_data, 1) ; 0 ];
    
    H = [ eye(num_feature) zeros(num_feature, num_data+1) ; zeros(num_data+1, num_feature+num_data+1) ];
    
    
    
    
    
    A = -[ bsxfun(@times, x, y) eye(num_data) y ];
    
    
    C_A = -1 * ones(num_data, 1);
    
   
    lb = [ -inf * ones(num_feature, 1) ; zeros(num_data, 1), ; -inf ];
    
    para = quadprog(H, f, A, C_A, [], [], lb, []);
    
    w = para(1:num_feature);
    b = para(num_data+num_feature+1);
end
%disp(alpha);
