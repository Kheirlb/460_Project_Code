function [eularAngles] = dcm2ea(dcmNs)
% Direction Cosine Matrix to Euler Angles
dcm = dcmNs(1:3,:);
sVector = dcmNs(4,:);
sString = strcat(int2str(sVector(1)), int2str(sVector(2)), int2str(sVector(3)));
s = str2double(sString);

switch s
    case 123
        [pitch, roll, yaw] = dcm2angle(dcm,'XYZ');
    case 121
        [pitch,roll,yaw] = dcm2angle(dcm,'XYX');
    case 132
        [pitch,roll,yaw] = dcm2angle(dcm,'XZY');
    case 131
        [pitch,roll,yaw] = dcm2angle(dcm,'XZX');
    case 213
        [pitch, roll, yaw] = dcm2angle(dcm,'YXZ');
    case 212
        [pitch, roll, yaw] = dcm2angle(dcm,'YXY');
    case 231
        [pitch, roll, yaw] = dcm2angle(dcm,'YZX');
    case 232
        [pitch, roll, yaw] = dcm2angle(dcm,'YZY');
    case 321
        [pitch, roll, yaw] = dcm2angle(dcm,'ZYX');
    case 323
        [pitch, roll, yaw] = dcm2angle(dcm,'ZYZ');
    case 312
        [pitch, roll, yaw] = dcm2angle(dcm,'ZXY');
    case 313
        [pitch, roll, yaw] = dcm2angle(dcm,'ZXZ');
end 
eularAngles = [pitch, roll, yaw];

end

