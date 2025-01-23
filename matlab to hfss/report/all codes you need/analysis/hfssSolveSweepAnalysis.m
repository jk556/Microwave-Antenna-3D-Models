% ----------------------------------------------------------------------------
% function hfssSolveSweepAnalysis(fid, SetupName)
% 
% Description :
% -------------
% Creates the VB script to solve a given sweep analysis setup.
% 
% Parameters :
% ------------
% fid       - file identifier of the HFSS script file.
% SetupName - name of the sweep analysis to be solved.
%
% Note :
% ------
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% hfssSolveSweepAnalysis(fid, 'ParametricSetup');
% ----------------------------------------------------------------------------

function hfssSolveSweepAnalysis(fid, SetupName)

fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("Optimetrics")\n');
fprintf(fid, 'oModule.SolveSetup "%s"\n', SetupName);