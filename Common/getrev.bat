@echo off
set MODCHK="%~dp0..\Common\modchk%~x0"
call %MODCHK% %1 %QMDLST%_%NMDLST%
if not "%MODRET%"=="" shift
echo ###########################################################
echo ### Get Source Control Revison from: %1
echo ###########################################################
if "%1"=="" goto :EOF
set SVNPTH=%~1
if "%SVNPTH:~1,1%"==":" %SVNPTH:~0,2%
if "%SVNPTH:~1,1%"==":" set SVNPTH=%SVNPTH:~2%
if not "%SVNPTH%"=="" cd "%SVNPTH%"
set SVNREV=
setlocal enabledelayedexpansion
for /f "eol=-" %%i in ('!SVNLOG!') do if "!SVNREV!"=="" set SVNREV=%%i
endlocal & set SVNREV=%SVNREV%
if "%SVNREV%"=="" goto :EOF
set SVNREV=%SVNREV:~1%
if "%2"=="" goto :EOF
%SVNLOG:"=% %SVNLPR:"=% %SVNREV% > %2
