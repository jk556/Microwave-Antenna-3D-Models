% ----------------------------------------------------------------------------
% function hfssAddMaterial(fid, Name, Er, bSigma, tanDelta)
%
% Description :
% -------------
% Creates VB Script necessary to add a new material to the HFSS Materials
% Manager.
%
% Parameters :
% ------------
% fid      - file identifier of the HFSS script file.
% Name     - name of the material to be added.
% Er       - dielectric constant of the material to be added.
% bSigma   - bulk conductivity of the material to be added (Siemens)
% tanDelta - loss tangent of the material.
% 
% Note :
% ------
% If a material with the given name already exists in HFSS, this code will
% have no effect and the script will continue running. A warning message will
% appear in the HFSS message log.
%
% Example :
% ---------
% fid = fopen('Dipole.vbs', 'wt');
% ...
% hfssAddMaterial(fid, 'CoaxDielectric', 2.07, 0, 0);
% ----------------------------------------------------------------------------


function hfssAddMaterial(fid, Name, Er, bSigma, tanDelta)

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oProject.AddMaterial _\n');

% Name.
fprintf(fid, 'Array("NAME:%s", _\n', Name);

% Dielectric Properties.
fprintf(fid, '"permittivity:=", "%f", _\n', Er);
fprintf(fid, '"conductivity:=", "%f", _\n', bSigma); 
fprintf(fid, '"dielectric_loss_tangent:=", "%f")\n', tanDelta);