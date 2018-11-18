function [x_dot] = attFunc(t,x)
global I;
global k1;
global k2;
w = x(1:3);
q = x(4:7);
u = -k1*w-k2*q(1:3);
w_dot=I\(-cross(w,I*w)+u);
q_dot = 0.5*[-tilde(w), w; w.', 0]*q;
x_dot = [w_dot;q_dot];

end

