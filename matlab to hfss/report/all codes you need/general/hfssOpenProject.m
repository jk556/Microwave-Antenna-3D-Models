% -------------------------------------------------------------------------- %
% function hfssOpenProject(fid, hfssFile)
%
% Description :
% -------------
% This function creates the VB Script necessary to open a specified HFSS 
% project file in HFSS. The FULL PATH of the HFSS project file must be 
% provided for HFSS to properly open the file (and ofcourse, the file must 
% already exist !)
% 
% Parameters :
% ------------
% fid      - file identifier for the VBScript file.
% hfssFile - the (existing) HFSS project file to be opened. The file 
%            specification must include the FULL FILE PATH and the file 
%            extension.
%
% Note :
% ------
% Use this function if you wish to open an already existing HFSS design and 
% add some MATLAB-generated VB script components into it.
%
% -------------------------------------------------------------------------- %



function hfssOpenProject(fid, hfssProjectFile)

[Path, projectName, Ext, Ver] = fileparts(hfssProjectFile);

% Check extension.
if (~strcmp(Ext, '.hfss'))
	warning('File Extension is not .hfss !');
end

% Preamble.
fprintf(fid, 'Dim oHfssApp\n');
fprintf(fid, 'Dim oDesktop\n');
fprintf(fid, 'Dim oProject\n');
fprintf(fid, 'Dim oDesign\n');
fprintf(fid, 'Dim oEditor\n');
fprintf(fid, 'Dim oModule\n');
fprintf(fid, '\n');
fprintf(fid, 'Set oHfssApp  = CreateObject("AnsoftHfss.HfssScriptInterface")\n');
fprintf(fid, 'Set oDesktop = oHfssApp.GetAppDesktop()\n');
fprintf(fid, 'oDesktop.RestoreWindow\n');
fprintf(fid, 'oDesktop.OpenProject "%s"\n', hfssProjectFile);
fprintf(fid, 'Set oProject = oDesktop.SetActiveProject("%s")\n', projectName);
