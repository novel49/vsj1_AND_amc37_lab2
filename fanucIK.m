% Annabel Chang & Tori Joshi
% MECH 498
% Lab 2: Robot Picasso
% March 30, 2020


function [is_solution,joint_angles] = fanucIK(T,prev_joint_angles,fanuc)
% Pull out rotation matrix
% Account for fram 6 being offset from frames 4 & 5 (bring the end effector
% back to the same origin for {4}, {5}, and {6} and determine the new
% position vector.
R = T(1:3,1:3);
P = T(1:3, 4);
Rnew = R * [0;0;-180];
Pprime = P - Rnew;

%THETA1
%Determine theta1 (use x & y coordinates to determine rotation)
theta1 = atan2(Pprime(2,1),Pprime(1,1));

%THETA3
%Find hypotenuse between links 4 and 5 using Pythagorean Theorem (called r)
r = sqrt(fanuc_struct.parameters.l_4^2 + fanuc_struct.parameters.l_5^2);
%We can find angle made by these offsets using invrese tangent of the triangle made by the
%offsets (called gamma)
gamma = atan2(d4,a4);
%find the length between {2} and {4}
%theta3prime - use right triangle to find s, use that triangle to find
%theat3prime
s = sqrt(Pprime(2,1)^2 + Pprime(1,1)^2) - fanuc_struct.parameters.l_2;
theta3prime = acos((s^2 - r^2 - fanuc.struct.parameters.l_3^2)/(-2*r*fanuc_struct.parameters.l_3));
%From these, calculate theta3
theta3 = theta3prime + gamma - pi;

%THETA2
%Determine the length between {2} and the base of {4} on the XY plane
a = sqrt(Pprime(2,1)^2 + Pprime(1,1)^2) - fanuc.struct.parameters.l_2;
b = Pprime(3,1);
%Determine the distance between {2} and {4} = this is an [unnecessary] check from the
%previous step
c = sqrt(a^2 + b^2);
%Determine angle between ground and {4} - Law of Cosines
phi = acos((b^2 - c^2 - a^2)/(-2*a*c));
%Determine angle between c and Link 3 - Law of Cosines
psi = acos((r^2 - c^2 - fanuc.struct.parameters.l_3^2)/(-2*c*fanuc.struct.parameters.l_3));
%Subtract these angles from 90 to find the desired theta2 angle
theta2 = pi/2 - phi - psi;


end