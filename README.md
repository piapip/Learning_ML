Learning Machine Learning from Andrew Ng course on coursera. Storing stuffs in here.

nextTheta = theta - (alpha/m * sumMass) <br/>
% m = size(X)(1) <br/>
Linear problem: 
% sumMass = X' * (X * theta - y) <br/>

Logistic problem:
% sumMass = X' * (g(X * theta) - y) <br/>

In ex4-week5, even though I implemented the a2 incorrectly, it still gave me result somewhat correct.
(50% slightly wrong - 50% totally right). Weird huh.
(using sigmoidGradient(a2') instead of a2'.(1-a2'))