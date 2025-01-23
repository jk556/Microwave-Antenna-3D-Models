% ----------------------------------------------------------------------------
% function hfssConnect(fid, Names)
% 
% Description :
% -------------
% Creates VB Script necessary to connect two HFSS objects using a surface.
%
% Parameters :
% ------------
% fid   - file identifier of the HFSS script file.
% Names - a cell array of strings that represent the surface-like objects that
%         need to be connected to form a solid structure.
% 
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssConnect(fid, {'topLayer', 'bottomLayer'});
% ----------------------------------------------------------------------------

function hfssConnect(fid, Names)

fprintf(fid, '\n');
fprintf(fid, 'oEditor.Connect _\n');
fprintf(fid, 'Array("NAME:Selections", _\n');
fprintf(fid, '"Selections:=", _\n');

nObjects = length(Names);
fprintf(fid, '"');
for iO = 1:nObjects-1
	fprintf(fid, '%s,', Names{iO});
end
fprintf(fid, '%s")\n', Names{nObjects});