function [dcm] = paa2dcm(eNphi)


% phi = 77.3409;
% e1 = 0.9291;
% e2 = -0.1879;
% e3 = -0.3184;
% e1 = (C(2,3) - C(3,2))/(2*sind(phi));
% e2 = (C(3,1) - C(1,3))/(2*sind(phi));
% e3 = (C(1,2) - C(2,1))/(2*sind(phi));
% e = [e1; e2; e3];
%phi = acosd(.5*(trace(C)-1));

e1 = eNphi(1,1);
e2 = eNphi(2,1);
e3 = eNphi(3,1);
phi = eNphi(4,1);

dcm = [ cosd(phi)+(1-cosd(phi))*e1^2, (1-cosd(phi))*e1*e2+e3*sind(phi), (1-cosd(phi))*e1*e3-e2*sind(phi);
    (1-cosd(phi))*e1*e2-e3*sind(phi), cosd(phi)+(1-cosd(phi))*e2^2, (1-cosd(phi))*e2*e3+e1*sind(phi);
    (1-cosd(phi))*e1*e3+e2*sind(phi), (1-cosd(phi))*e2*e3-e1*sind(phi), cosd(phi)+(1-cosd(phi))*e3^2];





end
