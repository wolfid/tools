@echo off
set MODCHK="%~dp0..\Common\modchk%~x0"
call %MODCHK% %1 %QMDLST%_%NMDLST%
if not "%MODRET%"=="" shift
echo ###########################################################
echo ### Get Source Control Revison from: %1
echo ###########################################################
if "%~1"=="" goto :END
set SCSREV=
if "%SCSGIT%"=="y" goto :SCSGIT
if not "%SCSTAG%"=="" goto :GOTTAG
call :GETTAG %1
call :GETREV "%~1/%SCSTAG:"=%"
goto :SCSREV
:GOTTAG
call :GETREV "%~1"
:SCSREV
if "%SCSREV%"=="" goto :END
for /f "delims=| tokens=1,2,3" %%a in ("%SCSREV%") do set SVNDAT=%%c
set SVNDAT=%SVNDAT: =%
set hour=%SVNDAT:~10,2%
set min=%SVNDAT:~13,2%
set sec=%SVNDAT:~16,2%
set timezone=(UTC%SVNDAT:~18,3%:%SVNDAT:~21,2%)
set dd=%SVNDAT:~8,2%
set mm=%SVNDAT:~5,2%
set yyyy=%SVNDAT:~0,4%
set mmm=%SVNDAT:~30,3%
set SCSREV=%SCSREV:~1,5%
if "%~2"=="" goto :END
%SVNLOG:"=% %SVNLPR:"=% %SCSREV% %1 > %2
goto :END
:GETTAG
set SCSPTH=%1
set CURMAJ=0
set CURMIN=0
for /f %%i in ('%SVNLST:"=% %SCSPTH:"=%') do call :SCSTAG %%i
exit /b 0
:SCSTAG
set NEWTAG=%1
set NEWTAG=%NEWTAG:~0,-1%
set TAGDEX=1
setlocal enabledelayedexpansion
:TAGLOP
if "!NEWTAG:~%TAGDEX%,1!"=="." goto :TAGDOT
set /a TAGDEX+=1
goto :TAGLOP
:TAGDOT
set NEWMAJ=!NEWTAG:~0,%TAGDEX%!
set /a TAGDEX+=1
set NEWMIN=!NEWTAG:~%TAGDEX%!
endlocal & set NEWMAJ=%NEWMAJ% & set NEWMIN=%NEWMIN%
set NEWMAJ=%NEWMAJ: =%
set NEWMIN=%NEWMIN: =%
if %NEWMAJ% LSS %CURMAJ% exit /b 0
if %NEWMIN% LSS %CURMIN% exit /b 0
set CURMAJ=%NEWMAJ%
set CURMIN=%NEWMIN%
set SCSTAG=%NEWTAG%
exit /b 0
:GETREV
for /f "tokens=* eol=%SVNEOL:"=%" %%i in ('%SVNLOG:"=% %1') do set SCSREV=%%i & exit /b 0
exit /b 0
:SCSGIT
set SCSPTH=%~1
if "%SCSPTH:~1,1%"==":" (%SCSPTH:~0,2% && cd %SCSPTH:~2%
) else cd %SCSPTH%
for /f "tokens=*" %%i in ('git log -1 --pretty^=format:"%%h"') do set SCSREV=%%i
for /f "tokens=*" %%i in ('git log -1 --pretty^=format:"%%ai"') do set SCSDAT=%%i
set yyyy=%SCSDAT:~0,4%
set mm=%SCSDAT:~5,2%
set dd=%SCSDAT:~8,2%
for /f "tokens=*" %%i in ('git tag') do set SCSTAG=%%i
if "%~2"=="" goto :END
for /f "tokens=*" %%i in ('git log -1 --pretty^=format:"%%s"') do echo %%i > %2
:END
