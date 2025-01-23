% ----------------------------------------------------------------------------
% function hfssRename(fid, oldName, newName)
% 
% Description :
% -------------
% Creates the VB Script necessary to rename a HFSS Object.
%
% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% oldName - the object's previous name.
% newName - the object's new name.
% 
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssRename(fid, 'dipole1', 'dipole_one');
%

function hfssRename(fid, oldName, newName)

fprintf(fid, '\n');
fprintf(fid, 'oEditor.ChangeProperty _\n');
fprintf(fid, 'Array("NAME:AllTabs", _\n');
fprintf(fid, 'Array("NAME:Geometry3DAttributeTab", _\n'); 
fprintf(fid, 'Array("NAME:PropServers", "%s"), _\n', oldName);
fprintf(fid, 'Array("NAME:ChangedProps", _\n');
fprintf(fid, 'Array("NAME:Name", _\n');
fprintf(fid, '"Value:=", "%s"))))\n', newName);