@echo off
call %~dp0nppenv%~x0
call %~dp0setenv%~x0
for /f "tokens=*" %%i in (%~dp0setenv%~x0) do call :GENENV "%%i" "%CNFPTH:"=%\%CNFTLS:"=%"
for /f "tokens=*" %%i in (%~dp0prjlst) do call :PRJDIR "%%i" "%CNFPTH:"=%\%CNFDIR:"=%" %%~dp0 %%~x0
goto :EOF
:PRJDIR
set DEVPRJ=%~1
call %~3%~1\setenv%~4
for /f "tokens=*" %%i in (%~3\%~1\setenv%~4) do call :GENENV "%%i" "%%~2\%%~1"
exit /b 0
:GENENV
set ENVDET=%1
:DETLPP
if [^%ENVDET:~-1%]==[^"] goto :GOTDET
shift
set ENVDET="%ENVDET% %1"
set ENVDET=%ENVDET:~1,-1%
goto :DETLPP
:GOTDET
set ENVDEX=11
setlocal EnableDelayedExpansion
:EQULPP
if "!ENVDET:~%ENVDEX%,1!"=="=" goto :GOTEQU
set /a ENVDEX+=1
goto :EQULPP
:GOTEQU
set ENVLEN=%ENVDEX%
set /a ENVLEN-=5
set /a ENVDEX+=1
echo !ENVDET:~%ENVDEX%,-1!>"%~2\!ENVDET:~5,%ENVLEN%!.ini"
endlocal
exit /b 0
