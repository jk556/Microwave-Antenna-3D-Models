
function hfssDuplicateAlongLine(fid, ObjectList, dVector, nClones, Units, ...
				dupBoundaries)

% arguments processor.
if (nargin < 5)
	error('Insufficient number of arguments !');
elseif (nargin < 6)
	dupBoundaries = [];
end

% default arguments.
if isempty(dupBoundaries)
	dupBoundaries = true;
end

nObjects = length(ObjectList);

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.DuplicateAlongLine _\n');
fprintf(fid, 'Array("NAME:Selections", _\n');

% Object Selections.
fprintf(fid, '"Selections:=", "');
for iObj = 1:nObjects
	fprintf(fid, '%s', ObjectList{iObj});
	if (iObj ~= nObjects)
		fprintf(fid, ',');
	end
end
fprintf(fid, '"), _\n');

% Duplication Vectors.
fprintf(fid, 'Array("NAME:DuplicateToAlongLineParameters", _\n');
fprintf(fid, '"XComponent:=", "%f%s", _\n', dVector(1), Units);
fprintf(fid, '"YComponent:=", "%f%s", _\n', dVector(2), Units);
fprintf(fid, '"ZComponent:=", "%f%s", _\n', dVector(3), Units);
fprintf(fid, '"NumClones:=", %d), _\n', nClones);

% Duplicate Boundaries with Geometry or not.
fprintf(fid, 'Array("NAME:Options", _\n');
if (dupBoundaries)
	fprintf(fid, '"DuplicateBoundaries:=", true)\n');
else
	fprintf(fid, '"DuplicateBoundaries:=", false)\n');
end