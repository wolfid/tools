@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set MODCHK="%~dp0..\%DEVCOM%\modchk%~x0"
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV%
call %MODCHK% %1 %QMDLST%
set SRCURL="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%2"
echo ###########################################################
echo ### Repo Location: %SRCURL:"=%
echo ###########################################################
for /f %%i in ('%SVNLST:"=% %SRCURL:"=%') do set SVNTAG=%%i
if "%SVNTAG%"=="" goto :ERRTAG
set SVNTAG=%SVNTAG:~0,-1%
echo ###########################################################
echo ### SVN Tag: %SVNTAG%
echo ###########################################################
call %GETREV% %1 "%SRCURL:"=%/%SVNTAG%"
if "%SVNREV%"=="" goto :ERRREV
echo ###########################################################
echo ### SVN Revision: %SVNREV%
echo ###########################################################
set PRJPTH="%PRJDRV%:\%SUBDIR:"=%\%~2"
set PRJPTH=%PRJPTH:/=\%\%SVNTAG%
call %PRDCHK%
if "%BDVNAM%"=="" goto :END
set VERPTH="%PRJPTH:"=%\%BDVNAM%.%VEREXT%"
echo ###########################################################
echo ### Build Version File: %VERPTH%
echo ###########################################################
if not "%3"=="" (set BLDLVL=%BLDLPD%) else if "%SVNTAG:~-1%"=="0" (set BLDLVL=%BLDLFL%) else set BLDLVL=%BLDLRC%
set BLDVER=%PRDCOD%_%BLDTYP%_%BRDCOD%_%BLDLVL%_%SVNTAG%.%SVNREV%_%yyyy%%mm%%dd%
echo ###########################################################
echo ### Build Version: %BLDVER%
echo ###########################################################
echo const char *%BDVNAM%="%BLDVER%"; > %VERPTH%
type %VERPTH%
goto :END
:ERRTAG
echo ###########################################################
echo ### No Tag
echo ###########################################################
goto :END
:ERRREV
echo ###########################################################
echo ### No Revision
echo ###########################################################
:END
