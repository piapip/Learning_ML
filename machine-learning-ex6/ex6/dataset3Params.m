function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

C_sample = [0.01 0.03 0.1 0.3 1 3 10 30]';
sigma_sample = [0.01 0.03 0.1 0.3 1 3 10 30]';

sample_size = length(C_sample);
result = [];
for c_samp = 1:sample_size
  for sig_samp = 1:sample_size
    model = svmTrain(X, y, C_sample(c_samp), ...
            @(x1, x2)gaussianKernel(x1, x2, sigma_sample(sig_samp)));
    predictions = svmPredict(model, Xval);
    prediction_error = mean(double(predictions ~= yval));
    % so basically, it tests out every possible C and sigma and look for 
    % the pair with the lowest error, the idea is simple (it's exactly the same 
    % as last week's lesson) but I swear this is not my code. 
    % And took forever to submit PogChamp.
    result = [result; C_sample(c_samp), sigma_sample(sig_samp), prediction_error];
  endfor
endfor

[min_error min_index] = min(result(:,3));
C = result(min_index, 1);
sigma = result(min_index, 2);

% =========================================================================

end
