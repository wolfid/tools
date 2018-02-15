@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV% %1
echo ###########################################################
echo ### Copying %BINPTH:"=%\%SNXBIN%%SNXFEX%.%SNXEXT% to %DSTPTH%
echo ###########################################################
if "%INTMOD%"=="y" pause
%CPYCMD% %CPYFLG:"=% "%BINPTH:"=%\%SNXBIN%%SNXFEX%.%SNXEXT%" "%DSTPTH:"=%"
