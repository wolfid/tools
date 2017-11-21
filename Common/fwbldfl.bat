@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set SETPRD="%~dp0..\%DEVCOM%\setprd%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set MODCHK="%~dp0..\%DEVCOM%\modchk%~x0"
set DOCOPY="%~dp0..\%DEVCOM%\docopy%~x0"
echo ###########################################################
echo ###                               ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV%
call %MODCHK% %1 %QMDLST%
if not "%MODRET%"=="" shift
set SRCPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%DEVPRJ:"=%/%SCSTAG:"=%"/%TAGREL:"=%
echo ###########################################################
echo ### Repo Location: %SRCPTH:"=%
echo ###########################################################
for /f %%i in ('%SVNLST:"=% %SRCPTH:"=%') do set SVNTAG=%%i
if not "%SVNTAG:~-1,1%"=="0" goto :ERRTAG
echo ###########################################################
echo ### SVN Tag: %SVNTAG%
echo ###########################################################
set SRCPTH=%SRCPTH:"=%/%SVNTAG%
call %GETREV% %SRCPTH%
if "%SVNREV%"=="" goto :ERRREV
echo ###########################################################
echo ### SVN Revision: %SVNREV%
echo ###########################################################
set PRDDEX=1
setlocal enabledelayedexpansion
set PRDTYP=!PRDTYP[%PRDDEX%]!
goto :PRDCHK
:PRDLPP
set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.%CFGEXT%"
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
set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTAG%\%TAGREL%\%SVNTAG%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDVNAM%.%VEREXT%"
echo ###########################################################
echo ### Build Version File: %VERPTH%
echo ###########################################################
set BLDVER=%BLDTYP%_%BRDCOD%_%PRDCOD%%BLDLFL%%SVNTAG%.%SVNREV%_%dd%%mmm%%yyyy%_%hour%%min%
echo ###########################################################
echo ### Build Version: %BLDVER%
echo ###########################################################
echo const char *%BDVNAM%="%BLDVER%"; > %VERPTH%
type %VERPTH%
:MAKCMD
echo ###########################################################
echo ### Building %DEVPRJ% Firmware in ~/%SRCPTH:"=% on %BLDTGT%
echo ###########################################################
if "%INTMOD%"=="y" pause
set SRCPTH="%PRJDIR%/%SUBDIR:"=%/%DEVPRJ%/%SCSTRK%/%SDKDIR%/%MAKDIR:"=%"
setlocal EnableDelayedExpansion
:CLEAN
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %CLNCMD:~1,-1%
:BUILD
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %MAKCMD:~1,-1%
endlocal
%SVNCPY% "https://%SVNADR:"=%/svn/%SVNDIR:"=%/%DEVPRJ:"=%/%SCSTRK:"=%" "https://%SVNADR:"=%/svn/%SVNDIR:"=%/%DEVPRJ:"=%/%SCSTAG:"=%"/%TAGREL%/%SVNTAG% -m "Tagging trunk at %SVNREV%"
:ISSCHK
if "%ISSLST:"=%"=="" goto :END
setlocal enabledelayedexpansion
set PRDDIR=!PRDDIR[%PRDTYP%]!
endlocal & set PRDDIR=%PRDDIR%
echo ###########################################################
echo ### Product Directory: %PRDDIR:"=%
echo ###########################################################
set BINPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTRK%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%"
set ISSPTH="%GDVDRV%:\%GDVHOM:"=%\%GDVUSR:"=%\%GDVDIR:"=%\%GDVTEM:"=%\%GDVPRJ:"=%\%PRDDIR:"=%\%GDVDLV:"=%\%GDVFMW:"=%\%BLDVER:~0,-5%"
call %DOCOPY% "%ISSPTH:"=%" %BINPTH% %ISSLST:"=%
goto :END
:ERRTAG
echo ###########################################################
echo ### Error - No Final Release Tag
echo ###########################################################
goto :END
:ERRREV
echo ###########################################################
echo ### Error - No Revision
echo ###########################################################
:END
