@echo off
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
if "%BLDLVL%"=="%BLDLDB%" goto :DBGTAG
if "%BLDLVL%"=="%BLDLPD%" goto :DBGTAG
set SVNURL="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%DEVPRJ:"=%/%SCSTAG:"=%/%TAGREL:"=%"
goto :SVNURL
:DBGTAG
set SVNURL="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%DEVPRJ:"=%/%SCSTAG:"=%/%TAGDBG:"=%"
:SVNURL
echo ###########################################################
echo ### Repo Location: %SVNURL:"=%
echo ###########################################################
for /f %%i in ('%SVNLST:"=% %SVNURL:"=%') do set SVNTAG=%%i
if "%SVNTAG%"=="" (if "%BLDLVL%"=="%BLDLDB%" (set SVNTAG=%TAGDEF%
) else set SVNTAG=%TAGNUL%
) else set SVNTAG=%SVNTAG:~0,-1%
echo ###########################################################
echo ### SVN Tag: %SVNTAG:"=%
echo ###########################################################
:END
