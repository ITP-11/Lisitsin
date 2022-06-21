'* Имя: notepad.vbs
'* Язык: VBScript
'* Описание: лабораторная работа №2
'**********************************************************************************
Dim s
' Выводим строку на экран
do
WScript.StdOut.WriteLine "Menu" 
WScript.StdOut.WriteLine "----------------------------" 
WScript.StdOut.WriteLine "1. Information about author" 
WScript.StdOut.WriteLine "2. Delete soderzhimogo zadannou papki"
WScript.StdOut.WriteLine "3. Create yarluka for call zadannou programm and go on him of desktop" 
WScript.StdOut.WriteLine "4. Exit" 
WScript.StdOut.Write "Choose a task:"
 ' Считываем строку 
s = WScript.StdIn.ReadLine 
 ' Создаем объект WshShell 
Set WshShell = WScript.CreateObject("WScript.Shell")

if (s="1") Then 
    WScript.StdOut.WriteLine "Lisitsin Nikita Sergeevich, ITP-11"
    
elseif (s="2") Then 
'выводим строку на экран
    WScript.StdOut.Write "Input way to file: "
'считываем строку
    k=WScript.StdIn.ReadLine
    On Error Resume Next
    Set WshShell = WScript.CreateObject("WScript.Shell")
    Set objFSO = WScript.CreateObject("Scripting.FileSystemObject")
    Set objFolder = objFSO.GetFolder(k)
    Set colSubfolders = objFolder.Subfolders
    For Each objSubfolder in colSubfolders
    errResults = objSubfolder.Delete
    Next
    Set files_col = objFolder.files
    For each file_obj in files_col
    file_obj.delete(true)
    Next
    WScript.Echo "Operation delete complite successful"

elseif (s="3") Then 
'выводим строку на экран
    WScript.StdOut.Write "Input way to file: "
'считываем строку
    k=WScript.StdIn.ReadLine
'создаем объект WshShell
    Set WshShell=WScript.CreateObject("WScript.Shell")
'создаем ярлык на файл
    Set oShellLink=WshShell.CreateShortcut("Yrlik.lnk")
'устанавливаем путь к файлу
    oShellLink.TargetPath=k
'сохраняем ярлык
    oShellLink.Save
'создаем объект FileSystemObject
    Set FSO=WScript.CreateObject("Scripting.FileSystemObject")
'создаем объект WshShell
    Set WshShell=WScript.CreateObject("WScript.Shell")
'определяем путь к рабочему столу
    PathCopy=WshShell.SpecialFolders("Desktop")
    Set oShellLink=WshShell.CreateShortcut(PathCopy&"\Yelik.lnk")
    oShellLink.TargetPath=k
    oShellLink.Save
    WScript.Echo "Yarluk successful create and go on desktop"
 
End if
loop until (s="4") 
'************* Конец *********************************************
