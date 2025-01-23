

function hfssInsertDesign(fid, designName, designType)

% arguments processor.
if (nargin < 2)
	error('Insufficient number of arguments !');
elseif (nargin < 3)
	designType = [];
end

% default arguments.
if isempty(designType)
	designType = 'driven modal';
end

% create the necessary script.
fprintf(fid, '\n');
fprintf(fid, 'oProject.InsertDesign "HFSS", ');
fprintf(fid, '"%s", ', designName);
switch (lower(designType))
	case 'driven terminal'
		fprintf(fid, '"DrivenTerminal", ""\n');
	case 'driven modal'
		fprintf(fid, '"DrivenModal", ""\n');
	case 'eigenmode'
		fprintf(fid, '"Eigenmode", ""\n');
end
fprintf(fid, 'Set oDesign = oProject.SetActiveDesign("%s")\n', designName);
fprintf(fid, 'Set oEditor = oDesign.SetActiveEditor("3D Modeler")\n');