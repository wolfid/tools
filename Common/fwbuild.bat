@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set SETPRD="%~dp0..\%DEVCOM%\setprd%~x0"
set VERDET="%~dp0..\%DEVCOM%\verdet%~x0"
set DOCOPY="%~dp0..\%DEVCOM%\docopy%~x0"
set SVNLTT="%~dp0..\%DEVPRJ%\svnlat
echo ###########################################################
echo ###                                ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVBRA %SETENV% %1
:DEVBRA
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
if "%2"=="" goto :SVNPTH
set SVNREV=%2
if "%SVNREV%"=="SVNDBG" set SVNREV=%SVNDBG%
goto :SVNREV
:SVNPTH
if not "%SVNBRA%"=="" (set SVNPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%SVNBRA:"=%%DEVBRA%"
) else set SVNPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%DEVBRA%"
call %ENVCHK% JSTDIT %GETREV% %1 %SVNPTH%
if "%SVNREV%"=="%SVNUNV%" set SVNREV=%SVNDBG%
:SVNREV
echo ###########################################################
echo ### SVN Revision: %SVNREV% (Sometimes needed by MAKCMD)
echo ###########################################################
if "%MAKVMD%"=="LOCAL" call %ENVCHK% JSTDIT %VERDET% %1
if not "%PRDCOD%"=="" goto :SRCPTH
set PRDTYP=%DEFTYP%
if "%ALTCFG%"=="" goto :PRDCOD
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.%CFGEXT%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.%CFGEXT%"
call %ENVCHK% JSTDIT %SETPRD% %1 %CFGPTH% %ALTCFG% %ALTSET% %ALTTYP%
:PRDCOD
echo ###########################################################
echo ### Product Type: %PRDTYP%
echo ###########################################################
setlocal enabledelayedexpansion
set PRDCOD=!CODLST[%PRDTYP%]!
endlocal & set PRDCOD=%PRDCOD%
:SRCPTH
set SRCPTH=%PRJDIR:\=/%
set SRCPTH="%PRJDIR:"=%/%SUBDIR:"=%"
if not "%DEVBRA%"=="%DEVTRK%" set SRCPTH="%SRCPTH:"=%/%DEVBRA%"
if not "%SDKDIR%"=="" set SRCPTH="%SRCPTH:"=%/%SDKDIR:"=%"
if not "%MAKDIR%"=="" set SRCPTH="%SRCPTH:"=%/%MAKDIR:"=%"
:MAKCMD
echo ###########################################################
echo ### Building %DEVPRJ% Firmware in ~/%SRCPTH:"=% on %BLDTGT%
echo ###########################################################
if "%INTMOD%"=="y" pause
setlocal EnableDelayedExpansion
if "%SVNREV%"=="%SVNDBG%" goto :BUILD
:CLEAN
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %CLNCMD:~1,-1%
:BUILD
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %MAKCMD:~1,-1%
if "%DETHTM%"=="" goto :SDKVER
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%DETHTM:"=%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%DETHTM:"=%"
if exist %CFGPTH% type %CFGPTH%
endlocal
goto :ISSCHK
:SDKVER
if "%MAKVMD%"=="LOCAL" goto :LOCAL
if "%SDVNAM%"=="" goto :BLDVER
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%SDVNAM%.%VEREXT%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%SDVNAM%.%VEREXT%"
type %CFGPTH%
:BLDVER
if "%BDVNAM%"=="" goto :ISSCHK
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDVNAM%.%VEREXT%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDVNAM%.%VEREXT%"
type %CFGPTH%
goto :ISSCHK
:LOCAL
echo SDK VERSION: %SDKVER%
echo BLD VERSION: %BLDVER%
:ISSCHK
if "%SVNREV%"=="%SVNDBG%" goto :END
echo %BLDVER:~0,-5% > %SVNLTT%
if "%ISSLST:"=%"=="" goto :END
if not "%PRDDIR%"=="" goto :PRDDIR
setlocal enabledelayedexpansion
set PRDDIR=!DIRLST[%PRDTYP%]!
endlocal & set PRDDIR=%PRDDIR%
:PRDDIR
echo ###########################################################
echo ### Product Directory: %PRDDIR:"=%
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set BINPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%"
) else set BINPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%"
if "%ISSDRV%"=="" goto :GDVDRV
set ISSPTH="%ISSDRV%:\%SVNDIR:"=%\%ISSDIR:"=%\%PRDDIR:"=%\%BLDVER:~0,-5%"
goto :RMEFIL
:GDVDRV
set ISSPTH="%GDVDRV%:\%GDVHOM:"=%\%GDVUSR:"=%\%GDVDIR:"=%\%GDVTEM:"=%\%GDVPRJ:"=%\%PRDDIR:"=%\%GDVDLV:"=%\%GDVFMW:"=%\%BLDVER:~0,-5%"
set GDVDRV=
:RMEFIL
if "%RMEFIL%"=="" goto :NORDME
echo ###########################################################
echo ### Generate "%RMEFIL%"
echo ###########################################################
if not "%SVNBRA%"=="" (set SVNPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%SVNBRA:"=%%DEVBRA%"
) else set SVNPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%DEVBRA%"
call %ENVCHK% JSTDIT %GETREV% %1 %SVNPTH% %BINPTH%\%RMEFIL%
:SVNREV
echo ###########################################################
echo ### SVN Revision: %SVNREV%
echo ###########################################################
if "%SVNREV%"=="%SVNUNV%" goto :END
call %ENVCHK% JSTDIT %DOCOPY% %1 "%ISSPTH:"=%" %BINPTH% %ISSLST:"=% %RMEFIL%
if not "%GDVDRV%"=="" goto :GDVDRV
goto :END
:NORDME
call %ENVCHK% JSTDIT %DOCOPY% %1 "%ISSPTH:"=%" %BINPTH% %ISSLST:"=%
if not "%GDVDRV%"=="" goto :GDVDRV
:END