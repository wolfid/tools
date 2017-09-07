@echo off
set MODCHK="%~dp0..\Common\modchk%~x0"
call %MODCHK% %1 %QMDLST%_%NMDLST%
if not "%MODRET%"=="" shift
echo ###########################################################
echo ### Get Source Control Revison from: %1
echo ###########################################################
if "%1"=="" goto :EOF
set SVNREV=
call :GETREV %1
if "%SVNREV%"=="" goto :EOF
for /f "delims=| tokens=1,2,3" %%a in ("%SVNREV%") do set svndate=%%c
set svndate=%svndate: =%
set hour=%svndate:~10,2%
set min=%svndate:~13,2%
set sec=%svndate:~16,2%
set timezone=(UTC%svndate:~18,3%:%svndate:~21,2%)
set dd=%svndate:~28,2%
set mmm=%svndate:~30,3%
set yyyy=%svndate:~33,4%
set SVNREV=%SVNREV:~1,5%
if "%2"=="" goto :EOF
%SVNLOG:"=% %SVNLPR:"=% %SVNREV% %1 > %2
goto :EOF
:GETREV
echo ###########################################################
echo ### Parse %SVNLOG% in Function Allows Loop to be Broken
echo ###########################################################
for /f "tokens=* eol=%SVNEOL:"=%" %%i in ('%SVNLOG:"=% %1') do set SVNREV=%%i & exit /b
