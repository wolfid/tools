@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set SETPRD="%~dp0..\%DEVCOM%\setprd%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set GETDAT="%~dp0..\%DEVCOM%\getdat%~x0"
set MODCHK="%~dp0..\%DEVCOM%\modchk%~x0"
set DOCOPY="%~dp0..\%DEVCOM%\docopy%~x0"
echo ###########################################################
echo ###                               ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV%
call %MODCHK% %1 %QMDLST%
set SCSTAG=%2
echo ###########################################################
echo ### SVN Tag: %SCSTAG%
echo ###########################################################
set SRCURL="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%DEVPRJ:"=%/%SCSTAG:"=%/%TAGREL%/%SCSTAG%"
echo ###########################################################
echo ### Repo Location: %SRCURL:"=%
echo ###########################################################
set SRCPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTAG%\%TAGREL%\%SCSTAG%"
if exist "%SRCPTH%" (svn update "%SRCPTH%"
) else svn co %SRCURL% "%SRCPTH%"
call %GETREV% %1 %SRCURL%
:SCSREV
if "%SCSREV%"=="" goto :ERRREV
echo ###########################################################
echo ### SVN Revision: %SCSREV%
echo ###########################################################
:PRDTYP
set PRDDEX=1
setlocal enabledelayedexpansion
set PRDTYP=!PRDTYP[%PRDDEX%]!
goto :PRDCHK
:PRDLPP
set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTAG%\%TAGREL%\%SCSTAG%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.%CFGEXT%"
call %SETPRD% %CFGPTH% !CFGLST[%PRDDEX%]! !CFGSET[%PRDDEX%]! !PRDTYP[%PRDDEX%]!
:PRDCHK
set /a PRDDEX+=1
if not "!CFGLST[%PRDDEX%]!"=="" goto :PRDLPP
echo ###########################################################
echo ### Product Type: %PRDTYP%
echo ###########################################################
set PRDCOD=!PRDCOD[%PRDTYP%]!
endlocal & set PRDCOD=%PRDCOD% & set PRDTYP=%PRDTYP%
set PRDCOD=%PRDCOD: =%
set PRDTYP=%PRDTYP: =%
echo ###########################################################
echo ### Product Code: %PRDCOD%
echo ###########################################################
if "%BDVNAM%"=="" goto :END
set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTAG%\%TAGREL%\%SCSTAG%\%BDVNAM%.%VEREXT%"
echo ###########################################################
echo ### Build Version File: %VERPTH%
echo ###########################################################
if "%SCSTAG:~-1%"=="0" (set BLDLVL=%BLDLFL%) else set BLDLVL=%BLDLRC%
set BLDVER=%BLDTYP%_%BRDCOD%_%PRDCOD%%BLDLVL%%SCSTAG%.%SCSREV%_%dd%%mmm%%yyyy%_%hour%%min%
echo ###########################################################
echo ### Build Version: %BLDVER%
echo ###########################################################
echo const char *%BDVNAM%="%BLDVER%"; > %VERPTH%
type %VERPTH%
:MAKCMD
set SRCPTH="%PRJDIR%/%SUBDIR:"=%/%DEVPRJ%/%SCSTAG%/%TAGREL%/%SCSTAG%"
echo ###########################################################
echo ### Building %DEVPRJ% Firmware in ~/%SRCPTH:"=% on %BLDTGT%
echo ###########################################################
if "%INTMOD%"=="y" pause
setlocal EnableDelayedExpansion
:CLEAN
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %CLNCMD:~1,-1%
:BUILD
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %MAKCMD:~1,-1%
endlocal
:ISSCHK
if "%ISSLST:"=%"=="" goto :END
setlocal enabledelayedexpansion
set PRDDIR=!PRDDIR[%PRDTYP%]!
endlocal & set PRDDIR=%PRDDIR%
echo ###########################################################
echo ### Product Directory: %PRDDIR:"=%
echo ###########################################################
set ISSPTH="%GDVDRV%:\%GDVHOM:"=%\%GDVUSR:"=%\%GDVDIR:"=%\%GDVTEM:"=%\%GDVPRJ:"=%\%PRDDIR:"=%\%GDVDLV:"=%\%GDVFMW:"=%\%BLDVER:~0,-5%"
call %DOCOPY% "%ISSPTH:"=%" %BINPTH% %ISSLST:"=% %RMEFIL%
goto :END
:ERRTAG
echo ###########################################################
echo ### Error - No Tag
echo ###########################################################
goto :END
:ERRREV
echo ###########################################################
echo ### No Revision
echo ###########################################################
:END
