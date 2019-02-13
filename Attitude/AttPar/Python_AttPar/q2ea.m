function [eularAngles] = q2ea(quartNsqnc)

q1 = quartNsqnc(1,1);
q2 = quartNsqnc(1,2);
q3 = quartNsqnc(1,3);
q4 = quartNsqnc(1,4);
sVector = quartNsqnc(2,1:3);
sString = strcat(int2str(sVector(1)), int2str(sVector(2)), int2str(sVector(3)));
sqnc = str2double(sString);

switch sqnc
    case 123
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'XYZ');
    case 121
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'XYX');
    case 132
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'XZY');
    case 131
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'XZX');
    case 213
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'YXZ');
    case 212
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'YXY');
    case 231
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'YZX');
    case 232
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'YZY');
    case 321
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'ZYX');
    case 323
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'ZYZ');
    case 312
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'ZXY');
    case 313
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'ZXZ');
end
eularAngles = rad2deg([pitch, roll, yaw]');
end
