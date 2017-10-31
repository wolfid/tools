@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETPRD="%~dp0..\%DEVCOM%\setprd%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set VERTAG="%~dp0..\%DEVCOM%\vertag%~x0"
set DOCOPY="%~dp0..\%DEVCOM%\docopy%~x0"
echo ###########################################################
echo ###                               ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% JSTDIT %SETENV% %1
:DEVBRA
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
set FMWSUF=
if "%2"=="" (set FMWSUF=%FMWSPD%
) else if "%2"=="%SVNDBG%" (set FMWSUF=%FMWSPD%
) else if "%2"=="%SVNREL%" (set FMWSUF=%FMWSRC%
) else if "%2"=="%SVNPRD%" set FMWSUF=%FMWSFL%
if not "%FMWSUF%"=="" goto :SVNPTH
set FMWSUF=%FMWSPD%
set SVNREV=%3
goto :SVNREV
:SVNPTH
if not "%SVNBRA%"=="" (set SVNPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%SVNBRA:"=%%DEVBRA%"
) else set SVNPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%DEVBRA%"
call %ENVCHK% JSTDIT %GETREV% %1 %SVNPTH%
if "%SVNREV%"=="%SVNUNV%" set SVNREV=%SVNDEF%
:SVNREV
if not "%PRDCOD%"=="" goto :SRCPTH
set PRDTYP=%DEFTYP%
if "%ALTCFG%"=="" goto :PRDCOD
set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.%CFGEXT%"
call %ENVCHK% JSTDIT %SETPRD% %1 %CFGPTH% %ALTCFG% %ALTSET% %ALTTYP%
:PRDCOD
echo ###########################################################
echo ### Product Type: %PRDTYP%
echo ###########################################################
setlocal enabledelayedexpansion
set PRDCOD=!PRDCOD[%PRDTYP%]!
endlocal & set PRDCOD=%PRDCOD%
:SRCPTH
echo ###########################################################
echo ### Product Code: %PRDCOD%
echo ###########################################################
call %ENVCHK% JSTDIT %VERTAG% %1
if not "%VERPTH%"=="" type %VERPTH%
:END