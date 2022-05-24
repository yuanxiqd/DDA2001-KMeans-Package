function [IDX, C, DistMatrix] = dda2001kmeans(X, k, start, options)
% Script: KMeans clustering method for DDA2001
% Formula: [IDX, C] = mykmeans(X, k, start, options)
% Input:
%       X: m by n, design matrix with m data points, each of which has n
%       features
%       k: scalar, number of clusters
%   start: k by n, center cluster matrix with k cluster centers
% options:
%       tol: scalar, tolerance
%   maxiter: scalar, maximum of iterations
%
% Output:
%        IDX: m by 1, stationary cluster assignment
%          C: k by n, stationary cluster centers
% DistMatrix: cell, distance matrix between points and iterative centers
%
% Example:
%       X = [2, 3; 3, 1; 4, 2; 12, 6; 7, 5];
%       start = [X(3, :); X(5, :)];
%       options.maxiter = 5; options.tol = 1e-4;
%       [IDX, C] = mykmeans(X, 2, start);
%
% Author: Dong Qiao
% Email: dongqiao@link.cuhk.edu.cn
% 
disp(' ');
disp('Implementing KMeans clustering...');
disp(' ');

if ~isfield(options, 'maxiter')
    options.maxiter = 5;
end

if ~isfield(options, 'tol')
    options.tol = 1e-4;
end

m = size(X, 1);
IDX = zeros(m, 1);
C = start;

iter = 1;
while iter < options.maxiter
    Cp = C;
    disp(['iter ', num2str(iter), ':',]);
    disp('------------------------------');
    disp('Cluster Assignment:');
    disp(IDX');
    disp('Cluster Centers:');
    disp(C);
    disp('------------------------------');
    disp(' ');

    % Cluster Assignment
    DistMatrix{iter, 1} = getDistMatrix(X, C, m, k, options.distflag);
    [~, IDX] = min(DistMatrix{iter, 1}, [], 2);
    
    % Center Adjustment
    for i= 1:k
        mask = IDX == i;
        C(i, :) = sum(X(mask, :), 1)/sum(mask);
    end
    

    % check tolerance
    if sum(sum(((C - Cp).^2), 2)) < options.tol
        disp('Converged!');
        break;
    end

    iter = iter + 1;
end

end

function dist = getDistMatrix(X, C, m, k, distflag)
% Subfunction: distance matrix, each element d_{i,j} represents the
% distance between point X_i and cluster center c_j
% Call: dist = DistMatrix(X, C, m, k)
%
% Input:
%       X: m by n, design matrix with m data points, each of which has n
%       features
%       C: k by n, center cluster matrix with k cluster centers
%       m: scalar, number of points
%       k: scalar, number of clusters
% Output:
%    dist: m by k, distance matrix
%
% Author: Dong Qiao
% Email: dongqiao@link.cuhk.edu.cn
%

dist = zeros(m, k);
for i = 1:m
    switch distflag
        case 'L1'
            dist(i, :) = sum(abs(X(i, :) - C), 2);
        case 'L2'
            dist(i, :) = sqrt(sum((X(i, :) - C).^2, 2));
        case 'inf'
            dist(i, :) = max(abs(X(i, :) - C), [], 2);
    end
end

end