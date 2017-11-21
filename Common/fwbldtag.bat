@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set BLDTAG="%~dp0..\%DEVCOM%\bldtag%~x0"
echo ###########################################################
echo ###                               ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV%
if "%2"=="" (set SRCURL="%DEVPRJ:"=%/%SCSTAG:"=%/%TAGREL:"=%"
) else set SRCURL="%DEVPRJ:"=%/%SCSTAG:"=%/%TAGDBG:"=%"
call %BLDTAG% %1 %SRCURL% %2
