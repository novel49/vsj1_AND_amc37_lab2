% Annabel Chang & Tori Joshi
% MECH 498
% Lab 2: Robot Picasso
% March 30, 2020

function drawing()

%This is a mess and I'm sorry. I'm still experimenting with shapes.

% Steps:
% Create 3D function
% save x y z coordinated to mat file
% Create corresponding color tags
% save to mat file
% Call mat file with robot
% profit

%Create one color spiral

t = 0:pi/500:pi;
s(1,:) = sin(t).*cos(10*t);
s(2,:) = sin(t).*sin(10*t);
s(3,:) = cos(t);

s = s*100 + [200; 0; 1000];
c = ones(1,501);

save sphere.mat s c

% Y(1,:) = sin(t).*sin(10*t);
% Y(2,:) = sin(t).*sin(12*t);
% Y(3,:) = sin(t).*sin(20*t);
% 
% Z = cos(t);

% coordinates = [X; Y; Z];

% t = 0:pi/500:pi;

% X(1,:) = sin(t).*cos(10*t);
% X(2,:) = sin(t).*cos(12*t);
% X(3,:) = sin(t).*cos(20*t);
% 
% Y(1,:) = sin(t).*sin(10*t);
% Y(2,:) = sin(t).*sin(12*t);
% Y(3,:) = sin(t).*sin(20*t);

% https://www.mathworks.com/help/matlab/ref/plot3.html
% For more code ideas.

end