@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set BLDTAG="%~dp0..\%DEVCOM%\bldtag%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
set DOCOPY="%~dp0..\%DEVCOM%\docopy%~x0"
echo ###########################################################
echo ###                               ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV% %1
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
if not "%2"=="" (set BLDLVL=%2
) else set BLDLVL=%ISSDEF%
echo ###########################################################
echo ### Issue Code: %BLDLVL%
echo ###########################################################
setlocal EnableDelayedExpansion
set SVNURL=!SVNURL[%BLDLVL%]!
endlocal & set SVNURL=%SVNURL%
echo ###########################################################
echo ### Repo Location: %SVNURL:"=%
echo ###########################################################
call %BLDTAG% %1 %SVNURL%
echo ###########################################################
echo ### SVN Tag: %SVNTAG%
echo ###########################################################
call %GETREV% %1 %SVNURL:"=%/%SVNTAG%
echo ###########################################################
echo ### SVN Revision: %SVNREV%
echo ###########################################################
echo ###########################################################
echo ### Board Code: %BRDCOD%
echo ###########################################################
if "%PRDCOD%"=="" call %PRDCHK%
echo ###########################################################
echo ### Product Code: %PRDCOD%
echo ###########################################################
call %DOCOPY% %1 "%ISSPTH:"=%\%PRDCOD%_FW_%BRDCOD%_%BLDLVL%_%SVNTAG%.%SVNREV%_%yyyy%%mm%%dd%" %BINPTH% %ISSLST:"=%
