@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set BLDVER="%~dp0..\%DEVCOM%\bldver%~x0"
set BLDTAG="%~dp0..\%DEVCOM%\bldtag%~x0"
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
if not "%3"== "" if "%3"=="%BLDSKP%" (set MAKSKP=%BLDSKP%) else set SVNREV=%3
:SVNURL
setlocal EnableDelayedExpansion
set SVNURL=!SVNURL[%BLDLVL%]!
set VERPTH=!VERPTH[%BLDLVL%]!
set SRCPTH=!SRCPTH[%BLDLVL%]!
endlocal & set SVNURL=%SVNURL%& set VERPTH=%VERPTH%& set SRCPTH=%SRCPTH%
:MAKVMD
if not "%SVNTAG%"=="" goto :SVNTAG
call %BLDTAG% %1 %SVNURL%
:SVNTAG
echo ###########################################################
echo ### SVN Tag: %SVNTAG%
echo ###########################################################
if not "%MAKVMD%"=="LOCAL" goto :BLDVER
if not "%RMEFIL%"=="" set RMEFIL="%VERPTH:"=%\%RMEFIL:"=%"
call %BLDVER% %1
echo ###########################################################
echo ### BLD Version: %BLDVER%
echo ###########################################################
echo const char *sdk_version="%SDKVER%"; > "%VERPTH:"=%\%SDKDIR:"=%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%SDVNAM%.%VEREXT%"
echo const char *bld_version="%SDKVER%"; > "%VERPTH:"=%\%SDKDIR:"=%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDVNAM%.%VEREXT%"
if "%DETHTM%"=="" goto :BLDVER
set CFGPTH="%VERPTH:"=%\%SDKDIR:"=%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%DETHTM:"=%"
echo ^<!DOCTYPE HTML^> > %CFGPTH%
echo ^<html^> >> %CFGPTH%
echo ^<body^> >> %CFGPTH%
echo ^<b^>SDK:^</b^> %SDKVER% >> %CFGPTH%
echo ^<p^> >> %CFGPTH%
echo ^<b^>BLD:^</b^> %BLDVER% >> %CFGPTH%
echo ^</body^> >> %CFGPTH%
echo ^</html^> >> %CFGPTH%
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
set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%DETHTM:"=%"
if exist %CFGPTH% type %CFGPTH%
goto :ISSCHK
:SDKVER
if "%MAKVMD%"=="LOCAL" goto :LOCAL
if "%SDVNAM%"=="" goto :BLDVER
set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SCSBRA%\%DEVBRA%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%SDVNAM%.%VEREXT%"
type %CFGPTH%
:BLDVER
if "%BDVNAM%"=="" goto :ISSCHK
set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSBRA%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDVNAM%.%VEREXT%"
type %CFGPTH%
for /f "tokens=*" %%i in (%CFGPTH:"=%) do set BLDVER=%%i
set BLDVER=%BLDVER:~25,-2%
goto :ISSCHK
:LOCAL
if not "%SDVNAM%"=="" echo SDK VERSION: %SDKVER%
if not "%BDVNAM%"=="" echo BLD VERSION: %BLDVER%
goto :END
:ERRTAG
echo ###########################################################
echo ### Invalid Tag
echo ###########################################################
:END