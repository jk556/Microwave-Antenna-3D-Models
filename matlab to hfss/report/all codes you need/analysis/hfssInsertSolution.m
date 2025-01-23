
function hfssInsertSolution(fid, Name, fGHz, maxDeltaS, maxPass, minPass,...
                            minConvPass, MaxRef)

% arguments processor.
if (nargin < 3)
	error('Insufficient number of arguments !');
elseif (nargin < 4)
	maxDeltaS = [];
	maxPass = [];
    minPass = [];
    minConvPass = [];
    MaxRef = [];
elseif (nargin < 5)
	maxPass = [];
    minPass = [];
    minConvPass = [];
    MaxRef = [];
elseif (nargin < 6)
    minPass = [];
    minConvPass = [];
    MaxRef = [];
elseif (nargin < 7)
    minConvPass = [];
    MaxRef = [];
elseif (nargin < 8)
    MaxRef = [];
end

% defaults processing.
if isempty(maxDeltaS)
	maxDeltaS = 0.02;
end
if isempty(maxPass)
	maxPass = 25;
end
if isempty(minPass)
    minPass = 1;
end
if isempty(minConvPass)
    minConvPass = 1;
end
if isempty(MaxRef)
    MaxRef = 20;
end

% create the necessary script.
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("AnalysisSetup")\n');
fprintf(fid, 'oModule.InsertSetup "HfssDriven", _\n');
fprintf(fid, 'Array("NAME:%s", _\n', Name);
fprintf(fid, '"Frequency:=", "%fGHz", _\n', fGHz);
fprintf(fid, '"PortsOnly:=", false, _\n');
fprintf(fid, '"maxDeltaS:=", %f, _\n', maxDeltaS);
fprintf(fid, '"UseMatrixConv:=", false, _\n');
fprintf(fid, '"MaximumPasses:=", %d, _\n', maxPass);
fprintf(fid, '"MinimumPasses:=", %d, _\n', minPass);
fprintf(fid, '"MinimumConvergedPasses:=", %d, _\n', minConvPass);
fprintf(fid, '"PercentRefinement:=", %d, _\n', MaxRef);
fprintf(fid, '"ReducedSolutionBasis:=", false, _\n');
fprintf(fid, '"DoLambdaRefine:=", true, _\n');
fprintf(fid, '"DoMaterialLambda:=", true, _\n');
fprintf(fid, '"Target:=", 0.3333, _\n');
fprintf(fid, '"PortAccuracy:=", 2, _\n');
fprintf(fid, '"SetPortMinMaxTri:=", false)\n');