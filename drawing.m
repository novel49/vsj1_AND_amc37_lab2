% Annabel Chang & Tori Joshi
% MECH 498
% Lab 2: Robot Picasso
% March 30, 2020

function MagicSphere()

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
one(1,:) = sin(t).*cos(10*t);
one(2,:) = sin(t).*sin(10*t);
one(3,:) = cos(t);

two(1,:) = sin(t).*cos(12*t);
two(2,:) = sin(t).*sin(12*t);
two(3,:) = cos(t);

three(1,:) = sin(t).*cos(20*t);
three(2,:) = sin(t).*sin(20*t);
three(3,:) = cos(t);

s = [one flip(two,2) three]*500 + [200; 0; 1500];
c = [ones(1,501) ones(1,501)*2 ones(1,501)*3];

% s = s*100 + [200; 0; 1000];
% c = ones(1,501);

save MagicSphere.mat s c

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