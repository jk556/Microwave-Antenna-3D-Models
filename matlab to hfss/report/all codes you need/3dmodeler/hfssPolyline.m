% -------------------------------------------------------------------------- %
% function hfssPolyline(fid, Name, Points, Units)
% Description:
% ------------
%
% Parameters:
% -----------
% Name - Name Attribute for the PolyLine.
% Points - Points as 3-Tuples, ex: Points = [0, 0, 1; 0, 1, 0; 1, 0 1];
%          Note: size(Points) must give [nPoints, 3]
% Units - can be either:
%         'mm' - millimeter.
%         'in' - inches.
%         'mil' - mils.
%         'meter' - meter (note: don't use 'm').
%          or anything that Ansoft HFSS supports.


function hfssPolyline(fid, Name, Points, Units, Closed, segmentType, ...
                     Color, Transparency)
if (nargin < 5)
    Closed = [];
	segmentType = [];
	Color = [];
	Transparency = [];
elseif (nargin < 6)
    segmentType = [];
	Color = [];
	Transparency = [];
elseif (nargin < 7)
    Color = [];
	Transparency = [];
elseif (nargin < 8)
    Transparency = [];
end

if isempty(Closed)
    Closed = 'false';
end
if isempty(segmentType)
	segmentType = 'Line';
end
if isempty(Color)
	Color = [0, 0, 0];
end
if isempty(Transparency)
	Transparency = 0.8;
end

nPoints = length(Points(:, 1));

% Preamble.
fprintf(fid, '\n');
fprintf(fid, 'oEditor.CreatePolyline _\n');
fprintf(fid, '\tArray("NAME:PolylineParameters", ');
fprintf(fid, '"IsPolylineCovered:=", true, ');
if (Closed == true)
    fprintf(fid, '"IsPolylineClosed:=", true, _\n');
else
    fprintf(fid, '"IsPolylineClosed:=", false, _\n');
end

% Enter the Points.
fprintf(fid, '\t\tArray("NAME:PolylinePoints", _\n');
for iP = 1:nPoints-1
	fprintf(fid, '\t\t\tArray("NAME:PLPoint", ');
	fprintf(fid, '"X:=", "%.4f%s", ', Points(iP, 1), Units);
	fprintf(fid, '"Y:=", "%.4f%s", ', Points(iP, 2), Units);
	fprintf(fid, '"Z:=", "%.4f%s"), _\n', Points(iP, 3), Units);
end
fprintf(fid, '\t\t\tArray("NAME:PLPoint", ');
fprintf(fid, '"X:=", "%.4f%s",   ', Points(nPoints, 1), Units);
fprintf(fid, '"Y:=", "%.4f%s",   ', Points(nPoints, 2), Units);
fprintf(fid, '"Z:=", "%.4f%s")_\n', Points(nPoints, 3), Units);
fprintf(fid, '\t\t\t), _ \n');

% Create Segments.
fprintf(fid, '\t\tArray("NAME:PolylineSegments", _\n');
for iP = 1:nPoints-2
    fprintf(fid, '\t\t\tArray("NAME:PLSegment", ');
    fprintf(fid, '"SegmentType:=",  "%s", ', segmentType);
    fprintf(fid, '"StartIndex:=", %d, ', iP-1);
    fprintf(fid, '"NoOfPoints:=", 2), _\n');
end
fprintf(fid, '\t\t\tArray("NAME:PLSegment", ');
fprintf(fid, '"SegmentType:=",  "%s", ', segmentType);
fprintf(fid, '"StartIndex:=", %d, ', iP);
fprintf(fid, '"NoOfPoints:=", 2) _\n');
fprintf(fid, '\t\t\t) _\n');
fprintf(fid, '\t\t), _\n');

% Polyline Attributes.
fprintf(fid, 'Array("NAME:Attributes", _\n');
fprintf(fid, '"Name:=", "%s", _\n', Name);
fprintf(fid, '"Flags:=", "", _\n');
fprintf(fid, '"Color:=", "(%d %d %d)", _\n', Color(1), Color(2), Color(3));
fprintf(fid, '"Transparency:=", %f, _\n', Transparency);
fprintf(fid, '"PartCoordinateSystem:=", "Global", _\n');
fprintf(fid, '"MaterialName:=", "vacuum", _\n');
fprintf(fid, '"SolveInside:=", true)\n');