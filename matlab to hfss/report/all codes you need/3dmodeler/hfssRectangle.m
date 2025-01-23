
function hfssRectangle(fid, Name, Axis, Start, Width, Height, Units)

Transparency = 0.75;

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreateRectangle _\n');

% Rectangle Parameters.
fprintf(fid, 'Array("NAME:RectangleParameters", _\n');
fprintf(fid, '"IsCovered:=", true, _\n');
fprintf(fid, '"XStart:=", "%f%s", _\n', Start(1), Units);
fprintf(fid, '"YStart:=", "%f%s", _\n', Start(2), Units);
fprintf(fid, '"ZStart:=", "%f%s", _\n', Start(3), Units);

fprintf(fid, '"Width:=", "%f%s", _\n', Width, Units);
fprintf(fid, '"Height:=", "%f%s", _\n', Height, Units);

fprintf(fid, '"WhichAxis:=", "%s"), _\n', upper(Axis));

% Rectangle Attributes.
fprintf(fid, 'Array("NAME:Attributes", _\n');
fprintf(fid, '"Name:=", "%s", _\n', Name);
fprintf(fid, '"Flags:=", "", _\n');
fprintf(fid, '"Color:=", "(132 132 193)", _\n');
fprintf(fid, '"Transparency:=", %d, _\n', Transparency);
fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
fprintf(fid, '"MaterialName:=", "vacuum", _\n');
fprintf(fid, '"SolveInside:=", true)\n');