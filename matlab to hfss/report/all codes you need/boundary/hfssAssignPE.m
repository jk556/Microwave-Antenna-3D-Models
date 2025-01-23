

function hfssAssignPE(fid, Name, ObjectList, infGND)

% arguments processor.
if (nargin < 3)
	error('Insufficient # of arguments !');
elseif (nargin < 4)
	infGND = [];
end

% default arguments.
if isempty(infGND)
	infGND = false;
end

% # of objects.
nObjects = length(ObjectList);

% create the necessary script.
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("BoundarySetup")\n');
fprintf(fid, 'oModule.AssignPerfectE _\n');
fprintf(fid, 'Array("NAME:%s", _\n', Name);

% is infinite GND ?
if (infGND)
	fprintf(fid, '"InfGroundPlane:=", true, _\n');
else
	fprintf(fid, '"InfGroundPlane:=", false, _\n');
end

fprintf(fid, '"Objects:=", _\n'); 
fprintf(fid, 'Array(');
for iObj = 1:nObjects
	fprintf(fid, '"%s"', ObjectList{iObj});
	if (iObj ~= nObjects)
		fprintf(fid, ',');
	end
end
fprintf(fid, '))\n');