

function hfssSetTransparency(fid, ObjectList, Value)

% arguments processing.
if (nargin < 3)
	erro('non-enough arguments !');
end

if ((Value < 0) || (Value > 1))
	error('transparency must be between 0 and 1!');
end

if (~iscell(ObjectList))
	error('ObjectList must be a cell-array of objects !');
end

nObj = length(ObjectList);

fprintf(fid, '\n');
fprintf(fid, 'oEditor.ChangeProperty _\n');
fprintf(fid, 'Array("NAME:AllTabs", _\n');
fprintf(fid, '\tArray("NAME:Geometry3DAttributeTab", _\n');
fprintf(fid, '\t\tArray("NAME:PropServers",');
for iO = 1:nObj-1
	fprintf(fid, '"%s", ', ObjectList{iO});
end
fprintf(fid, '"%s"), _\n', ObjectList{nObj});
fprintf(fid, '\t\tArray("NAME:ChangedProps", _\n');
fprintf(fid, '\t\t\tArray("NAME:Transparent", "Value:=",  %f) _\n', Value);
fprintf(fid, '\t\t\t) _\n');
fprintf(fid, '\t\t) _\n');
fprintf(fid, '\t)\n');
