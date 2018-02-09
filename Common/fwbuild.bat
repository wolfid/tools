@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set GETDAT="%~dp0..\%DEVCOM%\getdat%~x0"
set VERDET="%~dp0..\%DEVCOM%\verdet%~x0"
set BLDTAG="%~dp0..\%DEVCOM%\bldtag%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
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
) else if "%2"=="%SVNREL%" (set BLDLVL=%BLDLRC%
) else if "%2"=="%BLDLRC%" set BLDLVL=%BLDLFL%
if "%BLDLVL%"=="" set BLDLVL=%BLDLDB%
if not "%3"== "" if "%3"=="%BLDSKP%" (set MAKSKP=%BLDSKP%) else set SCSREV=%3
:SCSPTH
setlocal EnableDelayedExpansion
set SCSPTH=!SCSPTH[%BLDLVL%]!
set VERPTH=!VERPTH[%BLDLVL%]!
set SRCPTH=!SRCPTH[%BLDLVL%]!
endlocal & set SCSPTH=%SCSPTH%& set VERPTH=%VERPTH%& set SRCPTH=%SRCPTH%
if not "%MAKVMD%"=="LOCAL" goto :BLDVER
if not "%RMEFIL%"=="" set RMEFIL="%VERPTH:"=%\%RMEFIL:"=%"
call %GETREV% %1 %SCSPTH% %RMEFIL%
if "%SCSREV%"=="%SCSUNV%" set SCSREV=%SCSDEF%
if "%PRDCOD%"=="" call %PRDCHK%
set BLDVER=%PRDCOD%_%BLDTYP%_%BRDCOD%_%BLDLVL%_%SCSTAG%.%SCSREV%_%yyyy%%mm%%dd%
echo ###########################################################
echo ### BLD Version: %BLDVER%
echo ###########################################################
echo const char *sdk_version="%SDKVER%"; > "%VERPTH:"=%\%SDVNAM%.%VEREXT%"
echo const char *bld_version="%BLDVER%"; > "%VERPTH:"=%\%BDVNAM%.%VEREXT%"
if "%DETHTM%"=="" goto :BLDVER
call %VERDET% "%VERPTH:"=%\%DETHTM:"=%" %SDKVER% %BLDVER%
:BLDVER
if "%MAKSKP%"=="%BLDSKP%" goto :DETHTM
echo ###########################################################
echo ### Building %DEVPRJ% Firmware in ~/%SRCPTH:"=% on %BLDTGT%
echo ###########################################################
if "%INTMOD%"=="y" pause
setlocal EnableDelayedExpansion
if "%BLDLVL%"=="%BLDLDB%" goto :BUILD
:CLEAN
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %CLNCMD:~1,-1%
:BUILD
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %MAKCMD:~1,-1%
endlocal
:DETHTM
if "%DETHTM%"=="" goto :SDKVER
if exist "%VERPTH:"=%\%DETHTM:"=%" type "%VERPTH:"=%\%DETHTM:"=%"
goto :END
:SDKVER
if "%MAKVMD%"=="LOCAL" goto :LOCAL
if "%SDVNAM%"=="" goto :BLDVER
type "%VERPTH:"=%\%SDVNAM%.%VEREXT%"
:BLDVER
if "%BDVNAM%"=="" goto :END
type "%VERPTH:"=%\%BDVNAM%.%VEREXT%"
goto :END
:LOCAL
if not "%SDVNAM%"=="" echo SDK VERSION: %SDKVER%
if not "%BDVNAM%"=="" echo BLD VERSION: %BLDVER%
goto :END
:ERRTAG
echo ###########################################################
echo ### Invalid Tag
echo ###########################################################
:END