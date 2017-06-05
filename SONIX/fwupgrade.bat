@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set LSTCHK="%~dp0..\%DEVCOM%\lstchk%~x0"
set TGTLST="%~dp0..\%DEVPRJ%\tgtlst"
set JSNCMD="%~dp0..\%DEVPRJ%\sendjsoncmd%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                               ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% UPGMOD %SETENV%
echo ###########################################################
echo ### Current Firmware Upgrade Mode: %UPGMOD%
echo ###########################################################
if "%UPGIMG%"=="" goto :LSTCHK
echo ###########################################################
echo ### Using Upgrade Image: %UPGIMG%
echo ###########################################################
call :FWUPGRADE_Q "%UPGIMG:"=%"
goto :END
:LSTCHK
call %LSTCHK% %TGTLST% %SDRDIR%
if not "%SELENT%"=="" set SDRDIR=%SELENT%
echo ###########################################################
echo ### Upgrading for: %SDRDIR%
echo ###########################################################
if not "%INTMOD%"=="y" goto :UPGMOD
echo ###########################################################
set /p UPGMOD= ### Upgrade Mode(%UPGMOD%)?
echo ###########################################################
:UPGMOD
if "%UPGMOD%"=="0" goto :FLIGHTBOARD
:WIFIBOARD
echo ###########################################################
echo ### Upgrading Wi-Fi Board Firmware
echo ###########################################################
if "%SNXREV%"=="%UPGLTT%" goto :USE_LATEST
set SRCPTH=%ISSDIR:"=%\%SDRDIR:"=%\%SNXPRF%%SDRCOD%%SNXSUF%%SNXREV%_%SNXDAT%
if not "%ISSDRV%"=="" set SRCPTH=%ISSDRV%:\%SRCPTH%
goto :DOFWUPGRADE
:USE_LATEST
set SRCPTH=%SUBDIR%
if not "%DEVBRA%"=="%DEVTRK%" set SRCPTH="%SRCPTH:"=%\%DEVBRA%"
if not "%PRJDRV%"=="" set SRCPTH="%PRJDRV%:\%SRCPTH:"=%"
if not "%SDKDIR%"=="" set SRCPTH="%SRCPTH:"=%\%SDKDIR:"=%"
if not "%IMGDIR%"=="" set SRCPTH="%SRCPTH:"=%\%IMGDIR:"=%"
:DOFWUPGRADE
set SRCPTH=%SRCPTH:/=\%
call :FWUPGRADE "%SRCPTH:"=%\%IMGBIN%.%IMGEXT%"
goto :END
:FLIGHTBOARD
echo ###########################################################
echo ### Upgrading Flight Board Firmware
echo ###########################################################
set SRCPTH=%ISSDIR:"=%\%SDRDIR:"=%\%FLBPRF%%SDRCOD%%FLBSUF%%UPGREV%_%UPGDAT%.%FLBEXT%
if not "%ISSDRV%"=="" set SRCPTH=%ISSDRV%:\%SRCPTH%
set SRCPTH=%SRCPTH:/=\%
call :FWUPGRADE "%SRCPTH:"=%\%FLBPRF%%SDRCOD%%FLBSUF%%FLBREV%_%FLBDAT%.%FLBEXT%"
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
:RETERR
echo ###########################################################
echo ### Invalid Response Port...
echo ###########################################################
:END
