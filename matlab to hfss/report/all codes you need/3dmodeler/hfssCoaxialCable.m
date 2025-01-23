% -------------------------------------------------------------------------- %
% hfssCoaxialCable(fid, Names, Axis, Center, Radii, Height, Units)
%
% Description :
% -------------
% This function creates the VBScript necessary to draw a Coaxial Cable in 
% HFSS. The "Coaxial Cable" can have as many cylinders as you specify. This
% function only creates the geometric structure and does not set any material
% properties.
%
% Parameters :
% ------------
% fid - file identifier of the HFSS VBScript File.
% Name - a cell of strings that contains the names of each cylinder that is a
%        part of the co-axial cable (see example).
% Axis - axis of the Coaxial Cable (choose between 'X', 'Y' or 'Z').
% Center - Coordinates of the Center of the Coaxial Cable ([x, y, z]).
% Radii - an array of Radii of the Cylinders present in the Coaxial cable.
%         each radius corresponds to the respective name specfied in the 
%         'Name' parameter.
% Height - length of the coaxial cable.
% Units - can be either 'in' or 'mm' or 'meter' or anything defined in HFSS.
%
% Example:
% ---------
% ...
% hfssCoaxialCable(fid, {'Cyl1_In', 'Cyl1_Er', 'Cyl1_Out'}, 'Z', [0, 0, 0], 
%                  0.02, 0.03, 0.04], 10, 'in')
% ...
% -------------------------------------------------------------------------- %

function hfssCoaxialCable(fid, Names, Axis, Center, Radii, Height, Units)

% Sort the Radii first in Ascending order.
[Radii, iR] = sort(Radii);
Names = cellstr(char(Names{iR}));

% Get the # of Cylinders.
nCylinders = length(Radii);

% First create the N-1 hollow cylinders.
for iR = nCylinders:-1:2
	hfssHollowCylinder(fid, Names{iR}, Axis, Center, Radii(iR-1), ...
	                   Radii(iR), Height, Units);
end

% Finally create the inner cylinder.
hfssCylinder(fid, Names{1}, Axis, Center, Radii(1), Height, Units);