Dim oHfssApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule

Set oHfssApp  = CreateObject("AnsoftHfss.HfssScriptInterface")
Set oDesktop = oHfssApp.GetAppDesktop()
oDesktop.RestoreWindow
oDesktop.NewProject
Set oProject = oDesktop.GetActiveProject

oProject.InsertDesign "HFSS", "SIW Waveguide Antenna", "DrivenModal", ""
Set oDesign = oProject.SetActiveDesign("SIW Waveguide Antenna")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-18.000000m", _
"YPosition:=", "-45.000000m", _
"ZPosition:=", "-31.000000m", _
"XSize:=", "36.000000m", _
"YSize:=", "90.000000m", _
"ZSize:=", "61.000000m"), _
Array("NAME:Attributes", _
"Name:=", "Air_out", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-18.000000m", _
"YPosition:=", "-2.000000m", _
"ZPosition:=", "-31.000000m", _
"XSize:=", "36.000000m", _
"YSize:=", "4.000000m", _
"ZSize:=", "61.000000m"), _
Array("NAME:Attributes", _
"Name:=", "Air_in1", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-18.000000m", _
"YPosition:=", "2.000000m", _
"ZPosition:=", "-31.000000m", _
"XSize:=", "36.000000m", _
"YSize:=", "1.000000m", _
"ZSize:=", "61.000000m"), _
Array("NAME:Attributes", _
"Name:=", "semi_up1", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-18.000000m", _
"YPosition:=", "-3.000000m", _
"ZPosition:=", "-31.000000m", _
"XSize:=", "36.000000m", _
"YSize:=", "1.000000m", _
"ZSize:=", "61.000000m"), _
Array("NAME:Attributes", _
"Name:=", "semi_down1", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_out", _
"Tool Parts:=", _
"semi_up1"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_out", _
"Tool Parts:=", _
"semi_down1"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_out", _
"Tool Parts:=", _
"Air_in1"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-18.000000m", _
"YPosition:=", "2.000000m", _
"ZPosition:=", "-31.000000m", _
"XSize:=", "36.000000m", _
"YSize:=", "1.000000m", _
"ZSize:=", "61.000000m"), _
Array("NAME:Attributes", _
"Name:=", "semi_up", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-18.000000m", _
"YPosition:=", "-3.000000m", _
"ZPosition:=", "-31.000000m", _
"XSize:=", "36.000000m", _
"YSize:=", "1.000000m", _
"ZSize:=", "61.000000m"), _
Array("NAME:Attributes", _
"Name:=", "semi_down", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-18.000000m", _
"YPosition:=", "-2.000000m", _
"ZPosition:=", "-31.000000m", _
"XSize:=", "36.000000m", _
"YSize:=", "4.000000m", _
"ZSize:=", "61.000000m"), _
Array("NAME:Attributes", _
"Name:=", "Air_in", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-4.250000m", _
"YPosition:=", "2.000000m", _
"ZPosition:=", "-16.000000m", _
"XSize:=", "1.000000m", _
"YSize:=", "1.000000m", _
"ZSize:=", "31.000000m"), _
Array("NAME:Attributes", _
"Name:=", "Air_hole1", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"semi_up", _
"Tool Parts:=", _
"Air_hole1"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-4.250000m", _
"YPosition:=", "2.000000m", _
"ZPosition:=", "-16.000000m", _
"XSize:=", "1.000000m", _
"YSize:=", "1.000000m", _
"ZSize:=", "31.000000m"), _
Array("NAME:Attributes", _
"Name:=", "Air_hole", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.475000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-29.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder1", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.525000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-29.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_1", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder1"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_1"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.400000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-26.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder2", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.600000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-26.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_2", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder2"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_2"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.275000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-23.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder3", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.725000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-23.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_3", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder3"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_3"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.100000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-20.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder4", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.900000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-20.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_4", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder4"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_4"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-7.875000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-17.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder5", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "9.125000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-17.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_5", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder5"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_5"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-7.600000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-14.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder6", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "9.400000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-14.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_6", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder6"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_6"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-7.275000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-11.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder7", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "9.725000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-11.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_7", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder7"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_7"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-6.900000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-8.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder8", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "10.100000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-8.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_8", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder8"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_8"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-6.475000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-5.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder9", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "10.525000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-5.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_9", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder9"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_9"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-6.000000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-2.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder10", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "11.000000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-2.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_10", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder10"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_10"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-6.475000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "1.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder11", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "10.525000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "1.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_11", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder11"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_11"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-6.900000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "4.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder12", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "10.100000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "4.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_12", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder12"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_12"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-7.275000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "7.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder13", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "9.725000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "7.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_13", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder13"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_13"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-7.600000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "10.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder14", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "9.400000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "10.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_14", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder14"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_14"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-7.875000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "13.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder15", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "9.125000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "13.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_15", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder15"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_15"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.100000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "16.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder16", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.900000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "16.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_16", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder16"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_16"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.275000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "19.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder17", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.725000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "19.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_17", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder17"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_17"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.400000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "22.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder18", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.600000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "22.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_18", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder18"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_18"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.475000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "25.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder19", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.525000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "25.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_19", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder19"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_19"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.500000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "28.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder20", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.500000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "28.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_20", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "Rogers RO4003 (tm)", _
"SolveInside:=", true)


oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder20"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"Air_in", _
"Tool Parts:=", _
"cylinder_20"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", false) 

oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.475000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-29.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder1", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.525000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-29.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_1", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.400000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-26.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder2", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.600000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-26.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_2", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.275000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-23.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder3", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.725000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-23.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_3", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.100000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-20.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder4", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.900000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-20.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_4", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-7.875000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-17.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder5", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "9.125000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-17.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_5", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-7.600000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-14.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder6", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "9.400000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-14.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_6", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-7.275000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-11.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder7", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "9.725000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-11.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_7", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-6.900000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-8.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder8", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "10.100000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-8.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_8", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-6.475000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-5.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder9", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "10.525000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-5.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_9", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-6.000000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-2.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder10", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "11.000000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "-2.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_10", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-6.475000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "1.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder11", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "10.525000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "1.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_11", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-6.900000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "4.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder12", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "10.100000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "4.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_12", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-7.275000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "7.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder13", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "9.725000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "7.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_13", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-7.600000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "10.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder14", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "9.400000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "10.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_14", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-7.875000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "13.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder15", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "9.125000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "13.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_15", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.100000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "16.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder16", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.900000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "16.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_16", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.275000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "19.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder17", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.725000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "19.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_17", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.400000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "22.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder18", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.600000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "22.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_18", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.475000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "25.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder19", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.525000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "25.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_19", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "-8.500000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "28.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder20", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


oEditor.CreateCylinder _
Array("NAME:CylinderParameters", _
"XCenter:=", "8.500000m", _
"YCenter:=", "-2.000000m", _
"ZCenter:=", "28.000000m", _
"Radius:=", "1.000000m", _
"Height:=", "4.000000m", _
"WhichAxis:=", "Y"), _
Array("NAME:Attributes", _
"Name:=", "cylinder_20", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "copper", _
"SolveInside:=", true)


Set oModule = oDesign.GetModule("BoundarySetup") 

oModule.AssignWavePort _
Array( _
"NAME:port1", _
"NumModes:=", 1, _
"PolarizeEField:=",  false, _
"DoDeembed:=", false, _
"DoRenorm:=", false, _
Array("NAME:Modes", _
Array("NAME:Mode1", _
"ModeNum:=",  1, _
"UseIntLine:=", true, _
Array("NAME:IntLine", _
"Start:=", _
Array("0.000000m", "-2.000000m", "-90.000000m"), _
"End:=", _
Array("0.000000m", "2.000000m", "-90.000000m") _
), _
"CharImp:=", "Zpi")), _
"Objects:=", Array("1")) 

Set oModule = oDesign.GetModule("BoundarySetup") 

oModule.AssignWavePort _
Array( _
"NAME:port2", _
"NumModes:=", 1, _
"PolarizeEField:=",  false, _
"DoDeembed:=", false, _
"DoRenorm:=", false, _
Array("NAME:Modes", _
Array("NAME:Mode1", _
"ModeNum:=",  1, _
"UseIntLine:=", false) _
), _
"Objects:=", Array("")) 

Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "HfssDriven", _
Array("NAME:Setup3_75GHz", _
"Frequency:=", "10.000000GHz", _
"PortsOnly:=", false, _
"maxDeltaS:=", 0.020000, _
"UseMatrixConv:=", false, _
"MaximumPasses:=", 25, _
"MinimumPasses:=", 1, _
"MinimumConvergedPasses:=", 1, _
"PercentRefinement:=", 20, _
"ReducedSolutionBasis:=", false, _
"DoLambdaRefine:=", true, _
"DoMaterialLambda:=", true, _
"Target:=", 0.3333, _
"PortAccuracy:=", 2, _
"SetPortMinMaxTri:=", false)

Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertDrivenSweep _
"Setup3_75GHz", _
Array("NAME:Sweep3to4_5GHz", _
"Type:=", "Interpolating", _
"InterpTolerance:=", 0.500000, _
"InterpMaxSolns:=", 101, _
"SetupType:=", "LinearCount", _
"StartFreq:=", "9.000000GHz", _
"StopFreq:=", "11.000000GHz", _
"Count:=", 1001, _
"SaveFields:=", false, _
"ExtrapToDC:=", false)

oProject.SaveAs _
    "E:\Ansys hfss Project\all codes you need\tmpMicrowavePatch.aedt", _
    true
