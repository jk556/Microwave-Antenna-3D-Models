

function hfssAssignRadiation(fid, Name, BoxObject, UseIE)

% arguments processor.
if (nargin < 3)
	error('Insufficient number of arguments!');
elseif (nargin < 4)
	UseIE = false;
end

% process UseIE
if UseIE
    UseIE = 'true';
else
    UseIE = 'false';
end

fprintf(fid, 'Set oModule = oDesign.GetModule("BoundarySetup")\n');
fprintf(fid, 'oModule.AssignRadiation _\n');
fprintf(fid, 'Array("NAME:%s", _\n', Name);
fprintf(fid, '"Objects:=", Array("%s"), _\n', BoxObject);
fprintf(fid, '"UseAdaptiveIE:=", %s)\n', UseIE);
