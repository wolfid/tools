@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set GETDAT="%~dp0..\%DEVCOM%\getdate%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
echo ###########################################################
echo ###                                ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVBRA %SETENV% %1
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
if not "%SVNDRV%"=="" set SVNPTH=%SVNDRV:"=%:
if not "%SVNDIR%"=="" set SVNPTH="%SVNPTH:"=%%SVNDIR:"=%"
if not "%SUBDIR%"=="" set SVNPTH="%SVNPTH:"=%\%SUBDIR:"=%"
if not "%DEVBRA%"=="%DEVTRK%" set SVNPTH="%SVNPTH:"=%\%DEVBRA:"=%"
call %ENVCHK% JUSTDOIT %GETREV% %1 %SVNPTH%
if "%SVNREV%"=="%SVNUNV%" set SVNREV=%SVNDEF%
echo ###########################################################
echo ### SVN Revision: %SVNREV%
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.conf"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.conf"
set PRDCOD=%DEFCOD%
if not "%STRCFG%"=="" call :SETPRD %CFGPTH% %STRCFG% %STRSET% %ALTCOD% %ALTDIR%
echo ###########################################################
echo ### Product Code: %PRDCOD%
echo ###########################################################
call %ENVCHK% JUSTDOIT %GETDAT% %1
echo ###########################################################
echo ### Current Date: %dd%%mmm%%yyyy% %hour%:%min%:%sec%
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\app\%IMGTYP%\src\%BDVNAM%.c"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\app\%IMGTYP%\src\%BDVNAM%.c"
echo const char *%BDVNAM%="%FMWPRF%%SNXPRF%%PRDCOD%%SNXSUF%%SVNREV%_%dd%%mmm%%yyyy%_%hour%%min%"; > %CFGPTH%
set SRCPTH=%PRJDIR:\=/%
set SRCPTH="%PRJDIR:"=%/%SUBDIR:"=%"
if not "%DEVBRA%"=="%DEVTRK%" set SRCPTH="%SRCPTH:"=%/%DEVBRA%"
if not "%SDKDIR%"=="" set SRCPTH="%SRCPTH:"=%/%SDKDIR:"=%"
if not "%MAKDIR%"=="" set SRCPTH="%SRCPTH:"=%/%MAKDIR:"=%"
echo ###########################################################
echo ### Building %DEVPRJ% Firmware in ~/%SRCPTH:"=% on %BLDTGT%
echo ###########################################################
if "%INTMOD%"=="y" pause
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH:"=%"; %MAKCMD:"=%
type %CFGPTH:bld_=sdk_%
type %CFGPTH%
