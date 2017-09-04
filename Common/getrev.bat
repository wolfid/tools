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
%SVNUPD:"=%
set SVNREV=
call :GETREV
if "%SVNREV%"=="" goto :EOF
set SVNREV=%SVNREV:~1%
if "%2"=="" goto :EOF
%SVNLOG:"=% %SVNLPR:"=% %SVNREV% > %2
goto :EOF
:GETREV
echo ###########################################################
echo ### Parse %SVNLOG% in Function Allows Loop to be Broken
echo ###########################################################
for /f "eol=%SVNEOL:"=%" %%i in ('%SVNLOG%') do set SVNREV=%%i & exit /b
