% ----------------------------------------------------------------------------
% function hfssEnterQty(fid, Qty)
% 
% Description :
% -------------
% Adds a field quantity to the fields calculator's stack.
%
% Parameters :
% ------------
% fid - file identifier of the HFSS script file.
% Qty - field quantity to be entered onto the stack.
% 
% Note :
% ------
%
% Example :
% ---------
% hfssEnterQty(fid, 'E');
% hfssEnterQty(fid, 'H');
% 
% ----------------------------------------------------------------------------

function hfssEnterQty(fid, Qty)

% Arguments processor.
if (nargin < 2)
	error('Insufficient # of arguments !');
end

% Preamble
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("FieldsReporter")\n');

% Command
fprintf(fid, 'oModule.EnterQty "%s"\n', Qty);