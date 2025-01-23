% ----------------------------------------------------------------------------
% hfssSubtract(fid, blankParts, toolParts)
%
% Description:
% ------------
% Creates the necessary VB script to subtract a set of tool parts from a set 
% of blank parts, a.k.a., will produce blank parts - tool parts.
%
% Parameters :
% ------------
% fid        - file identifier of the HFSS script file.
% blankParts - a cell array of strings that contain the blank parts.
% toolParts  - a cell array of strings that contain the tool parts.
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssSubtract(fid, {'BigPlate'}, {'SmallPlate'});
%


% Will result in blankParts - toolParts.
function hfssSubtract(fid, blankParts, toolParts, Clone)

if (nargin < 4)
    Clone = [];
end

if isempty(Clone)
    Clone = 'false';
end

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.Subtract _\n');
fprintf(fid, 'Array("NAME:Selections", _\n');

% Add the Blank Parts.
fprintf(fid, '"Blank Parts:=", _\n');
if (iscell(blankParts))
	nBlank = length(blankParts);
	fprintf(fid, '"');
	for iB = 1:nBlank-1
		fprintf(fid, '%s,', blankParts{iB});
	end
	fprintf(fid, '%s", _\n', blankParts{nBlank});
else
	fprintf(fid, '"%s", _\n', blankParts);
end

% Add the Tool Parts.
fprintf(fid, '"Tool Parts:=", _\n');
if (iscell(toolParts))
	nTool = length(toolParts);
	fprintf(fid, '"');
	for iB = 1:nTool-1
		fprintf(fid, '%s,', toolParts{iB});
	end
	fprintf(fid, '%s"), _\n', toolParts{nTool});
else
	fprintf(fid, '"%s"), _\n', toolParts);
end

% Post-Amble.
fprintf(fid, 'Array("NAME:SubtractParameters", _\n');
fprintf(fid, '"KeepOriginals:=", %s) \n', Clone);