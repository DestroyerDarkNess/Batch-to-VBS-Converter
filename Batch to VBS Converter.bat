@echo off
Title Batch to VBS Converter 0.2 
set cd=%cd%
set t=%temp%
goto eleminar
:vbs
color b
set codevbs1=ar.writeline "
set codevbs2="
echo.
echo  Escribe el nombre del bat a cambiar a vbs + el formato ".bat o .cmd"
echo.
set /p batavbs= ^>^>^> 
if not exist %batavbs% (goto:err)
type %batavbs% > %t%\bat.txt
 
call :remplace
 
:r
if not exist %t%\batavbs.txt (goto r) 
 
(
echo Const TemporaryFolder ^= 2
echo.
echo Dim fso^: Set fso ^= CreateObject^("Scripting.FileSystemObject"^)
echo.
echo Dim tempFolder^: tempFolder ^= fso^.GetSpecialFolder^(TemporaryFolder^)
echo.
echo set b^=createobject^("wscript.shell"^)
echo Set objfso ^= createobject^("scripting.filesystemobject"^)
echo Set ar^= objfso^.createtextfile^(tempFolder ^& "archivo.bat"^,true^)
echo.
) >> %t%\temp.vbs
 
for /f "tokens=*" %%x in ('type %t%\batavbs.txt') do (echo %codevbs1% %%x %codevbs2%) >> %t%\temp.vbs
type "%t%\temp.vbs
 
(
echo ar^.close
echo b^.run tempFolder ^& "archivo.bat"^, ^1, true
echo ^'Create By Salvador F. Krilewski.
) >> %t%\temp.vbs
copy "%t%\temp.vbs" "%cd%\%batavbs%Converted.vbs"
del "%t%\batavbs.txt"
cls
color a 
echo.
echo Proceso terminado .  yyy y  PUT0 EL QUE LO LEA  jajaja
echo.
if exist "%t%\bat.txt" del "%t%\bat.txt"
if exist "%t%\batavbs.txt" del "%t%\batavbs.txt"
if exist "%t%\archivo.bat" del "%t%\archivo.bat"
if exist "%t%\temp.vbs" del "%t%\temp.vbs"
if exist "%t%\bat2.txt" del "%t%\bat2.txt"
pause & exit
 
:eleminar
if exist "%t%\bat2.txt" del "%t%\bat2.txt"
if exist "%t%\bat.txt" del "%t%\bat.txt"
if exist "%t%\batavbs.txt" del "%t%\batavbs.txt"
if exist "%t%\archivo.bat" del "%t%\archivo.bat"
if exist "%t%\temp.vbs" del "%t%\temp.vbs"
goto vbs
 
:err
cls
color c
echo.
echo EL ARCHIVO QUE ESCRIBISTE NO EXISTE PERRO
ECHO.
pause & exit
 
:remplace
setlocal enabledelayedexpansion
for /f "tokens=* delims=" %%x in ('type %t%\bat.txt') do (
set linea=%%x
set linea=!linea:%%=%%%%!
set linea=!linea:"=""!
call :show !linea!
)
goto:eof
:show 
echo %* >> %t%\batavbs.txt
goto:eof