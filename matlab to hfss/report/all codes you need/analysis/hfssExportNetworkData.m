% ----------------------------------------------------------------------------
% function hfssExportNetworkData(fid, fileName, setupName, sweepName, ...
%                                [expFileType], [renormZ])
% 
% Description :
% -------------
% Creates the VB Script necessary for HFSS to export the current matrix data
% (S, Z, f) into a data file.
%
% Parameters :
% ------------
% fid       - file identifier of the HFSS script file.
% fileName  - output data file name.
% setupName - the name of the Solution Setup whose solution data needs to
%             be exported.
% sweepName - the name of the Frequency Sweep whose solution data needs to 
%             be exported.
% [expFileType] - (optional), the output file format (the default is an 
%                 m-file). Specify as:
%                 'h' - HFSS 8.x format (.szg)
%                 't' - Tab delimited spreadsheet format (.tab)
%				  's' - Touchstone SnP format (.sNp)
%				  'c' - CitiFile (.cit)
%				  'm' - MATLAB File (.m ) - default.
%                 'z' - Terminal Z0 spreadsheet.
% [renormZ]     - (optional), the re-normalizing impedance (if different from
%                  50 Ohms). The default is (ofcourse) 50.
% 
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssExportNetworkData(fid, 'C:\temp\tempData.m', 'Setup150MHz', ...
%                       'Sweep100to200MHz', 'm', 75);
%
% ----------------------------------------------------------------------------


function hfssExportNetworkData(fid, fileName, setupName, sweepName, ...
                               varargin)

% Export File Type - default is MATLAB.
if (length(varargin) > 0)
	expFileType = varargin{1};
else
	expFileType = 'm';
end

% Renormalizing Impedance.
if (length(varargin) > 1)
	renormZ = varargin{2};
else
	renormZ = 50.0;
end

% Export File Type Switch.
switch (expFileType)
	case 'h', expType = 1;
	case 't', expType = 2;
	case 's', expType = 3;
	case 'c', expType = 4;
	case 'm', expType = 7;
	case 'z', expType = 8;
	otherwise, error('Export File Type Unknown !');
end

% The usual fprintf()'s
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("Solutions")\n');
fprintf(fid, 'oModule.ExportNetworkData _\n');
fprintf(fid, '        "", _\n');
fprintf(fid, '        Array("%s:%s"), _\n', setupName, sweepName);
fprintf(fid, '        %d,  _\n', expType);
fprintf(fid, '        "%s", _\n', fileName);
fprintf(fid, '        Array("All"),  _\n');
fprintf(fid, '        true, _\n');
fprintf(fid, '        %.2f \n', renormZ);