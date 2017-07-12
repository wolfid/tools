@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set GETDAT="%~dp0..\%DEVCOM%\getdate%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set SETPRD="%~dp0..\%DEVCOM%\setprd%~x0"
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
if not "%STRCFG%"=="" call %ENVCHK% JUSTDOIT %SETPRD% %1 %CFGPTH% %STRCFG% %STRSET% %ALTCOD% %ALTDIR%
echo ###########################################################
echo ### Product Code: %PRDCOD%
echo ###########################################################
call %ENVCHK% JUSTDOIT %GETDAT% %1
echo ###########################################################
echo ### Current Date: %dd%%mmm%%yyyy% %hour%:%min%:%sec%
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDVNAM%.%VEREXT%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDVNAM%.%VEREXT%"
if %hour% lss 10 set hour=0%hour%
echo const char *%BDVNAM%="%FMWPRF%%SNXPRF%%PRDCOD%%SNXSUF%%SVNREV%_%dd%%mmm%%yyyy%_%hour%%min%"; > %CFGPTH%
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%SDVNAM%.%VEREXT%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%SDVNAM%.%VEREXT%"
if "%DETHTM%"=="" goto :BUILD
for /f "tokens=*" %%i in (%CFGPTH:"=%) do set ISSPTH=%%i
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%DETHTM:"=%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%DETHTM:"=%"
call :VERSION_DETAILS "%CFGPTH%" "%ISSPTH:~25,-3%" "%FMWPRF%%SNXPRF%%PRDCOD%%SNXSUF%%SVNREV%_%dd%%mmm%%yyyy%_%hour%%min%"
:BUILD
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
type %CFGPTH%
goto :END
:VERSION_DETAILS
echo ^<^!DOCTYPE HTML^> > %1
echo ^<html^> >> %1
echo ^<body^> >> %1
echo ^<b^>SDK:^<^/b^> %~2 >> %1
echo ^<p^> >> %1
echo ^<b^>BLD:^<^/b^> %~3 >> %1
echo ^<^/body^> >> %1
echo ^<^/html^> >> %1
exit /b 0
:END