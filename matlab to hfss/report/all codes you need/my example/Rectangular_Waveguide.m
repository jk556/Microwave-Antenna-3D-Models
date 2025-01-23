% Rectaungular Waveguide


clc; clear variables; close all;


% Add paths to the required m-files.
addpath('E:\Ansys hfss Project\all codes you need\my example');  

hfssIncludePaths('E:\Ansys hfss Project\all codes you need\');

% HFSS Executable Path.
hfssExePath = 'tempPatch.vbs';

% Script and project files.
tmpPrjFile = [pwd, '\tmpMicrowavePatch.aedt'];
tmpScriptFile = [pwd, '\tempPatch.vbs'];

% Frequency.
c  = 3e8; % m/s
fC = 10e9; % Hz
Lambda = c/fC; % m
	
% Solution parameters (GHz)
fSolve = fC/1e9;
fStart = 9;
fStop  = 11;

% Open a temporary script file.
fid = fopen(tmpScriptFile, 'wt');

% Create a new HFSS project.
hfssNewProject(fid);
hfssInsertDesign(fid, 'Rectangular Waveguide');

% Axis
a = 17;
b = 4;
t = 1;
material_semi = "copper";
material_air = "Rogers RO4003 (tm)";

% Create design

hfssBox(fid, 'waveguide1', [-a/2, -b/2, -3*Lambda*1e3], [a, b, 6*Lambda*1e3], 'm', 0, material_semi);
hfssBox(fid, 'waveguide2', [-a/2 - t, -b/2 - t, -3*Lambda*1e3], [a + 2*t, b + 2*t, 6*Lambda*1e3], 'm', 0, material_semi);
hfssBox(fid, 'air', [-a/2, -b/2, -3*Lambda*1e3], [a, b, 6*Lambda*1e3], 'm', 0, material_air);
hfssRectangle(fid, 'port1', 'Z', [-a/2, -b/2, -3*Lambda*1e3], a, b, 'm');
hfssRectangle(fid, 'port2', 'Z', [-a/2, -b/2, 3*Lambda*1e3], a, b, 'm');

% creare Excition

hfssAssignWavePort(fid, 'port1', '1', 1, 'false', [0 -b/2 -3*Lambda*1e3], [0 b/2 -3*Lambda*1e3], 'm');
hfssAssignWavePort(fid, 'port2', 2, 1, false, [0 0 0], [0 0 0], 'm');

% Insert solution and sweep.

hfssInsertSolution(fid, 'Setup3_75GHz', fC/1e9);
hfssInterpolatingSweep(fid, 'Sweep3to4_5GHz', 'Setup3_75GHz', ...
    fStart, fStop, 1001);

% Save project and close file.

hfssSaveProject(fid, tmpPrjFile, true);
fclose(fid);

% Open HFSS executing the script.

hfssExecuteScript(hfssExePath, tmpScriptFile, false, false);

% Remove paths

hfssRemovePaths('../../');
rmpath('../../');