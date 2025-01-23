
function hfssInterpolatingSweep(fid, Name, SolutionName, fStartGHz, ...
                                fStopGHz, nPoints, nMaxSols, iTol)

% arguments processor.
if (nargin < 5)
	error('Insufficient # of arguments');
elseif (nargin < 6)
	nPoints = [];
	nMaxSols = [];
	iTol = [];
elseif (nargin < 7)
	nMaxSols = [];
	iTol = [];
elseif (nargin < 8)
	iTol = [];
end

% process default arguments.
if isempty(nPoints)
	nPoints = 1000;
end
if isempty(nMaxSols)
	nMaxSols = 101;
end
if isempty(iTol)
	iTol = 0.5;
end

% create script.
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("AnalysisSetup")\n');

fprintf(fid, 'oModule.InsertDrivenSweep _\n');
fprintf(fid, '"%s", _\n', SolutionName);
fprintf(fid, 'Array("NAME:%s", _\n', Name);
fprintf(fid, '"Type:=", "Interpolating", _\n');
fprintf(fid, '"InterpTolerance:=", %f, _\n', iTol);
fprintf(fid, '"InterpMaxSolns:=", %d, _\n', nMaxSols);
fprintf(fid, '"SetupType:=", "LinearCount", _\n');
fprintf(fid, '"StartFreq:=", "%fGHz", _\n', fStartGHz);
fprintf(fid, '"StopFreq:=", "%fGHz", _\n', fStopGHz);
fprintf(fid, '"Count:=", %d, _\n', nPoints);
fprintf(fid, '"SaveFields:=", false, _\n');
fprintf(fid, '"ExtrapToDC:=", false)\n');