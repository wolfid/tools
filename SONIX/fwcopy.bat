@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                 ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVBRA %SETENV%
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set SRCPTH=%PRJDIR:\=/%) else set SRCPTH=%PRJDIR:\=/%/%DEVBRA%
if not "%SDKDIR:"=%"=="" set SRCPTH=%SRCPTH%\%SDKDIR:"=%
if not "%IMGDIR:"=%"=="" set SRCPTH=%SRCPTH%\%IMGDIR:"=%
set SRCPTH=%SRCPTH:"=%
set SRCPTH=%SRCPTH:/=\%
set BINPTH="%PRJDRV%:\%SRCPTH%\%IMGBIN%.%IMGEXT%"
if "%SDCDRV%"=="" (set DSTPTH="%SDCDIR:"=%") else set DSTPTH="%SDCDRV%:%SDCDIR:"=%"
echo ###########################################################
echo ### Copying %BINPTH% to %DSTPTH%
echo ###########################################################
if "%INTMOD%"=="y" pause
%CPYCMD% %CPYFLG:"=% "%BINPTH:"=%" "%DSTPTH:"=%"
