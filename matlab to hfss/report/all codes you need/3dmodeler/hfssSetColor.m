
function hfssSetColor(fid, Objects, Color)

if (~iscell(Objects))
    Objects = cellstr(Objects);
end

fprintf(fid, '\n');
fprintf(fid, 'oEditor.ChangeProperty _\n');
fprintf(fid, '\tArray("NAME:AllTabs", _\n');
fprintf(fid, '\t\tArray("NAME:Geometry3DAttributeTab", _\n');
fprintf(fid, '\t\t\tArray("NAME:PropServers", ');

for n = 1:numel(Objects)-1
    fprintf(fid, '"%s", ', Objects{n});
end
fprintf(fid, '"%s"), _\n', Objects{end});

fprintf(fid, '\t\t\tArray("NAME:ChangedProps",  _\n');
fprintf(fid, '\t\t\t\tArray("NAME:Color", "R:=", %d, "G:=", %d, "B:=", %d) _\n', ...
        Color(1), Color(2), Color(3));
fprintf(fid, '\t\t\t) _\n');
fprintf(fid, '\t\t) _\n');
fprintf(fid, '\t) \n');