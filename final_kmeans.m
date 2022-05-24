clear;clc;close all;
% ****** Final Exam ******
% Declaration: This script is just for dda2001.
% Author: Dong Qiao
% Email: dongqiao@link.cuhk.edu.cn

disp('****** Let us first give some settings...');
% Step 1: Please input design matrix X with m rows (points) and n cols (features)
X = input('Step 1: Please input design matrix X with m rows (points) and n cols (features): \n X = ');
if isempty(X)
    disp('[Warning 1]: X needs to be input!');
    return;
end
% Example 1: [2, 3; 3, 1; 4, 2; 11, 5; 12, 4; 12, 6; 7, 5; 8, 4; 8, 6]
% Example 2: [2, 3; 3, 1; 4, 2; 12, 6; 7, 5]

% Step 2: Please input the number of clusters
k = input('Step 2: Please input the number of clusters: \n k = ');
if isempty(k)
    disp('[Warning 2]: k needs to be input!');
    return;
end
% k = 2

% Step 3: Please input start matrix with k rows (cluster centers) and n cols (features)
start = input('Step 3: Please input start matrix with k rows (cluster centers) and n cols (features): \n start = ');
if isempty(start)
    disp('[Warning 3]: start points needs to be input!');
    return;
end
% start = [X(3, :); X(5, :)]

% Step 4: Optinal parameters (Default setting is okay)
options.maxiter = 100; options.tol = 1e-4;%options.distflag = 'L2';
options.distflag = input("Step 4: Please clarify your similar function ('L1', 'L2', or 'inf'): \n options.distflag = ");
if isempty(options.distflag)
    disp('[Warning 4]: The similar function has not been clarified. Default (L2-norm) will be used for kmeans.');
    options.distflag = 'L2';
end

% Step 5: Please select the preferable function which can output different informations
p = input("Step 5: Please select your preferable output ('standard' or 'complete'): \n p = ");
if isempty(p)
    disp('[Warning 5]: The preferable output has not been clarified. Standard output will be used for kmeans.');
    p = 'standard';
end

disp('****** You have given some settings, and the kmeans clustering program will start...');
pause(0.5);
switch p
    case 'standard'
        [IDX, C] = dda2001kmeans(X, k, start, options);
    case 'complete'
        % Distmatrix between points and iterative cluster centers will output
        [IDX, C, DistMatrix] = dda2001kmeans(X, k, start, options);
end

% Program end~