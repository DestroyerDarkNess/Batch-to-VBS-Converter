# Batch-to-VBS-Converter
Convert .bat files to .vbs

Example :

 ---------------- Before (example.bat):
 
 ```batchfile
@echo off
echo/ & echo Hi, guys. & echo/
pause & exit
```

 ---------------- After (example.bat):
 
 ```batchfile
Const TemporaryFolder = 2

Dim fso: Set fso = CreateObject("Scripting.FileSystemObject")

Dim tempFolder: tempFolder = fso.GetSpecialFolder(TemporaryFolder)

set b=createobject("wscript.shell")
Set objfso = createobject("scripting.filesystemobject")
Set ar= objfso.createtextfile(tempFolder & "archivo.bat",true)

ar.writeline " @echo off  "
ar.writeline " echo/ " : ar.writeline " echo Hi, guys. " : ar.writeline " echo/  "
ar.writeline " pause " : ar.writeline " exit  "
ar.close
b.run tempFolder & "archivo.bat", 1, true
'Create By Salvador F. Krilewski.
```
