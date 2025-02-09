% ----------------------------------------------------------------------------
% function hfssExportToFile(fid, ReportName, FileName, Type)
% 
% Description :
% -------------
% Exports the report data to file, so it can be postprocesed.
%
% Parameters :
% ------------
% fid        - file identifier of the HFSS script file.
% ReportName - name of the report to export.
% FileName   - name of the file.
% Type       - There are four possible types:
%               * txt: Post processor format file
%               * csv: Comma-delimited data file
%               * tab: Tab-separated file
%               * dat: Ansoft plot data file
%
% Note :
% ------
% In HFSS's scripting help (scripting.pdf), the example given is:
%   oDesign.ExportToFile "Plot1", "c:\report1.dat"
% However, it is wrong, since it should use oModule, instead of
% oDesign.
%
% Example :
% ---------
% hfssExportToFile(fid, 'Plot1', 'MyData', 'csv'); % Saves in the same dir.
% hfssExportToFile(fid, 'Plot2', 'C:\MyData2', 'tab');
% ----------------------------------------------------------------------------

function hfssExportToFile(fid, ReportName, FileName, Type)

% Arguments processor.
if (nargin < 4)
	error('Insufficient # of arguments !');
end

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("ReportSetup")\n');

% Parameters.
fprintf(fid, 'oModule.ExportToFile "%s", "%s.%s"\n', ReportName, FileName, Type);