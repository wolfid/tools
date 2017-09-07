@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set LSTCHK="%~dp0..\%DEVCOM%\lstchk%~x0"
set JSNCMD="%~dp0..\%DEVCOM%\jsncmd%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set DRNLST="%~dp0..\%DEVPRJ%\drnlst"
echo ###########################################################
echo ###                            ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% UPGMOD %SETENV%
echo ###########################################################
echo ### Current Firmware Upgrade Mode: %UPGMOD%
echo ###########################################################
if "%UPGIMG%"=="" goto :INTMOD
echo ###########################################################
echo ### Using Upgrade Image: %UPGIMG%
echo ###########################################################
set SRCPTH="%UPGIMG:"=%"
goto :DOFWUPGRADE
:INTMOD
if not "%INTMOD%"=="y" goto :UPGMOD
echo ###########################################################
set /p UPGMOD= ### Upgrade Mode(%UPGMOD%)?
echo ###########################################################
:UPGMOD
if "%UPGMOD%"=="0" goto :FLIGHTBOARD
:WIFIBOARD
echo ###########################################################
echo ### Upgrading Wi-Fi Board Firmware...
echo ###########################################################
if "%SNXDEX%"=="%UPGLTT%" goto :USE_LATEST
if "%UPGTYP%"=="" (call :DRONETYPE
) else set SELENT=%UPGTYP%
set SELENT=%SELENT:"=%
setlocal enabledelayedexpansion
set SNXDIR=!DIRLST[%SELENT%]!
set SNXCOD=!CODLST[%SELENT%]!
set SNXREV=!SNXREV[%SELENT%][%SNXDEX%]!
set SNXDAT=!SNXDAT[%SELENT%][%SNXDEX%]!
endlocal & set SRCPTH="%ISSDIR:"=%\%SNXDIR:"=%\%FMWPRF%%SNXPRF%%SNXCOD%%SNXSUF%%SNXREV%_%SNXDAT%\%SNXBIN%.%SNXEXT%"
if not "%ISSDRV%"=="" set SRCPTH="%ISSDRV:"=%:\%SRCPTH:"=%"
goto :DOFWUPGRADE
:USE_LATEST
echo ###########################################################
echo ### Using Most Recent Build...
echo ###########################################################
set SRCPTH=%SUBDIR%
if not "%DEVBRA%"=="%DEVTRK%" set SRCPTH="%SRCPTH:"=%\%DEVBRA%"
if not "%PRJDRV%"=="" set SRCPTH="%PRJDRV%:\%SRCPTH:"=%"
if not "%SDKDIR%"=="" set SRCPTH="%SRCPTH:"=%\%SDKDIR:"=%"
if not "%IMGDIR%"=="" set SRCPTH="%SRCPTH:"=%\%IMGDIR:"=%"
if not "%IMGTYP%"=="" set SRCPTH="%SRCPTH:"=%\%IMGTYP:"=%"
set SRCPTH="%SRCPTH:"=%\%SNXBIN%.%SNXEXT%"
goto :DOFWUPGRADE
:FLIGHTBOARD
echo ###########################################################
echo ### Upgrading Flight Board Firmware...
echo ###########################################################
if "%UPGTYP%"=="" (call :DRONETYPE
) else set SELENT=%UPGTYP%
set SELENT=%SELENT:"=%
setlocal enabledelayedexpansion
set FLBDIR=!DIRLST[%SELENT%]!
set FLBCOD=!CODLST[%SELENT%]!
set FLBREV=!FLBREV[%SELENT%][%FLBDEX%]!
set FLBDAT=!FLBDAT[%SELENT%][%FLBDEX%]!
endlocal & set SRCPTH="%ISSDIR:"=%\%FLBDIR:"=%\%FMWPRF%%FLBPRF%%FLBCOD%%FLBSUF%%FLBREV%_%FLBDAT%.%FLBEXT%"
if not "%ISSDRV%"=="" set SRCPTH="%ISSDRV:"=%:\%SRCPTH:"=%"
:DOFWUPGRADE
set SRCPTH=%SRCPTH:/=\%
call :FWUPGRADE %SRCPTH%
goto :END
:FWUPGRADE
echo ###########################################################
echo ### Firmware to be sent: %1
echo ###########################################################
if "%INTMOD%"=="y" pause
call %JSNCMD% sendfwbin fileSize %~z1 mode %UPGMOD%
for /f "tokens=7" %%i in ('type %RETOUT%') do set RSPPRT=%%i
if "%RSPPRT%"=="" goto :RETERR
echo ###########################################################
echo ### %NCTEXE% -n -w%RSPTIM% %TGTADR% %RSPPRT% ^< %1
echo ###########################################################
if "%INTMOD%"=="y" pause
%NCTEXE% -n -w%RSPTIM% %TGTADR% %RSPPRT% < %1
exit /b 0
:DRONETYPE
echo ###########################################################
echo ### Current Drone Type: %DEFTYP:"=%
echo ###########################################################
call %LSTCHK% %DRNLST% %DEFTYP%
if "%SELENT%"=="" exit /b 0
echo ###########################################################
echo ### Upgrading %SELENT:"=% Drone Firmware
echo ###########################################################
exit /b 0
:RETERR
echo ###########################################################
echo ### Invalid Response Port...
echo ###########################################################
:END
