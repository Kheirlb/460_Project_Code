function [mrp] = dcm2mrp(dcm)

phi = acosd(.5*(trace(dcm)-1));

 e1 = (dcm(2,3) - dcm(3,2))/(2*sind(phi));
 e2 = (dcm(3,1) - dcm(1,3))/(2*sind(phi));
 e3 = (dcm(1,2) - dcm(2,1))/(2*sind(phi));
 e = [e1; e2; e3];


mrp = e*phi;


end