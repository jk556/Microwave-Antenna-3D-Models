
function hfssIncludePaths(relPath)

if (nargin < 1)
	relPath = '';
end

addpath([relPath, 'boundary/']);
addpath([relPath, '3dmodeler/']);
addpath([relPath, 'analysis/']);
addpath([relPath, 'general/']);
addpath([relPath, 'radiation/']);
addpath([relPath, 'reporter/']);
addpath([relPath, 'fieldsCalculator/']);
addpath([relPath, 'mesh/']);

