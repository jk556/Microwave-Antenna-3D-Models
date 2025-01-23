% ----------------------------------------------------------------------------
% function hfssHollowCylinder(fid, Name, Axis, Center, inRadius, outRadius, 
%			    Height, Units)
% 
% Description :
% -------------
% Creates VB Script necessary to generate a hollow cylinder in HFSS.
%
% Parameters :
% ------------
% fid       - file identifier of the HFSS script file.
% Name      - name of the hollow cylinder (in HFSS).
% Axis      - choose between 'X', 'Y' or 'Z' for the cylinder axis.
% Center    - center of the cylinder (express as [x, y, z]).
% inRadius  - inner radius of the cylinder.
% outRadius - outer radius of the cylinder.
% Height    - cylinder height.
% Units     - units for all the quantities (use either 'in', 'mm', 'meter' or
%             anything else that is defined in HFSS).
% 
% Note :
% ------
% This function creates an extra object that is a contatenation of the Name
% with '_sub' that gets subtracted from the outer cylinder to get the hollow
% structure.
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssHollowCylinder(fid, 'Dipole', 'X', [-G/2, 0, 0], 0.95*R, R, L, 'in');
% ----------------------------------------------------------------------------

function hfssHollowCylinder(fid, Name, Axis, Center, inRadius, outRadius, ...
			    Height, Units)

hfssCylinder(fid, Name, Axis, Center, outRadius, Height, Units)
hfssCylinder(fid, strcat(Name, '_sub'), Axis, Center, inRadius, Height, ...
             Units);
hfssSubtract(fid, Name, strcat(Name, '_sub'));