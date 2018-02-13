@echo off
set MODCHK="%~dp0..\Common\modchk%~x0"
call %MODCHK% %1 %QMDLST%_%NMDLST%
if not "%MODRET%"=="" shift
if "%~1"=="" goto :END
echo ###########################################################
echo ### Get Source Control Revision from: %1
echo ###########################################################
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
for /f "delims=| tokens=1,2,3" %%a in ("%SCSREV%") do set SCSDAT=%%c
set SCSREV=%SCSREV:~1,5%
set SCSDAT=%SCSDAT: =%
goto :SCSDAT
:GETTAG
set SCSPTH=%1
set CURMAJ=0
set CURMIN=0
for /f %%i in ('%SVNLST:"=% %SCSPTH:"=%') do call :SVNTAG %%i
exit /b 0
:SVNTAG
set NEWTAG=%1
set NEWTAG=%NEWTAG:~0,-1%
set TAGDEX=1
setlocal enabledelayedexpansion
:SVNLOP
if "!NEWTAG:~%TAGDEX%,1!"=="." goto :SVNDOT
set /a TAGDEX+=1
goto :SVNLOP
:SVNDOT
set NEWMAJ=!NEWTAG:~0,%TAGDEX%!
set /a TAGDEX+=1
set NEWMIN=!NEWTAG:~%TAGDEX%!
endlocal & set NEWMAJ=%NEWMAJ%& set NEWMIN=%NEWMIN%
if %NEWMAJ% lss %CURMAJ% exit /b 0
if %NEWMAJ% equ %CURMAJ% goto :SVNMIN
set CURMAJ=%NEWMAJ%
set CURMIN=0
:SVNMIN
if %NEWMIN% leq %CURMIN% goto :SVNRET
set CURMIN=%NEWMIN%
:SVNRET
set SCSTAG=%CURMAJ%.%CURMIN%
exit /b 0
:GETREV
for /f "tokens=* eol=%SVNEOL:"=%" %%i in ('%SVNLOG:"=% %1') do set SCSREV=%%i & exit /b 0
exit /b 0
:SCSGIT
set SCSPTH=%~1
if "%SCSPTH:~1,1%"==":" (%SCSPTH:~0,2% && cd %SCSPTH:~2%
) else cd %SCSPTH%
if "%SCSTAG%"=="" for /f "tokens=*" %%i in ('git tag') do set SCSTAG=%%i
for /f "tokens=*" %%i in ('git log -1 --pretty^=format:"%%h"') do set SCSREV=%%i
for /f "tokens=*" %%i in ('git log -1 --pretty^=format:"%%ai"') do set SCSDAT=%%i
:SCSDAT
set yyyy=%SCSDAT:~0,4%
set mm=%SCSDAT:~5,2%
set dd=%SCSDAT:~8,2%
:END
