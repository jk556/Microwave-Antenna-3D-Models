% ----------------------------------------------------------------------------
% function hfssSphere(fid, Name, Center, Radius, Units)
% 
% Description :
% -------------
% Creates the VB Script necessary to create a sphere in HFSS.
%
% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% Name    - name of the sphere (appears in HFSS).
% Center  - center of the sphere (specify as [cx, cy, cz])
% Radius  - radius of the sphere (scalar)
% Units   - specify as 'in', 'm', 'meter' or anything defined in HFSS.
% 
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssSphere(fid, 'Sphere1', [0,0,0], 1, 'meter');


function hfssSphere(fid, Name, Center, Radius, Units)

% Preamble
fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreateSphere _\n');
fprintf(fid, 'Array("NAME:SphereParameters", _\n');

% Center and Radius.
fprintf(fid, '"XCenter:=", "%f%s", _\n' , Center(1), Units);
fprintf(fid, '"YCenter:=", "%f%s", _\n' , Center(2), Units);
fprintf(fid, '"ZCenter:=", "%f%s", _\n' , Center(3), Units);
fprintf(fid, '"Radius:=" , "%f%s"), _\n', Radius,    Units);

% Attributes.
fprintf(fid, 'Array("NAME:Attributes", _\n');
fprintf(fid, '"Name:=", "%s", _\n', Name);
fprintf(fid, '"Flags:=", "", _\n');
fprintf(fid, '"Color:=", "(132 132 193)", _\n');
fprintf(fid, '"Transparency:=", 0, _\n');
fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
fprintf(fid, '"MaterialName:=", "vacuum", _\n');
fprintf(fid, '"SolveInside:=", true)\n');