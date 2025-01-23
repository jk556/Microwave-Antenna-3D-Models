
function hfssAssignLumpedPort(fid, Name, ObjName, iLStart, iLEnd, Units, ...
                              Resistance, Reactance)

% arguments processor.
if (nargin < 6)
	error('Not Enough Arguments !');
elseif (nargin < 7)
	Resistance = [];
	Reactance = [];
elseif (nargin < 8)
	Reactance = [];
end

% Setup default arguments.
if isempty(Resistance)
	Resistance = 50.0;
end

if isempty(Reactance)
	Reactance = 0.0;
end

% The usual fprintf stuff.
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("BoundarySetup")\n');

fprintf(fid, 'oModule.AssignLumpedPort _\n');
fprintf(fid, 'Array("NAME:%s", _\n', Name);
fprintf(fid, '      Array("NAME:Modes", _\n');
fprintf(fid, '             Array("NAME:Mode1", _\n');
fprintf(fid, '                   "ModeNum:=", 1, _\n');
fprintf(fid, '                   "UseIntLine:=", true, _\n');
fprintf(fid, '                   Array("NAME:IntLine", _\n');
fprintf(fid, '                          "Start:=", Array("%f%s", "%f%s", "%f%s"), _\n', ...
        iLStart(1), Units, iLStart(2), Units, iLStart(3), Units);
fprintf(fid, '                          "End:=",   Array("%f%s", "%f%s", "%f%s") _\n', ...
        iLEnd(1), Units, iLEnd(2), Units, iLEnd(3), Units);
fprintf(fid, '                         ), _\n');
fprintf(fid, '                   "CharImp:=", "Zpi" _\n');
fprintf(fid, '                   ) _\n');
fprintf(fid, '            ), _\n');
fprintf(fid, '      "Resistance:=", "%fOhm", _\n', Resistance);
fprintf(fid, '      "Reactance:=", "%fOhm", _\n', Reactance);
fprintf(fid, '      "Objects:=", Array("%s") _\n', ObjName);
fprintf(fid, '      )\n');