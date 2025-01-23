% ----------------------------------------------------------------------------
% function hfssCalcStack(fid, Op)
% 
% Description :
% -------------
% Performs an operation on the stack.
%
% Parameters :
% ------------
% fid - file identifier of the HFSS script file.
% Op  - operation to be performed.
% 
% Note :
% ------
%
% Example :
% ---------
% hfssCalcOp(fid, 'clear');
%

function hfssCalcStack(fid, Op)

% Arguments processor.
if (nargin < 2)
	error('Insufficient # of arguments !');
end

% Preamble
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("FieldsReporter")\n');

% Command
fprintf(fid, 'oModule.CalcStack "%s"\n', Op);