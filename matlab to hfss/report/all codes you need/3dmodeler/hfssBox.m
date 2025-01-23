
function hfssBox(fid, Name, Start, Size, Units, varargin, material)

if (nargin < 7)
	material = "vacume"; 
end

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreateBox _\n');

% Box Parameters.
fprintf(fid, 'Array("NAME:BoxParameters", _\n');
fprintf(fid, '"XPosition:=", "%f%s", _\n', Start(1), Units);
fprintf(fid, '"YPosition:=", "%f%s", _\n', Start(2), Units);
fprintf(fid, '"ZPosition:=", "%f%s", _\n', Start(3), Units);
fprintf(fid, '"XSize:=", "%f%s", _\n', Size(1), Units);
fprintf(fid, '"YSize:=", "%f%s", _\n', Size(2), Units);
fprintf(fid, '"ZSize:=", "%f%s"), _\n', Size(3), Units);

% Box Attributes.
fprintf(fid, 'Array("NAME:Attributes", _\n');
fprintf(fid, '"Name:=", "%s", _\n', Name);
fprintf(fid, '"Flags:=", "", _\n');
fprintf(fid, '"Color:=", "(132 132 193)", _\n');
fprintf(fid, '"Transparency:=", 0.75, _\n');
fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
fprintf(fid, '"MaterialName:=", "%s", _\n', material);
fprintf(fid, '"SolveInside:=", true)\n');

% Add Holes.
nHoles = length(varargin)/3;

% For each Hole Request create cylinder that satisfies the request and then 
% subtract it from the Box.
for iH = 1:nHoles
	Center = varargin{3*(iH-1) + 1};
	Radius = varargin{3*(iH-1) + 2};
	Axis   = upper(varargin{3*(iH-1) + 3});
    
	switch(Axis)
		case 'X'
			Center(1) = Start(1);
			Length = Size(1);
		case 'Y'
			Center(2) = Start(2);
			Length = Size(2);
		case 'Z' 
			Center(3) = Start(3);
			Length = Size(3);
	end
	
	hfssCylinder(fid, strcat(Name, '_subhole', num2str(iH)), Axis, ... 
	             Center, Radius, Length, Units);
	hfssSubtract(fid, Name, strcat(Name, '_subhole', num2str(iH)));
end