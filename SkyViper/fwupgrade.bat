@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set LSTCHK="%~dp0..\%DEVCOM%\lstchk%~x0"
set JSNCMD="%~dp0..\%DEVCOM%\jsncmd%~x0"
set DRNLST="%~dp0..\%DEVPRJ%\drnlst"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
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
call :FWUPGRADE_Q "%UPGIMG:"=%"
goto :END
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
if "%SNXREV%"=="%UPGLTT%" goto :USE_LATEST
if "%SNXREV%"=="" (call :DRONETYPE
) else set SELENT=%SNXREV%
set SELENT=%SELENT:"=%
setlocal enabledelayedexpansion
set SNXDIR=!DEFDIR[%SELENT%]!
set SNXCOD=!DEFCOD[%SELENT%]!
set SNXREV=!SNXREV[%SELENT%]!
set SNXDAT=!SNXDAT[%SELENT%]!
set SRCPTH="%ISSDIR:"=%\%SNXDIR:"=%"
endlocal & set SRCPTH="%SRCPTH:"=%\%FMWPRF%%SNXPRF%%SNXCOD%%SNXSUF%%SNXREV%_%SNXDAT%\%SNXBIN%.%SNXEXT%"
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
echo ### Upgrading Flight Board Firmware
echo ###########################################################
if "%FLBREV%"=="" (call :DRONETYPE
) else set SELENT=%FLBREV%
set SELENT=%SELENT:"=%
setlocal enabledelayedexpansion
set FLBDIR=!DEFDIR[%SELENT%]!
set FLBCOD=!DEFCOD[%SELENT%]!
set FLBREV=!FLBREV[%SELENT%]!
set FLBDAT=!FLBDAT[%SELENT%]!
set SRCPTH="%ISSDIR:"=%\%FLBDIR:"=%"
if not "%ISSDRV%"=="" set SRCPTH="%ISSDRV:"=%:\%SRCPTH:"=%"
endlocal & set SRCPTH="%SRCPTH:"=%\%FMWPRF%%FLBPRF%%FLBCOD%%FLBSUF%%FLBREV%_%FLBDAT%.%FLBEXT%"
:DOFWUPGRADE
set SRCPTH=%SRCPTH:/=\%
call :FWUPGRADE %SRCPTH%
goto :END
:FWUPGRADE
echo ###########################################################
echo ### Firmware to be sent: %1
echo ###########################################################
:FWUPGRADE_Q
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
echo ### Current Drone Type: %DEFDIR:"=%
echo ###########################################################
call %LSTCHK% %DRNLST% %DEFDIR%
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
