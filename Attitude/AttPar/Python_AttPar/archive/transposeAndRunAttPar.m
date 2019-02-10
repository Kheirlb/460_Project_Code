function [Y] = transposeAndRunAttPar(X, I)

X = X';
Y = attpar(X,I);

end

