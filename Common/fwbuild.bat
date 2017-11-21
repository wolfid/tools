@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
set BLDVER="%~dp0..\%DEVCOM%\bldver%~x0"
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
goto :SVNPTH
:BLDLVL
if "%2"=="%SVNDBG%" (set BLDLVL=%BLDLDB%
) else if "%2"=="%SVNPRD%" (set BLDLVL=%BLDLPD%
) else if "%2"=="%SVNREL%" (set BLDLVL=%BLDLRC%
) else if "%2"=="%SVNFIN%" set BLDLVL=%BLDLFL%
if "%BLDLVL%"=="" set BLDLVL=%BLDLDB%
if not "%BLDLVL%"=="%BLDLDB%" goto :SVNPTH
if not "%3"== "" set SVNREV=%3
if not "%SVNREV%"== "" goto :SVNREV
:SVNPTH
set SVNPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%DEVPRJ:"=%/%SCSBRA:"=%/%DEVBRA%"
call %GETREV% %1 %SVNPTH%
if "%SVNREV%"=="%SVNUNV%" set SVNREV=%SVNDEF%
:SVNREV
echo ###########################################################
echo ### SVN Revision: %SVNREV% (Sometimes needed by MAKCMD)
echo ###########################################################
call %PRDCHK%
if "%MAKVMD%"=="LOCAL" call %BLDVER% %1
set SRCPTH=%PRJDIR:\=/%
set SRCPTH="%PRJDIR:"=%/%SUBDIR:"=%"/%DEVPRJ:"=%
if "%BLDLVL%"=="%BLDLDB%" (set SRCPTH="%SRCPTH:"=%/%SCSBRA%/%DEVBRA%"
) else if "%BLDLVL%"=="%BLDLPD%" (set SRCPTH="%SRCPTH:"=%/%SCSTAG%/%TAGDBG%/%SVNTAG%"
) else set SRCPTH="%SRCPTH:"=%/%SCSTAG%/%TAGREL%/%SVNTAG%"
if not "%SDKDIR%"=="" set SRCPTH="%SRCPTH:"=%/%SDKDIR:"=%"
if not "%MAKDIR%"=="" set SRCPTH="%SRCPTH:"=%/%MAKDIR:"=%"
:MAKCMD
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
echo SDK VERSION: %SDKVER%
echo BLD VERSION: %BLDVER%
:ISSCHK
if "%BLDLVL%"=="%BLDLDB%" goto :END
if "%ISSLST%"=="" goto :END
setlocal enabledelayedexpansion
set PRDDIR=!PRDDIR[%PRDTYP%]!
endlocal & set PRDDIR=%PRDDIR%
echo ###########################################################
echo ### Product Directory: %PRDDIR:"=%
echo ###########################################################
set BINPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%"
if "%ISSDRV%"=="" goto :END
set ISSPTH="%GDVDRV%:\%GDVHOM:"=%\%GDVUSR:"=%\%GDVDIR:"=%\%GDVTEM:"=%\%GDVPRJ:"=%\%PRDDIR:"=%\%GDVDLV:"=%\%GDVFMW:"=%\%BLDVER:~0,-5%"
if "%RMEFIL%"=="" goto :NORDME
echo ###########################################################
echo ### Generate "%RMEFIL%"
echo ###########################################################
set SVNPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%SVNBRA:"=%%DEVBRA%"
call %GETREV% %1 %SVNPTH% %BINPTH%\%RMEFIL%
:SVNREV
echo ###########################################################
echo ### SVN Revision: %SVNREV%
echo ###########################################################
if "%SVNREV%"=="%SVNUNV%" goto :NORDME
call %DOCOPY% %1 "%ISSPTH:"=%" %BINPTH% %ISSLST:"=% %RMEFIL%
goto :END
:NORDME
call %DOCOPY% %1 "%ISSPTH:"=%" %BINPTH% %ISSLST:"=%
:END