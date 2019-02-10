function [Y] = attpar(X,I)
%Details Coming Soon

switch I
    case 1
        Y = dcm2ea(X);
    case 2
        Y = dcm2q(X);
    case 3
        Y = dcm2gv(X);
    case 4
        Y = dcm2paa(X);
    case 5
        Y = dcm2mrp(X);
    case 6
        Y = ea2dcm(X);
    case 7
        Y = ea2q(X);
    case 8
        Y = q2ea(X);
    case 9
        Y = q2dcm(X);
    case 10
        Y = q2gv(X);
    case 11
        Y = gv2q(X);
    case 12
        Y = gv2dcm(X);
    case 13
        Y = paa2dcm(X);
    case 14
        Y = paa2q(X);
    otherwise
        Y = 0.0;
end

end
