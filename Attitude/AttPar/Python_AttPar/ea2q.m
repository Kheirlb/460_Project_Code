function [yaw, pitch, roll] = q2ea(quart, sqnc)

q1 = quart(1,1);
q2 = quart(2,1);
q3 = quart(3,1);
q4 = quart(4,1);

switch sqnc
    case 123
        [yaw, pitch, roll] = quart2angle(q1, q2, q3, q4, 'XYZ');
    case 121
        quart = angle2quat(roll, pitch, yaw, 'XYX');
    case 132
        quart = angle2quat(roll, pitch, yaw, 'XZY');
    case 131
        quart = angle2quat(roll, pitch, yaw, 'XZX');
    case 213
        quart = angle2quat(roll, pitch, yaw, 'YXZ');
    case 212
        quart = angle2quat(roll, pitch, yaw, 'YXY');
    case 231
        quart = angle2quat(roll, pitch, yaw, 'YZX');
    case 232
        quart = angle2quat(roll, pitch, yaw, 'YZY');
    case 321
        quart = angle2quat(roll, pitch, yaw, 'ZYX');
    case 323
        quart = angle2quat(roll, pitch, yaw, 'ZYZ');
    case 312
        quart = angle2quat(roll, pitch, yaw, 'ZXY');
    case 313
        quart = angle2quat(roll, pitch, yaw, 'ZXZ');
end
end


