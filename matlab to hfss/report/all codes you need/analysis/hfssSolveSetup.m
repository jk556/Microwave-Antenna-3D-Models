% ----------------------------------------------------------------------------
% function hfssSolveSetup(fid, SetupName)
% 
% Description :
% -------------
% Creates the VB script to solve a given solution setup.
% 
% Parameters :
% ------------
% fid       - file identifier of the HFSS script file.
% SetupName - name of the setup to be solved.
%
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssSolveSetup(fid, 'Setup750MHz');
% ----------------------------------------------------------------------------



function hfssSolveSetup(fid, SetupName)

fprintf(fid, '\n');
fprintf(fid, 'oDesign.Solve _\n');
fprintf(fid, '    Array("%s") \n', SetupName);