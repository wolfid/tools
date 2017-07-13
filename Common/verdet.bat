@echo off
echo ###########################################################
echo ### Get SDK version details from: %MAKVER:"=%"
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%MAKDIR:"=%\%MAKVER:"=%"
) else set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%MAKDIR:"=%\%MAKVER:"=%"
for /f "tokens=1,2,3" %%i in (%VERPTH:"=%) do call :SDKVER %%i %%k
set SDKSUF=%SDKSUF:\"=%
if not "%SDKSUF%"=="" set SDKVER=%SDKVER%%SDKSUF%
:NOSDKSUF
echo ###########################################################
echo ### SDK Version: %SDKVER%
echo ###########################################################
if "%SDVNAM%"=="" goto :BLDVER
if "%DEVBRA%"=="%DEVTRK%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%SDVNAM%.%VEREXT%"
) else set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%SDVNAM%.%VEREXT%"
echo const char *%SDVNAM%="%SDKVER%"; > %VERPTH%
:BLDVER
call %ENVCHK% JUSTDOIT %GETDAT% %1
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