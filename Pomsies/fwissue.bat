@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set BLDTAG="%~dp0..\%DEVCOM%\bldtag%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set DOCOPY="%~dp0..\%DEVCOM%\docopy%~x0"
echo ###########################################################
echo ###                               ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV% %1
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
if not "%2"=="" (set ISSCOD=%2
) else set ISSCOD=%ISSDEF%
echo ###########################################################
echo ### Issue Code: %ISSCOD%
echo ###########################################################
if "%ISSCOD%"=="%ISSDBG%" (set SVNURL=https://%SVNADR%/%SVNDIR%/%SVNPRJ%/%SVNSUB%/%SVNDBG%
) else if "%ISSCOD%"=="%ISSPRD%" (set SVNURL=https://%SVNADR%/%SVNDIR%/%SVNPRJ%/%SVNSUB%/%SVNDBG%
) else if "%ISSCOD%"=="%ISSPRC%" (set SVNURL=https://%SVNADR%/%SVNDIR%/%SVNPRJ%/%SVNSUB%/%SVNREL%
) else set SVNURL=https://%SVNADR%/%SVNDIR%/%SVNPRJ%/%SVNSUB%/%SVNREL%
echo ###########################################################
echo ### Repo Location: %SVNURL:"=%
echo ###########################################################
call %BLDTAG% %1 %SVNURL%
echo ###########################################################
echo ### SVN Tag: %SVNTAG%
echo ###########################################################
call %GETREV% %1 %SVNURL%/%SVNTAG%
echo ###########################################################
echo ### SVN Revision: %SVNREV%
echo ###########################################################
echo ###########################################################
echo ### Board Code: %BRDCOD%
echo ###########################################################
call %DOCOPY% %1 "%ISSPTH:"=%\%PRDCOD%_FW_%BRDCOD%_%ISSCOD%_%SVNTAG%.%SVNREV%_%yyyy%%mm%%dd%" %BINPTH% %ISSLST:"=%
