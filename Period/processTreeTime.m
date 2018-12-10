% Process Tree

% Transfer Time for Lasercom
speedLc = 622; % Mbps
speedS = 2; %Mbps
speedUHF = 0.0048; 
Mbps2bps = 1000000;
speedLcBps = speedUHF * Mbps2bps; %bits/sec
sizeImg = 1300000; % bytes 1.3 megabytes
byte2bit = 8;
sizeImgBit = sizeImg * byte2bit; 
time1 = (speedLcBps/sizeImgBit)^(-1);
disp(speedLcBps);
disp(sizeImgBit);
fprintf("Time: %4.2f sec\n", time1);
