@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                              ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVBRA %SETENV% %1
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set SRCPTH=%PRJDIR:\=/%) else set SRCPTH=%PRJDIR:\=/%/%DEVBRA%
if not "%SDKDIR%"=="" set SRCPTH=%SRCPTH:"=%/%SDKDIR:"=%
if not "%MAKDIR%"=="" set SRCPTH=%SRCPTH:"=%/%MAKDIR:"=%
echo ###########################################################
echo ### Rebuilding %DEVPRJ% Firmware in ~/%SRCPTH% on %BLDTGT%
echo ###########################################################
if "%INTMOD%"=="y" pause
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd ~/%SRCPTH%; %CLNCMD:"=%; %MAKCMD:"=%
