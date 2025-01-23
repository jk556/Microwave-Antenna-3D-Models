
function hfssSaveProject(fid, projectFile, Overwrite)

% arguments processor.
if (nargin < 2)
	error('Insufficient # of arguments !');
elseif (nargin < 3)
	Overwrite = [];
end

% default arguments.
if isempty(Overwrite)
	Overwrite = false;
end

% create the script.
fprintf(fid, '\n');
fprintf(fid, 'oProject.SaveAs _\n');
fprintf(fid, '    "%s", _\n', projectFile);
if (Overwrite)
    fprintf(fid, '    true\n');
else
    fprintf(fid, '    false\n');
end