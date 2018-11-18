%mainAttitude
global I;
global k1;
global k2;
w_not = rand(3,1);
q_not = rand(4,1);
q_not = q_not/norm(q_not);
t = [0,30];
k1 = 1;
k2 = 2;
I = diag([0.1,0.2,0.3]);
[t,X] = ode45(@attFunc, t, [w_not;q_not]);
plot(X);
