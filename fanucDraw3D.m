% Annabel Chang & Tori Joshi
% MECH 498
% Lab 2: Robot Picasso
% March 30, 2020

function fanucDraw3D(path_file)
% MECH 498/598 - Intro to Robotics - Spring 2016
% Lab 2 - Inverse Kinematics
%
%    DESCRIPTION - Plot a graphical representation of the FANUC S-500
%    Industrial robot with attached coordinate frames as it moves through a
%    series of poses defined by path_file.
%
%    ADDITIONAL CODE NEEDED: lots

% Initialize the fanuc struct
fanuc = fanucInit();

% Get path position and color data
data = load(path_file);
s = data.s; % position
c = data.c; % color

% Draw FANUC initially in zero position (do not change)
prev_angles = zeros(1,6);
fanuc.handles = drawFanuc(prev_angles,fanuc);
hold on

% Draw in 3D
for t = 1:size(s,2)
    % Set desired brush color from path file (think about how to handle
    % changes in color)
    fanuc.brush = data.c(t);
    
    % Select desired orientation for the tool (your choice)
    % Make the tool point downward to reach points in the workspace easily.
    tool_rotate = [1 0 0; 0 -1 0; 0 0 -1];
    
    % Set desired position for the tool from path file (not your choice)
    final_point = [s(1,t); s(2,t); s(3,t)];
    %Remove the position of the tool frame to determine where the tip of
    %the end effector should be.
    new_frame = tool_rotate * -fanuc.tool{1}(1:3,4);
    final_frame = final_point + new_frame;
    T = [tool_rotate final_frame; 0 0 0 1];
    
    % Solve inverse kinematics for nearest solution
    [is_solution,joint_angles] = fanucIK(T,prev_angles,fanuc);
    % Rotate end effector for changing tool to make the motion smoother.
    if fanuc.brush == 2 %yellow
        joint_angles = joint_angles + [0 0 0 0 0 -pi/2];
    elseif fanuc.brush == 3 % orange
        joint_angles = joint_angles + [0 0 0 0 0 pi];
    elseif fanuc.brush == 4 % blue
        joint_angles = joint_angles + [0 0 0 0 0 pi/2];
    end
    
    % Move robot using setFanuc() if solution exists
    if is_solution == 1
        setFanuc(joint_angles,fanuc);
        
        % Plot a point at the tool brush tip with the appropriate color
        % (unless the brush selection is zero)
        if fanuc.brush ~= 0
            brush_color = fanuc.brush_colors{data.c(t)};
            % Remember to add base offset
            plot3(final_point(1),final_point(2),final_point(3)+fanuc.parameters.l_1,'.','Color',brush_color);
            % Update previous joint angles
            prev_angles = joint_angles;
        end
    end
end

hold off

end
