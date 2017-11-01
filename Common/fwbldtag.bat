@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set SETPRD="%~dp0..\%DEVCOM%\setprd%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set GETDAT="%~dp0..\%DEVCOM%\getdat%~x0"
set MODCHK="%~dp0..\%DEVCOM%\modchk%~x0"
echo ###########################################################
echo ###                               ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV%
call %MODCHK% %1 %QMDLST%
if not "%MODRET%"=="" shift
set FMWSUF=
if "%1"=="" (set FMWSUF=%FMWSPD%
) else if "%1"=="%SVNDBG%" (set FMWSUF=%FMWSPD%
) else if "%1"=="%SVNREL%" (set FMWSUF=%FMWSRC%
) else if "%1"=="%SVNPRD%" set FMWSUF=%FMWSFL%
if not "%FMWSUF%"=="" goto :SVNPTH
set FMWSUF=%FMWSPD%
set SVNREV=%1
goto :SVNREV
:SVNPTH
if not "%SVNBRA%"=="" (set SVNPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%SVNBRA:"=%/%DEVBRA%"
) else set SVNPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%DEVBRA%"
call %GETREV% %SVNPTH%
if "%SVNREV%"=="%SVNUNV%" set SVNREV=%SVNDEF%
:SVNREV
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
endlocal & set PRDCOD=%PRDCOD%
echo ###########################################################
echo ### Product Code: %PRDCOD%
echo ###########################################################
set SVNPTH="%SVNDRV%:\%SNXFMW:"=%\%DEVPRJ%\%SCSTAG:"=%\%TAGREL:"=%
echo ###########################################################
echo ### Get Latest Tag From: %TAGLST:"=% %SVNPTH:"=%
echo ###########################################################
set SVNTAG=0.0
for /f %%i in ('%TAGLST:"=% %SVNPTH:"=%') do set SVNTAG=%%i
if "%SVNTAG%"=="0.0" if not "%FMWSUF%"=="%FMWSPD%" goto :ERRTAG
echo ###########################################################
echo ### SVN Tag: %SVNTAG%
echo ###########################################################
if "%SVNTAG:~-1,1%"=="0" (if "%FMWSUF%"=="%FMWSRC%" goto :ERRREL) else if "%FMWSUF%"=="%FMWSFL%" goto :ERRFNL
if "%BDTNAM%"=="" goto :END
if "%FMWSUF%"=="%FMWSPD%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSBRA%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDTNAM%.%VEREXT%"
) else set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTAG%\%TAGREL%\%SVNTAG%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDTNAM%.%VEREXT%"
echo ###########################################################
echo ### Build Version File: %VERPTH%
echo ###########################################################
call %GETDAT%
set BLDVER=%FMWPRF%%SNXPRF%%PRDCOD%%FMWSUF%%SVNTAG%.%SVNREV%_%dd%%mmm%%yyyy%_%hour%%min%
echo ###########################################################
echo ### Build Version: %BLDVER%
echo ###########################################################
echo const char *%BDTNAM%="%BLDVER%"; > %VERPTH%
type %VERPTH%
goto :END
:ERRTAG
echo ###########################################################
echo ### Error - No Tag For Release Build
echo ###########################################################
goto :END
:ERRREL
echo ###########################################################
echo ### Error - Minor Release is 0 For Release Candidate
echo ###########################################################
goto :END
:ERRFNL
echo ###########################################################
echo ### Error - Minor Release is ~0 For Final Release
echo ###########################################################
:END
