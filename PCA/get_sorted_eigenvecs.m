function [eigenvecs] = get_sorted_eigenvecs(I)
% input:
%   X - N*D data matrix, each row as a data sample
%       You must assume that the data samples are not zero-mean, thus you need to perform 
%       data transformation on X to make sure that the samples have zero-mean (PCA algorithm assumption),
%       before performing eigenvalue-eigenvector decomposition.
%       You may use MATLAB built-in function 'eig' to perform eigenvalue-eigenvector decomposition.
% output:
%   eigenvecs: D*D matrix, normalized eigenvectors (with length=1) sorted based on its eigenvalue magnitude, 
%              with d-th column corresponds to eigenvector with the d-th biggest eigenvalue
%              (e.g. 1st column corresponds to eigenvector with the biggest eigenvalue,
%               2nd column corresponds to eigenvector with 2nd biggest eigenvalue, etc.)
%
% CSCI 567 2016 Spring, Homework 5
% (put your code here...)
D=0;
n = size(I, 1);
I = bsxfun(@minus, I, mean(I));
%disp(size(I));
C_X = (I' * I) / n;
%disp(size(C_X));
[V, D] = eig(C_X);
%disp(size(V));

    [D,idx] = sort(diag(D), 'descend');
    eigenvecs = V(:, idx);
    
    
eigen_norm = max(eigenvecs) - min(eigenvecs);               % this is a vector
eigen_norm = repmat(eigen_norm, [length(eigenvecs) 1]);  % this makes it a matrix
                                       % of the same size as A
eigenvecs = eigenvecs./eigen_norm;  % your normalized matrix
end
