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
	Dim project As String = req.GetParameter("p")
	Dim level As String = req.GetParameter("l").ToUpperCase 'I/W/E/F
	'Dim message As String = req.GetParameter("m")
	Dim dir As String = req.GetParameter("d")
    Dim guid As String = req.GetParameter("g")
		
	'Dim stime As String = req.GetParameter("t")

	Dim In As InputStream = req.InputStream
	Dim maxi As Int = In.BytesAvailable
	Dim Buffer(maxi) As Byte
	Dim x As Int = In.ReadBytes(Buffer, 0, maxi)
	Dim message As String = BytesToString(Buffer,0,Buffer.Length,"UTF-8")
	
	Dim text As String = project & "[" & level & "]: " & message
	
	If dir = "" Then	
		dir = Main.BODFolder
	End If
	
	If File.Exists(dir,"") = False Then
		File.MakeDir(dir,"")
	End If
	
	Dim now As Long = DateTime.Now	
	DateTime.DateFormat = "yyyy-MM-dd"
	DateTime.TimeFormat = "HH-mm"
	
	Dim filename As String = DateTime.Date(now) & "-" & DateTime.Time(now) & ".txt"
	Main.Writer.Initialize(File.OpenOutput(dir, filename, True))
	Main.Writer.WriteLine(guid & " - " & text)
	Main.Writer.Flush
End Sub