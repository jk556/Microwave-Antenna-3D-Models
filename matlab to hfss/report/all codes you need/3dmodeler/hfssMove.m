
function hfssMove(fid, ObjectList, tVector, Units)

nObjects = length(ObjectList);

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.Move _\n');
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

% Transalation Vector.
fprintf(fid, 'Array("NAME:TranslateParameters", _\n');
fprintf(fid, '"TranslateVectorX:=", "%f%s", _\n', tVector(1), Units);
fprintf(fid, '"TranslateVectorY:=", "%f%s", _\n', tVector(2), Units);
fprintf(fid, '"TranslateVectorZ:=", "%f%s")\n', tVector(3), Units);