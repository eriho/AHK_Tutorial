#k::

myFolders := Object()

myFolders := ["20_Jan","19_Dec","19_Nov"]
thisFileName := "res.csv"

for index, myFolder in myFolders
{
	MsgBox , ���[�v%index%��ځA�t�H���_:  %A_ScriptDir%\%myFolder%\%thisfileName% ���J���܂�
	Run, notepad.exe %A_ScriptDir%\%myFolder%\%thisFileName%
	
}

return

#p::
pause
