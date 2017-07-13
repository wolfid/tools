@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVBRA %SETENV% %1
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
set SRCPTH=%SUBDIR%
if not "%DEVBRA%"=="%DEVTRK%" set SRCPTH="%SRCPTH:"=%/%DEVBRA%"
if not "%SDKDIR:"=%"=="" set SRCPTH=%SRCPTH%\%SDKDIR:"=%
if not "%IMGDIR:"=%"=="" set SRCPTH=%SRCPTH%\%IMGDIR:"=%
if not "%IMGTYP:"=%"=="" set SRCPTH=%SRCPTH%\%IMGTYP:"=%
set SRCPTH=%SRCPTH:"=%
set SRCPTH=%SRCPTH:/=\%
set BINPTH="%PRJDRV%:\%SRCPTH%\%IMGBIN%%IMGFEX%.%IMGEXT%"
if "%SDCDRV%"=="" (set DSTPTH="%SDCDIR:"=%") else set DSTPTH="%SDCDRV%:%SDCDIR:"=%"
echo ###########################################################
echo ### Copying %BINPTH% to %DSTPTH%
echo ###########################################################
if "%INTMOD%"=="y" pause
%CPYCMD% %CPYFLG:"=% "%BINPTH:"=%" "%DSTPTH:"=%"