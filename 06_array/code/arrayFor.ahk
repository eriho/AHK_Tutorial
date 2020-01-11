#k::

myFolders := Object()

myFolders := ["20_Jan","19_Dec","19_Nov"]
thisFileName := "res.csv"

for index, myFolder in myFolders
{
	MsgBox , ループ%index%回目、フォルダ:  %A_ScriptDir%\%myFolder%\%thisfileName% を開きます
	Run, notepad.exe %A_ScriptDir%\%myFolder%\%thisFileName%
	
}

return

#p::
pause
