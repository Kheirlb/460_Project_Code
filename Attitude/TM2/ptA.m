%AE 460 Technical Memo #2

%% Givens
b_1 = [0 1 0]';
b_2 = [-1 0 0]';
r_1 = [-1 0 0]';
r_2 = [0 -1 0]';

%% Part A
r_3 = cross(r_1, r_2);
b_3 = cross(b_1, b_2);

b = [b_1 b_2 b_3];
r = [r_1 r_2 r_3];

C = b/r

%% Part B
I = C*C'

%% Part C
dcm2paa(C)

%% Part D
C_2 = C;
C_2(4,:) = [1 2 3];
ea = dcm2ea(C_2)

%% Part E
% At 90 degrees and at -90 degrees

%% Part F
eig(C)

%% Part G
CK = 1/sqrt(2).*[1 1i; 1i 1];
%alpha = exp(1i*(ea(2,1)+ea(3,1))/2)*cosd(0.5*ea(1,1));
%beta = 1i*exp(1i*(ea(2,1)-ea(3,1))/2)*sind(0.5*ea(1,1));
%gamma = 1i*exp(-1i*(ea(2,1)-ea(3,1))/2)*sind(0.5*ea(1,1));
%delta = exp(-(ea(2,1)+ea(3,1))/2)*cosd(0.5*ea(1,1));

alpha = CK(1,1);
beta = CK(1,2);
gamma = CK(2,1);
delta = CK(2,2);

%Q = [alpha beta; gamma delta];

%epsilon = [CK(1,1)-Q(1,1) CK(1,2)-Q(1,2); CK(2,1)-Q(2,1) CK(2,2)-Q(2,2)]

CK2q = [0.5*(alpha+delta); -1i*0.5*(beta+gamma); 0.5*(beta*gamma); -1i*0.5*(alpha-delta)];
T = q2dcm(CK2q');

epsilon = T.*C'

% CK2dcm = [0.5*(alpha^2-gamma^2+delta-beta^2) 0.5*1i*(gamma^2-alpha^2+delta^2-beta^2) gamma*delta-alpha*beta;...
%    0.5*1i*(alpha^2+gamma^2-beta^2-delta^2) 0.5*(alpha^2+gamma^2+beta^2+delta^2) -1i*(alpha*beta+gamma*delta);...
%    beta*delta-alpha*gamma 1i*(alpha*gamma+beta*delta) alpha*delta+beta*gamma];
% b_1new = CK2dcm*r_1;
% 
% CK2dcm_2 = q2dcm(CK2q')
% 
% epsilon = abs(b_1-b_1new)

%% Part H
% Fours sources include aerodynamic effects, solar radiation, Earth's
% magnetic field and gravity-gradient effects

%% Part I
% A minimum of three parameters are required

%% Part J
% The spacecraft must be returned to a state of simple spin along the 3
% axis

%% Part K

% K_p = 1;
% K_d = 1;
% I_1 = 0.5;
% I_2 = 0.6;
% I_3 = 0.7;
% IMatrix = [I_1 0 0; 0 I_2 0; 0 0 I_3];
% 
% quart = dcm2q(C);
% 
% q_1 = quart(1,1);                       %
% q_2 = quart(1,2);                       %
% q_3 = quart(1,3);                       %
% q_4 = quart(1,4);                       % Values Randomly Chosen
% omega_1 = 1;                            %
% omega_2 = 1;                            %
% omega_3 = 1;                            %
% 
% qMatrix = [q_4 -q_3 q_2; q_3 q_4 -q_1; -q_2 q_1 q_4; -q_1 -q_2 -q_3];
% omegaMatrix = [omega_1; omega_2; omega_3];
% q_v = [q_1; q_2; q_3];
% 
% q_dot = 0.5*qMatrix*omegaMatrix;
% 
% u = -K_p.*q_v-K_d.*omegaMatrix;
% 
% omega_dot = (cross(-omegaMatrix, (IMatrix*omegaMatrix))+u)./IMatrix;
% fun = @(0,15) omega_dot;
% 
% omegaPlot = integral(omega_dot, 0, 15);

mainAttitude;