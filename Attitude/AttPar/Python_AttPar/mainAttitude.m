%mainAttitude
%clear;clc;close all;
global I;
global k1;
global k2;
w_not = rand(3,1);
q_not = rand(4,1);
q_not = q_not/norm(q_not);
t = [0,15];
k1 = 1;
k2 = 1;
I = diag([0.5,0.6,0.7]);
[t,X] = ode45(@attFunc, t, [w_not;q_not]);

% calculate the control input for plotting purposes;
for i=1:length(t)
    u(i,:) = -k1*X(i,1:3)-k2*X(i,4:6);
end

figure; subplot(3,1,1); plot(t,X(:,1:3));grid;legend('\omega_x','\omega_y','\omega_z');
ylabel('angular velocity [rad/sec]');
subplot(3,1,2); plot(t,X(:,4:end));grid;legend('q_1','q_2','q_3','q_4');
ylabel('Quaternion q(t)')
subplot(3,1,3); plot(t,u(:,1:3));grid;legend('u_1','u_2','u_3');
xlabel('time [sec]');
ylabel('control input u(t)')
