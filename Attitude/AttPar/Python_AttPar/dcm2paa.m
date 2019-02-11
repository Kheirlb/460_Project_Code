function [eNphi] = dcm2paa(C)
%   Direction Cosine Matrix to Principle Angle/Axis

phi = acosd(0.5*(trace(C)-1));
e = [(C(2,3)-C(3,2))/(2*sind(phi));(C(3,1)-C(1,3))/(2*sind(phi));(C(1,2)-C(2,1))/(2*sind(phi))];
eNphi = e;
eNphi(4) = phi;
end

