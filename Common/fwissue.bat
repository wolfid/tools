@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
set DOCOPY="%~dp0..\%DEVCOM%\docopy%~x0"
echo ###########################################################
echo ###                                ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV% %1
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
if "%BDVNAM%"=="" goto :SCSPTH
setlocal EnableDelayedExpansion
set VERPTH=!VERPTH[%BLDLVL%]!
echo ###########################################################
echo ### Get Build Version Details From: %VERPTH:"=%\%BDVNAM%.%VEREXT%
echo ###########################################################
for /f "tokens=*" %%i in (%VERPTH:"=%\%BDVNAM%.%VEREXT%) do set BLDVER=%%i
set BLDVER=!BLDVER:~%REVBEG%,-%REVEND%!
endlocal & set BLDVER=%BLDVER%
goto :DOCOPY
:SCSPTH
setlocal EnableDelayedExpansion
set SCSPTH=!SCSPTH[%BLDLVL%]!
endlocal & set SCSPTH=%SCSPTH%
echo ###########################################################
echo ### Generate Build Version Details From: %SCSPTH:"=%
echo ###########################################################
call %GENREV% %1 %SCSPTH%
:DOCOPY
echo ###########################################################
echo ### Build Version: %BLDVER%
echo ###########################################################
call %DOCOPY% %1 "%ISSPTH:"=%\%BLDVER%" %BINPTH% %ISSLST:"=%
