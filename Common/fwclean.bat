@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVCOM%\setenv%~x0"
echo ###########################################################
echo ###                                ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVBRA %SETENV% %1
:DEVBRA
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
set SRCPTH=%PRJDIR:\=/%
set SRCPTH="%PRJDIR:"=%/%SUBDIR:"=%"
if not "%DEVBRA%"=="%DEVTRK%" set SRCPTH="%SRCPTH:"=%/%DEVBRA%"
if not "%SDKDIR%"=="" set SRCPTH=%SRCPTH:"=%/%SDKDIR:"=%
if not "%MAKDIR%"=="" set SRCPTH=%SRCPTH:"=%/%MAKDIR:"=%
:PLKEXE
echo ###########################################################
echo ### Cleaning %DEVPRJ% Firmware in ~/%SRCPTH:"=% on %BLDTGT%
echo ###########################################################
if "%INTMOD%"=="y" pause
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH%"; %CLNCMD:"=%
