function [ dcm ] = q2dcm( q)
%UNTITLED This function converts Quaternions
%   Detailed explanation goes here

q1 = q(1,1);
q2 = q(2,1);
q3 = q(3,1);
q4 = q(4,1);
qv = [q1; q2; q3];

c11 = (2*q4^2 + 2*q1^2 - 1); %ROW 1
c12 = (2*q1*q2 - 2*q4*q3);
c13 = (2*q1*q3 + 2*q4*q2);

c21 = (2*q1*q2 + 2*q4*q3); % ROW 2
c22 = (2*q4^2 + 2*q2^2 - 1);
c23 = (2*q2*q3 - 2*q4*q1);

c31 = (2*q1*q3 - 2*q4*q2); %ROW 3
c32 = (2*q2*q3 + 2*q4*q1);
c33 = (2*q4^2 + 2*q3^2 -1);

dcm = [c11 c12 c13; c21 c22 c23; c31 c32 c33]';

end

