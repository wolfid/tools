@echo off
set MODCHK="%~dp0..\%DEVCOM%\modchk%~x0"
call %MODCHK% %1 %QMDLST%_%NMDLST%
if not "%MODRET%"=="" shift
set SVNURL=%1
echo ###########################################################
echo ### Repo Location: %SVNURL:"=%
echo ###########################################################
set CURMAJ=0
set CURMIN=0
for /f %%i in ('%SVNLST:"=% %SVNURL:"=%') do call :SVNTAG %%i
echo ###########################################################
echo ### SVN Tag: %SVNTAG:"=%
echo ###########################################################
goto :END
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
endlocal & set NEWMAJ=%NEWMAJ% & set NEWMIN=%NEWMIN%
set NEWMAJ=%NEWMAJ: =%
set NEWMIN=%NEWMIN: =%
if %NEWMAJ% LSS %CURMAJ% exit /b 0
if %NEWMIN% LSS %CURMIN% exit /b 0
set CURMAJ=%NEWMAJ%
set CURMIN=%NEWMIN%
set SVNTAG=%NEWTAG%
exit /b 0
:END
