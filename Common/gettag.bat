@echo off
set MODCHK="%~dp0..\Common\modchk%~x0"
call %MODCHK% %1 %QMDLST%_%NMDLST%
if not "%MODRET%"=="" shift
if "%~1"=="" goto :EOF
set SCSTAG=
echo ###########################################################
echo ### Get Latest Tag From: %TAGLST:"=% %1
echo ###########################################################
for /f %%i in ('%TAGLST:"=% %~1') do set SCSTAG=%%i
