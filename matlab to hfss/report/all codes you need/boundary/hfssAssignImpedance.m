% ----------------------------------------------------------------------------
% function hfssAssignImpedance(fid, ImpedanceName, SheetObject, Resistance, Reactance, InfGroundPlane)
%
% Written by:
% -----------
% Rounak Singh Narde (rn5949@rit.edu)
%
% Description :
% -------------
% Creates the VB Script necessary to assign a Impedance boundary to a (sheet-like)
% object or face.
%
% Parameters :
% ------------
% fid            - file identifier of the HFSS script file.
% ImpedanceName  - name of the Impedance boundary (will appear under 'Boundaries').
% SheetObject    - name of the (sheet-like) object or face to which the wave port is
%                  to be assigned.
% Resistance     - Resistance value in ohms
% Reactance      - Reactance value in ohms
% InfGroundPlance- If infinite ground plane then true, else false.
%
% Example :
% ---------
% fid = fopen('myantenna.vbs', 'wt');
% ... 
% % Impedance boundary to Face 34 of a box. Resistance=100 and Reactance=0
% and No Infinite GND Plane.
% hfssAssignImpedance(fid, 'Impedance1', '34',100)
%
% % Impedance boundary to Face 34 of a box. Resistance=100 and
% Reactance=50. No Infinite Ground Plane
% hfssAssignImpedance(fid, 'Impedance1', '34',100,50)
% 


function hfssAssignImpedance(fid, ImpedanceName, SheetObject, Resistance, Reactance, InfGroundPlane)
    
    if (nargin < 5)
        Reactance=0;
        InfGroundPlane = 'false';
    elseif (nargin == 5)
        InfGroundPlane = 'false';
    end
    
    % Preamble.
    fprintf(fid, '\n');
    fprintf(fid, 'Set oModule = oDesign.GetModule("BoundarySetup") \n');
    fprintf(fid, '\n');
    fprintf(fid, 'oModule.AssignImpedance _\n');
    fprintf(fid, 'Array( _\n');
    fprintf(fid, '"NAME:%s", _\n', ImpedanceName);
    fprintf(fid, '"Faces:=", Array(%s), _\n', SheetObject);
    fprintf(fid, '"Resistance:=", "%f", _\n', Resistance);
    fprintf(fid, '"Reactance:=", "%f", _\n', Reactance);
    fprintf(fid, '"InfGroundPlane:=", %s)\n', InfGroundPlane);

end