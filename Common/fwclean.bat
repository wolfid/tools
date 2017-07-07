@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVBRA %SETENV% %1
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%MAKDIR:"=%\%MAKVER:"=%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%MAKDIR:"=%\%MAKVER:"=%"
for /f "tokens=1,2,3" %%i in (%CFGPTH:"=%) do call :SDKVER %%i %%k
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%SDVNAM%.%VEREXT%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%SDVNAM%.%VEREXT%"
if not "%SDKSUF%"=="" set SDKVER=%SDKVER%%SDKSUF%
echo const char *%SDVNAM%="%SDKVER%"; > %CFGPTH%
set SRCPTH=%PRJDIR:\=/%
set SRCPTH="%PRJDIR:"=%/%SUBDIR:"=%"
if not "%DEVBRA%"=="%DEVTRK%" set SRCPTH="%SRCPTH:"=%/%DEVBRA%"
if not "%SDKDIR%"=="" set SRCPTH=%SRCPTH:"=%/%SDKDIR:"=%
if not "%MAKDIR%"=="" set SRCPTH=%SRCPTH:"=%/%MAKDIR:"=%
echo ###########################################################
echo ### Cleaning %DEVPRJ% Firmware in ~/%SRCPTH:"=% on %BLDTGT%
echo ###########################################################
if "%INTMOD%"=="y" pause
%PLKEXE% -pw %BLDPWD% %BLDUSR%@%BLDTGT% cd "~/%SRCPTH%"; %CLNCMD:"=%
goto :END
:SDKVER
if "%1"=="alias" set SDKVER=%2
if "%1"=="prefix" set SDKVER=%2%SDKVER%
if "%1"=="date" set SDKVER=%SDKVER%_%2
if "%1"=="time" set SDKVER=%SDKVER%_%2
if "%1"=="revision" set SDKVER=%SDKVER:~0,10%_%2%SDKVER:~10%
exit /b 0
:END
