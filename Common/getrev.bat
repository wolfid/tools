@echo off
set MODCHK="%~dp0..\Common\modchk%~x0"
call %MODCHK% %1 %QMDLST%_%NMDLST%
if not "%MODRET%"=="" shift
echo ###########################################################
echo ### Get Source Control Revison from: %1
echo ###########################################################
if "%~1"=="" goto :EOF
set SVNREV=
call :GETREV %1
if "%SVNREV%"=="" goto :EOF
for /f "delims=| tokens=1,2,3" %%a in ("%SVNREV%") do set SVNDAT=%%c
set SVNDAT=%SVNDAT: =%
set hour=%SVNDAT:~10,2%
set min=%SVNDAT:~13,2%
set sec=%SVNDAT:~16,2%
set timezone=(UTC%SVNDAT:~18,3%:%SVNDAT:~21,2%)
set dd=%SVNDAT:~8,2%
set mm=%SVNDAT:~5,2%
set yyyy=%SVNDAT:~0,4%
set mmm=%SVNDAT:~30,3%
set SVNREV=%SVNREV:~1,5%
if "%~2"=="" goto :EOF
%SVNLOG:"=% %SVNLPR:"=% %SVNREV% %1 > %2
goto :EOF
:GETREV
echo ###########################################################
echo ### Parse %SVNLOG% in Function Allows Loop to be Broken
echo ###########################################################
for /f "tokens=* eol=%SVNEOL:"=%" %%i in ('%SVNLOG:"=% %1') do set SVNREV=%%i & exit /b
