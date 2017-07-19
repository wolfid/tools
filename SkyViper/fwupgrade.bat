@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set LSTCHK="%~dp0..\%DEVCOM%\lstchk%~x0"
set JSNCMD="%~dp0..\%DEVCOM%\jsncmd%~x0"
set DRNLST="%~dp0..\%DEVPRJ%\drnlst"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                               ~\%DEVPRJ%\%~nx0 ###
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
call :DRONETYPE
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
:DOFWUPGRADE
set SRCPTH=%SRCPTH:/=\%
call :FWUPGRADE "%SRCPTH:"=%\%IMGBIN%.%IMGEXT%"
goto :END
:FLIGHTBOARD
echo ###########################################################
echo ### Upgrading Flight Board Firmware
echo ###########################################################
call :DRONETYPE
set SRCPTH="%ISSDIR:"=%\%DEFDIR:"=%"
if not "%ISSDRV%"=="" set SRCPTH="%ISSDRV:"=%:\%SRCPTH:"=%"
set SRCPTH=%SRCPTH:/=\%
call :FWUPGRADE "%SRCPTH:"=%\%FMWPRF%%FLBPRF%%SDRCOD%%FLBSUF%%FLBREV%_%FLBDAT%.%FLBEXT%"
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
if not "%SELENT%"=="" set DEFDIR=%SELENT%
echo ###########################################################
echo ### Upgrading %DEFDIR:"=% Drone
echo ###########################################################
set SRCPTH=%ISSDIR:"=%\%DEFDIR:"=%\%FMWPRF%%SNXPRF%%SDRCOD%%SNXSUF%%SNXREV%_%SNXDAT%
if not "%ISSDRV%"=="" set SRCPTH=%ISSDRV%:\%SRCPTH%
exit /b 0
:RETERR
echo ###########################################################
echo ### Invalid Response Port...
echo ###########################################################
:END
