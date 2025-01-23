% ----------------------------------------------------------------------------
% function hfssCylinder(fid, Name, Axis, Center, Radius, Height, Units)
% 
% Description :
% -------------
% Creates the VB script necessary to model a cylinder in HFSS.
%
% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% Name    - name of the cylinder (in HFSS).
% Center  - center of the cylinder (specify as [x, y, z]). This is also the 
%           starting point of the cylinder.
% Axis    - axis of the cylinder (specify as 'X', 'Y', or 'Z').
% Radius  - radius of the cylinder (scalar).
% Height  - height of the cylidner (from the point specified by Center).
% Units   - specify as 'in', 'mm', 'meter' or anything else defined in HFSS.
% 
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssCylinder(fid, 'Cyl1', 'Z', [0, 0, 0], 0.1, 10, 'in');
% ----------------------------------------------------------------------------

function hfssCylinder(fid, Name, Axis, Center, Radius, Height, Units, material)

% Cylinder Parameters.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreateCylinder _\n');
fprintf(fid, 'Array("NAME:CylinderParameters", _\n');
fprintf(fid, '"XCenter:=", "%f%s", _\n', Center(1), Units);
fprintf(fid, '"YCenter:=", "%f%s", _\n', Center(2), Units);
fprintf(fid, '"ZCenter:=", "%f%s", _\n', Center(3), Units);
fprintf(fid, '"Radius:=", "%f%s", _\n', Radius, Units);
fprintf(fid, '"Height:=", "%f%s", _\n', Height, Units);
fprintf(fid, '"WhichAxis:=", "%s"), _\n', upper(Axis));

% Cylinder Properties.
fprintf(fid, 'Array("NAME:Attributes", _\n'); 
fprintf(fid, '"Name:=", "%s", _\n', Name);
fprintf(fid, '"Flags:=", "", _\n');
fprintf(fid, '"Color:=", "(132 132 193)", _\n');
fprintf(fid, '"Transparency:=", 0, _\n');
fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
fprintf(fid, '"MaterialName:=", "%s", _\n', material);
fprintf(fid, '"SolveInside:=", true)\n');
fprintf(fid, '\n');