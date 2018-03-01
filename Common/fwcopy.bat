@echo off
set SETENV="%~dp0..\%DEVCOM%\setenv%~x0"
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV%
echo ###########################################################
echo ### Copying %BINPTH:"=%\%SNXBIN%%SNXFEX%.%SNXEXT% to %DSTPTH%
echo ###########################################################
if "%INTMOD%"=="y" pause
copy /Y "%BINPTH:"=%\%SNXBIN%%SNXFEX%.%SNXEXT%" "%DSTPTH:"=%"
