@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set GENREV="%~dp0..\%DEVCOM%\genrev%~x0"
set DSPREV="%~dp0..\%DEVCOM%\dsprev%~x0"
set DOCOPY="%~dp0..\%DEVCOM%\docopy%~x0"
echo ###########################################################
echo ###                                ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV% %1
:DEVBRA
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
:BLDLVL
if "%2"=="%BLDLDB%" (set BLDLVL=%BLDLDB%
) else if "%2"=="%BLDLPD%" (set BLDLVL=%BLDLPD%
) else if "%2"=="%BLDLRC%" (set BLDLVL=%BLDLRC%
) else if "%2"=="%BLDLFL%" set BLDLVL=%BLDLFL%
if "%BLDLVL%"=="" set BLDLVL=%BLDDEF%
echo ###########################################################
echo ### Issue Type: %BLDLVL%
echo ###########################################################
if not "%3"=="" set SCSREV=%3
:SCSPTH
setlocal EnableDelayedExpansion
set SCSPTH=!SCSPTH[%BLDLVL%]!
set VERPTH=!VERPTH[%BLDLVL%]!
:GENREV
if "%MAKVMD%"=="LOCAL" call %GENREV% %1 %SCSPTH% %VERPTH% %RMEFIL%
if "%MAKCMD:"=%"=="n" goto :DSPREV
if "%INTMOD%"=="y" pause
set SRCPTH=!SRCPTH[%BLDLVL%]!
echo ###########################################################
echo ### Building %DEVPRJ% Firmware in ~/%SRCPTH:"=% on %BLDTGT%
echo ###########################################################
if "%BLDLVL%"=="%BLDLDB%" goto :BUILD
:CLEAN
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %CLNCMD:~1,-1%
:BUILD
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %MAKCMD:~1,-1%
:DSPREV
call %DSPREV%
endlocal
