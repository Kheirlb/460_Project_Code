function [Y] = attpar(X,I)
%Details Soon
%X = cell2mat(X);
switch I
    case 1
        Y = dcm2q(X);
    otherwise
        Y = 0;
end

end

