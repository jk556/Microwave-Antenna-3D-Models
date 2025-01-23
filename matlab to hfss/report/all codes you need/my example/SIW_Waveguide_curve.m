% SIW Waveguide


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
hfssInsertDesign(fid, 'SIW Waveguide');

% Axis
a = 17;
b = 4;
t = 1;
r = 1;
d = 1;
material_semi = "copper";
material_air = "Rogers RO4003 (tm)";

% Create design

hfssBox(fid, 'Air', [-a - r, -b/2, -1e3*Lambda - d], [2*a + 2*r, b, 2e3*Lambda + d], 'm', 0, material_air);
hfssBox(fid, 'semi_up', [-a - r, b/2, -1e3*Lambda - d], [2*a + 2*r, t, 2e3*Lambda + d], 'm', 0, material_semi);
hfssBox(fid, 'semi_down', [-a - r, -b/2 - t, -1e3*Lambda - d], [2*a + 2*r, t, 2e3*Lambda + d], 'm', 0, material_semi);

% i = 1;
% name = string("cylinder"+i);
% name_ = string("cylinder_"+i);
% hfssCylinder(fid, name, 'Y', [-a/2, -b/2, -1e3*Lambda + (2*i-1)*r + d], r, b, 'm');
% hfssSubtract(fid, 'Air', name, 'false');
% hfssCylinder(fid, name, 'Y', [-a/2, -b/2, -1e3*Lambda + (2*i-1)*r + d], r, b, 'm');
% 
% hfssCylinder(fid, name_, 'Y', [a/2, -b/2, -1e3*Lambda + (2*i-1)*r + i*d], r, b, 'm');

for i = 1:floor(2e3*Lambda/(2*r + d))
    name = string("cylinder"+i);
    name_ = string("cylinder_"+i);
    s = 0.05*(floor(2e3*Lambda/(2*r + d))/2 - abs(floor(2e3*Lambda/(2*r + d))/2 - i))^2; 
    hfssCylinder(fid, name, 'Y', [-a/2 + s, -b/2, -1e3*Lambda + (2*i-1)*r + (i-1)*d], r, b, 'm', material_air);
    hfssSubtract(fid, 'Air', name, 'false');
    hfssCylinder(fid, name_, 'Y', [a/2 + s, -b/2, -1e3*Lambda + (2*i-1)*r + (i-1)*d], r, b, 'm', material_air);
    hfssSubtract(fid, 'Air', name_, 'false');
end

for i = 1:floor(2e3*Lambda/(2*r + d))
    name = string("cylinder"+i);
    name_ = string("cylinder_"+i);
    s = 0.05*(floor(2e3*Lambda/(2*r + d))/2 - abs(floor(2e3*Lambda/(2*r + d))/2 - i))^2;
    hfssCylinder(fid, name, 'Y', [-a/2 + s, -b/2, -1e3*Lambda + (2*i-1)*r + (i-1)*d], r, b, 'm', material_semi);

    hfssCylinder(fid, name_, 'Y', [a/2 + s, -b/2, -1e3*Lambda + (2*i-1)*r + (i-1)*d], r, b, 'm', material_semi);
end

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