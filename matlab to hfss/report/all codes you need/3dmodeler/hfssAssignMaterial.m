
function hfssAssignMaterial(fid, Name, Material)

fprintf(fid, '\n');
fprintf(fid, 'oEditor.AssignMaterial _\n');
fprintf(fid, '\tArray("NAME:Selections", _\n');
fprintf(fid, '\t\t"Selections:=", "%s"), _\n', Name);  
fprintf(fid, '\tArray("NAME:Attributes", _\n');
fprintf(fid, '\t\t"MaterialName:=", "%s", _\n', Material);

% if the material is copper, we should set solve inside to be false and for
% other materials (in general) is should be true.
if (strcmpi(Material, 'copper') || strcmpi(Material, 'pec'))
	fprintf(fid, '\t\t"SolveInside:=", false)\n');
    msg = ['A warning might appear in HFSS due to material assignment ',...
           'change for object ', Name];
    warning('hfssAPI:hfssAssignMaterial', msg);
    fprintf('\n');
else
	fprintf(fid, '\t\t"SolveInside:=", true)\n');
end