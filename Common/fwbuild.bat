@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set GETLVL="%~dp0..\%DEVCOM%\getlvl%~x0"
set GENREV="%~dp0..\%DEVCOM%\genrev%~x0"
set DSPREV="%~dp0..\%DEVCOM%\dsprev%~x0"
set DOCOPY="%~dp0..\%DEVCOM%\docopy%~x0"
echo ###########################################################
echo ###                                ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV% %1
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
call %GETLVL% %1 %2
echo ###########################################################
echo ### Issue Type: %BLDLVL%
echo ###########################################################
if not "%3"=="" set SCSREV=%3
setlocal EnableDelayedExpansion
set SCSPTH=!SCSPTH[%BLDLVL%]!
set VERPTH=!VERPTH[%BLDLVL%]!
if "%MAKVMD%"=="LOCAL" call %GENREV% %1 %SCSPTH% %VERPTH% %RMEFIL%
if "%MAKCMD:"=%"=="n" goto :DSPREV
set SRCPTH=!SRCPTH[%BLDLVL%]!
echo ###########################################################
echo ### Building %DEVPRJ% Firmware in ~/%SRCPTH:"=% on %BLDTGT%
echo ###########################################################
if "%INTMOD%"=="y" pause
if "%BLDLVL%"=="%BLDLDB%" goto :BUILD
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %CLNCMD:~1,-1%
:BUILD
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %MAKCMD:~1,-1%
:DSPREV
call %DSPREV%
endlocal
