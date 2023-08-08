' ----------------------------------------------
' Script Recorded by Ansys Electronics Desktop Version 2022.2.0
' 15:54:00  Aug 07, 2023
' ----------------------------------------------
Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
Set oAnsoftApp = CreateObject("Ansoft.ElectronicsDesktop")
Set oDesktop = oAnsoftApp.GetAppDesktop()
oDesktop.RestoreWindow
Set oProject = oDesktop.SetActiveProject("c_core_for_matlab")
Set oDesign = oProject.SetActiveDesign("c_core_for_matlab")

'matlab

oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", Array("NAME:PropServers",  _
  "LocalVariables"), Array("NAME:ChangedProps", Array("NAME:g", "Value:=", cstr(g) + "mm"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", Array("NAME:PropServers",  _
  "LocalVariables"), Array("NAME:ChangedProps", Array("NAME:N", "Value:=", cstr(N)))))

oProject.Save
oDesign.Analyze "Setup1"

Set oModule = oDesign.GetModule("ReportSetup")
oModule.ExportToFile "Calculator Expressions Plot 1", directory + file_name, false


