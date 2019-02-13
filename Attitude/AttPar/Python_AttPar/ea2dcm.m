function [dcm] = ea2dcm(input)
%   Euler Angles to Direction Cosine Matrix

roll = input(1,1);
pitch = input(1,2);
yaw = input(1,3);
sVector = input(2,:);
sString = strcat(int2str(sVector(1)), int2str(sVector(2)), int2str(sVector(3)));
seq = str2double(sString);

R1r = [ 1, 0, 0; 0, cosd(roll), sind(roll); 0, -sind(roll), cosd(roll)] ;
R1p = [ 1, 0, 0; 0, cosd(pitch), sind(pitch); 0, -sind(pitch), cosd(pitch)] ;
R1y = [ 1, 0, 0; 0, cosd(yaw), sind(yaw); 0, -sind(yaw), cosd(yaw)] ;
R2r = [ cosd(roll), 0, -sind(roll); 0, 1, 0; sind(roll), 0, cosd(roll)] ;
R2p = [ cosd(pitch), 0, -sind(pitch); 0, 1, 0; sind(pitch), 0, cosd(pitch)] ;
R2y = [ cosd(yaw), 0, -sind(yaw); 0, 1, 0; sind(yaw), 0, cosd(yaw)] ;
R3r = [ cosd(roll), sind(roll), 0; -sind(roll), cosd(roll), 0; 0, 0, 1] ;
R3p = [ cosd(pitch), sind(pitch), 0; -sind(pitch), cosd(pitch), 0; 0, 0, 1] ;
R3y = [ cosd(yaw), sind(yaw), 0; -sind(yaw), cosd(yaw), 0; 0, 0, 1] ;

switch seq
    case 123
        dcm = R3r*R2p*R1y;
    case 121
        dcm = R1r*R2p*R1y;
    case 132
        dcm = R2r*R3p*R1y;
    case 131
        dcm = R1r*R3p*R1y;
    case 213
        dcm = R3r*R1p*R2y;
    case 212
        dcm = R2r*R1p*R2y;
    case 231
        dcm = R1r*R3p*R2y;
    case 232
        dcm = R2r*R3p*R2y;
    case 321
        dcm = R1r*R2p*R3y;
    case 323
        dcm = R3r*R2p*R3y;
    case 312
        dcm = R2r*R1p*R3y;
    case 313
        dcm = R3r*R1p*R3y;

end
end
