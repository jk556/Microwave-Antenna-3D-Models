% ----------------------------------------------------------------------------
% function hfssCalcOp(fid, Op)
% 
% Description :
% -------------
% Performs a calculator operation.
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
% hfssCalcOp(fid, 'Smooth');
%
% ----------------------------------------------------------------------------

function hfssCalcOp(fid, Op)

% Arguments processor.
if (nargin < 2)
	error('Insufficient # of arguments !');
end

% Preamble
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("FieldsReporter")\n');

% Command
fprintf(fid, 'oModule.CalcOp "%s"\n', Op);