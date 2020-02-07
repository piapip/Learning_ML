function nextTheta = nextThetaIteration(X, y, theta, alpha)
  m = size(X)(1)
  % sumMass = hypo(X, theta) - y
  sumMass = X' * (X * theta - y)
  nextTheta = theta - (alpha/m * sumMass)
endfunction

