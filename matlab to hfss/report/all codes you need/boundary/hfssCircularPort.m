% ----------------------------------------------------------------------------
% function hfssCircularPort(fid, Name, ObjectName, Axis, Center, Radius, ...
%                           Units)
% 
% Description :
% -------------
% Creates the VB Script necessary to create a circular wave port. This 
% function generates BOTH the circle object AND the wave port. This function
% is useful to add ports at the end of co-axial cables.
%
% Parameters :
% ------------
% fid        - file identifier of the HFSS script file.
% Name       - name of the wave port.
% ObjectName - name of the circle to which the wave port is assigned.
% Axis       - axis of the circle. Specify as 'X', 'Y' or 'Z'.
% Center     - the center of the circle.
% Radius     - raduis of the circle.
% Units      - specify as either 'mm', 'meter', 'in', ... or anything else
%              defined in HFSS.
% 
% Note :
% ------
% No integration lines are added and a single-mode solution is assumed.
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssCircularPort(fid, 'Port1', 'CoaxSource', 'Z', [10, 0, 0], 0.1, 'in');
%

function hfssCircularPort(fid, Name, ObjectName, Axis, Center, Radius, Units)

hfssCircle(fid, ObjectName, Axis, Center, Radius, Units);
hfssAssignWavePort(fid, Name, ObjectName, 1, false, [0,0,0], ...
                   [0,0,0], Units);
