B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=4.2
@EndOfDesignText@
'Handler class
Sub Class_Globals
	
End Sub

Public Sub Initialize
	
End Sub

Sub Handle(req As ServletRequest, resp As ServletResponse)
	If Main.Writer.IsInitialized Then
		Main.Writer.Close
		resp.Write("OK")
	Else
		resp.Write("KO")
	End If
End Sub