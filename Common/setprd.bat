@echo off
set MODCHK="%~dp0..\Common\modchk%~x0"
call %MODCHK% %1 %QMDLST%_%NMDLST%
if not "%MODRET%"=="" shift
echo ###########################################################
echo ### Search for %2 in %1
echo ###########################################################
for /f "tokens=1,2 delims== eol=#" %%i in (%~1) do if "%%i"=="%2" (
if "%%j"=="%3" (
setlocal enabledelayedexpansion
set PRDCOD=!CODLST[%4]!
set PRDDIR=!DIRLST[%4]!
endlocal & set PRDCOD=%PRDCOD% & set PRDDIR=%PRDDIR%
))
