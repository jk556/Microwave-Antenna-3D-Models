

function hfssUnite(fid, varargin)

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.Unite  _\n');
fprintf(fid, 'Array("NAME:Selections", _\n');
fprintf(fid, '"Selections:=", ');

% If the first argument is a cell then it contains a cell of strings that must
% be united, else each argument is a cell.
if (iscell(varargin{1}))
	Objects = varargin{1};
else
	Objects = varargin;
end

% Total # of Objects.
nObjects = length(Objects);

% Add the Objects.
fprintf(fid, '"');
for iP = 1:nObjects-1
	fprintf(fid, '%s,', Objects{iP});
end
fprintf(fid, '%s"), _\n', Objects{nObjects});

% Postamble.
fprintf(fid, 'Array("NAME:UniteParameters", "KeepOriginals:=", false)\n');