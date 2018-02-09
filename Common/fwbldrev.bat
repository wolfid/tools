@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set BLDTAG="%~dp0..\%DEVPRJ%\bldtag%~x0"
echo ###########################################################
echo ###                               ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV%
set SRCURL="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%DEVPRJ:"=%/%SCSTAG:"=%"/%TAGREL:"=%
echo ###########################################################
echo ### Repo Location: %SRCURL:"=%
echo ###########################################################
for /f %%i in ('%SVNLST:"=% %SRCURL:"=%') do set SCSTAG=%%i
echo ###########################################################
echo ### SVN Tag: %SCSTAG%
echo ###########################################################
call %BDLTAG% %1 %SCSTAG%
