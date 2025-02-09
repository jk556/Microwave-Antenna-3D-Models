% -------------------------------------------------------------------------- %
% function hfssWireConnection(fid, Name, Center, Radius, hValues, Axes, ...
%                              Units, Padding)
% 
% Description:
% ------------
% Creates a HFSS Wire Connection (a.k.a, a collection of wires connected 
% together). It can be used to implement a pipe connection with several pipes
% oriented at right angles to each other.
%
% Parameters :
% ------------
% fid - File Identifier of the HFSS file.
% Center - The center of the first point in the first cylinder (wire), 
%          expressed as a 3-Tuple.
% Radius - Radius of the wire in the wire connection (all wires have the same
%          radii)
% hValues - An array of height values that contain the heights of all the 
%           cylinders in the wire connection, for example, the first hValue
%           is the height of the first cylinder, and vice-versa.
% Axes - An array of axes of each cylinder in the wire connection. Use 'X', 
%        'Y' or 'Z'. This information is used to determine the direction of 
%        each cylinder turn (should be the same size as hValues).
% Units - The units for all the values specified ('meter', 'mil', 'in', ...).
% [Padding] - (optional) Determines how the edges in the wire connections are 
%             handled. Choose one of the following (default is 's'):
%             'n' - no padding. The edges won't exactly be 'closed'.
%             'p' - increases the length of each cylinder a little bit so that
%                   the cylinder edges appear closed when united. This is done
%                   for all cylinders except the last one (as it is not 
%                   connected to any other cylinder).
%             's' - Inserts a Sphere in each edge to close it out - default.
% Note:
% -----
% 
% Example:
% --------
% hfssWireConnection(fid, 'BalunWire', [0, 0, 0], 0.1, [1, 2, -1, 5], ... 
%                  ['X', 'Z', 'Y', 'X'], 'in', 's');
% 

function hfssWireConnection(fid, Name, Center, Radius, hValues, Axes, ...
                              Units, Padding)

% arguments processor.
if (nargin < 7)
	error('Insufficient number of arguments !');
elseif (nargin < 8)
	Padding = [];
end

% default arguments. 
if isempty(Padding)
	Padding = 's';
end

% # of Wires to connect.
nWires = length(hValues);

% Convert to Upper Case ... just in case.
Axes = upper(Axes);

% Any Necessary Padding.
switch(Padding)
	case 'p'  % Simple Padding.
		% Increase the Length of the all the wires (except the last)
		% by a value equal to the radius.
		hValues(1:nWires-1) = hValues(1:nWires-1) + Radius;
end

% Place Holder for All the Cylinder Names.
CylNames = cell(nWires, 1);
SprNames =  cell(nWires-1, 1);

% Create All the Cylinders.
for iW = 1: nWires
	% Use the given name for the default cylinder and create 'indexed'
	% names for the others.
	if (iW == 1)
		CylNames{iW} = Name;
	else 
		CylNames{iW} = strcat(Name, num2str(iW));
	end
	
	% Create the Cylinder.
	hfssCylinder(fid, CylNames{iW}, Axes(iW), Center, Radius, ... 
	             hValues(iW), Units);
		     
	% Update the Center.
	switch (Axes(iW))
		case 'X'
			Center(1) = Center(1) + hValues(iW);
		case 'Y'
			Center(2) = Center(2) + hValues(iW);
		case 'Z'
			Center(3) = Center(3) + hValues(iW);
	end

	% if a sphere is required as a pad, draw it.
	% do this for all except the last wire.
	if ((Padding == 's') && (iW ~= nWires))
        if (iW == 1)
			SprNames{iW} = strcat(Name, '_SprConn');
        else 
			SprNames{iW} = strcat(Name, '_SprConn', num2str(iW));
        end
		hfssSphere(fid, SprNames{iW}, Center, Radius, Units);
	end
end

% Finally Unite Everything.
hfssUnite(fid, CylNames);
hfssUnite(fid, SprNames);
hfssUnite(fid, Name, strcat(Name, '_SprConn'));