@echo off
set GETDAT="%~dp0..\%DEVCOM%\getdat%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set SETPRD="%~dp0..\%DEVCOM%\setprd%~x0"
if not "%SDKVER%"=="" goto :SDKSUF
echo ###########################################################
echo ### Get SDK version details from: %MAKVER:"=%"
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%MAKDIR:"=%\%MAKVER:"=%"
) else set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%MAKDIR:"=%\%MAKVER:"=%"
for /f "tokens=1,2,3" %%i in (%VERPTH:"=%) do call :SDKVER %%i %%k
:SDKSUF
if "%SDKSUF%"=="" goto :NOSDKSUF
set SDKSUF=%SDKSUF:\"=%
set SDKVER=%SDKVER%%SDKSUF%
:NOSDKSUF
echo ###########################################################
echo ### SDK Version: %SDKVER%
echo ###########################################################
if "%SDVNAM%"=="" goto :BLDVER
if "%DEVBRA%"=="%DEVTRK%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%SDVNAM%.%VEREXT%"
) else set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%SDVNAM%.%VEREXT%"
echo const char *%SDVNAM%="%SDKVER%"; > %VERPTH%
:BLDVER
if not "%SVNREV%"=="" goto :PRDCOD
if not "%SVNDRV%"=="" set SVNPTH=%SVNDRV:"=%:
if not "%SVNDIR%"=="" set SVNPTH="%SVNPTH:"=%%SVNDIR:"=%"
if not "%SUBDIR%"=="" set SVNPTH="%SVNPTH:"=%\%SUBDIR:"=%"
if not "%DEVBRA%"=="%DEVTRK%" set SVNPTH="%SVNPTH:"=%\%DEVBRA:"=%"
call %ENVCHK% JSTDIT %GETREV% %1 %SVNPTH%
if "%SVNREV%"=="%SVNUNV%" set SVNREV=%SVNDEF%
:PRDCOD
set PRDCOD=%DEFCOD%
if "%STRCFG%"=="" goto :GETDAT
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.%CFGEXT%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.%CFGEXT%"
call %ENVCHK% JSTDIT %SETPRD% %1 %CFGPTH% %STRCFG% %STRSET% %ALTCOD% %ALTDIR%
:GETDAT
call %ENVCHK% JSTDIT %GETDAT% %1
echo ###########################################################
echo ### Current Date: %dd%%mmm%%yyyy%_%hour%%min%
echo ###########################################################
set BLDVER=%FMWPRF%%SNXPRF%%PRDCOD%%SNXSUF%%SVNREV%_%dd%%mmm%%yyyy%_%hour%%min%
echo ###########################################################
echo ### BLD Version: %BLDVER%
echo ###########################################################
if "%BDVNAM%"=="" goto :VERDET
if "%DEVBRA%"=="%DEVTRK%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDVNAM%.%VEREXT%"
) else set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDVNAM%.%VEREXT%"
echo const char *%BDVNAM%="%BLDVER%"; > %VERPTH%
:VERDET
if "%DETHTM%"=="" goto :END
if "%DEVBRA%"=="%DEVTRK%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%DETHTM:"=%"
) else set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%DETHTM:"=%"
echo ###########################################################
echo ### Write Version Details to: %DETHTM%
echo ###########################################################
echo ^<^!DOCTYPE HTML^> > %VERPTH%
echo ^<html^> >> %VERPTH%
echo ^<body^> >> %VERPTH%
echo ^<b^>SDK:^<^/b^> %SDKVER:"=% >> %VERPTH%
echo ^<p^> >> %VERPTH%
echo ^<b^>BLD:^<^/b^> %BLDVER:"=% >> %VERPTH%
echo ^<^/body^> >> %VERPTH%
echo ^<^/html^> >> %VERPTH%
:SDKVER
if "%1"=="alias" set SDKVER=%2
if "%1"=="prefix" set SDKVER=%2%SDKVER%
if "%1"=="date" set SDKVER=%SDKVER%_%2
if "%1"=="time" set SDKVER=%SDKVER%_%2
if "%1"=="revision" set SDKVER=%SDKVER:~0,10%_%2%SDKVER:~10%
exit /b 0
:END