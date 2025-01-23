% ----------------------------------------------------------------------------
% function hfssCloseActiveProject(fid)
% 
% Description :
% -------------
% Create the VB Script necessary to close the active project. The unsaved 
% changes made so far will be IGNORED.
%
% Parameters :
% ------------
% fid     - file identifier of the HFSS script file.
% 
% Note :
% ------
% To repeat, the unsaved changes will be ignored. Use hfssSaveProject() 
% before this if you wish to retain all the changes that you did.
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssCloseActiveProject(fid);
%


function hfssCloseActiveProject(fid)

fprintf(fid, '\n');
fprintf(fid, 'Set oProject = oDesktop.GetActiveProject()\n');
fprintf(fid, 'oProject.Close\n');