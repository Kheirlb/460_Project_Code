function [Y] = attpar(X,I)
%Details Coming Soon

switch I
    case 1
        %Y = dcm2ea(X);
        Y = 0.0;
    case 2
        Y = dcm2q(X);
    case 3
        Y = dcm2gv(X);
    case 4
        %Y = dcm2paa(X);
        Y = 0.0;
    case 5
        %Y = dcm2mrp(X);
        Y = 0.0;
    case 6
        %Y = ea2dcm(X);
        Y = 0.0;
    case 7
        %Y = ea2q(X);
        Y = 0.0;
    case 8
        %Y = q2ea(X);
        Y = 0.0;
    case 9
        %Y = q2dcm(X);
        Y = 0.0;
    case 10
        %Y = q2gv(X);
        Y = 0.0;
    case 11
        %Y = gv2q(X);
        Y = 0.0;
    case 12
        %Y = gv2dcm(X);
        Y = 0.0;
    case 13
        %Y = paa2dcm(X);
        Y = 0.0;
    case 14
        %Y = paa2q(X);
        Y = 0.0;
    otherwise
        Y = 0.0;
end

end

