@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
set BLDVER="%~dp0..\%DEVCOM%\bldver%~x0"
set BLDTAG="%~dp0..\%DEVCOM%\bldtag%~x0"
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
set BLDLVL=
if not "%2"=="" goto :BLDLVL
set BLDLVL=%BLDLDB%
goto :PRDCHK
:BLDLVL
if "%2"=="%SVNDBG%" (set BLDLVL=%BLDLDB%
) else if "%2"=="%SVNPRD%" (set BLDLVL=%BLDLPD%
) else if "%2"=="%SVNREL%" (set BLDLVL=%BLDLRC%
) else if "%2"=="%SVNFIN%" set BLDLVL=%BLDLFL%
if "%BLDLVL%"=="" set BLDLVL=%BLDLDB%
if not "%3"== "" if "%3"=="%BLDSKP%" (set MAKSKP=%BLDSKP%) else set SVNREV=%3
:PRDCHK
call %PRDCHK%
:MAKVMD
call %BLDTAG%
if "%SVNTAG%"=="%TAGNUL%" if not "%BLDLVL%"=="%BLDLDB%" goto :ERRTAG
if "%SVNTAG:~-1,1%"=="0" if not "%BLDLVL%"=="%BLDLFL%" goto :ERRTAG
if "%MAKVMD%"=="LOCAL" call %BLDVER% %1
if "%MAKSKP%"=="%BLDSKP%" goto :DETHTM
set SRCPTH=%PRJDIR:\=/%
set SRCPTH="%PRJDIR:"=%/%SUBDIR:"=%"/%DEVPRJ:"=%
if "%BLDLVL%"=="%BLDLDB%" (set SRCPTH="%SRCPTH:"=%/%SCSBRA%/%DEVBRA%"
) else if "%BLDLVL%"=="%BLDLPD%" (set SRCPTH="%SRCPTH:"=%/%SCSTAG%/%TAGDBG%/%SVNTAG%"
) else set SRCPTH="%SRCPTH:"=%/%SCSTAG%/%TAGREL%/%SVNTAG%"
if not "%SDKDIR%"=="" set SRCPTH="%SRCPTH:"=%/%SDKDIR:"=%"
if not "%MAKDIR%"=="" set SRCPTH="%SRCPTH:"=%/%MAKDIR:"=%"
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
set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%SDVNAM%.%VEREXT%"
type %CFGPTH%
:BLDVER
if "%BDVNAM%"=="" goto :ISSCHK
set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDVNAM%.%VEREXT%"
type %CFGPTH%
for /f "tokens=*" %%i in (%CFGPTH:"=%) do set BLDVER=%%i
set BLDVER=%BLDVER:~25,-2%
goto :ISSCHK
:LOCAL
if not "%SDVNAM%"=="" echo SDK VERSION: %SDKVER%
if not "%BDVNAM%"=="" echo BLD VERSION: %BLDVER%
:ISSCHK
if "%BLDLVL%"=="%BLDLDB%" goto :END
if "%ISSLST%"=="" goto :END
if "%ISSDRV%"=="" goto :END
setlocal enabledelayedexpansion
set PRDDIR=!PRDDIR[%PRDTYP%]!
endlocal & set PRDDIR=%PRDDIR%
echo ###########################################################
echo ### Product Directory: %PRDDIR:"=%
echo ###########################################################
set BINPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%"
set ISSPTH="%ISSDRV%:\%ISSHOM:"=%\%ISSUSR:"=%\%ISSDIR:"=%\%ISSTEM:"=%\%ISSPRJ:"=%\%PRDDIR:"=%\%ISSDLV:"=%\%ISSFMW:"=%\%BLDVER%"
call %DOCOPY% %1 "%ISSPTH:"=%" %BINPTH% %ISSLST:"=% %RMEFIL%
goto :END
:ERRTAG
echo ###########################################################
echo ### Invalid Tag
echo ###########################################################
:END