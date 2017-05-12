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
if not "%INTMOD%"=="y" goto :UPGMOD
echo ###########################################################
set /p UPGMOD= ### Upgrade Mode(%UPGMOD%)?
echo ###########################################################
:UPGMOD
if "%UPGMOD%"=="0" goto :FLIGTHBOARD
:WIFIBOARD
echo ###########################################################
echo ### Upgrading Wi-Fi Board Firmware
echo ###########################################################
set SRCPTH=%PRJDIR%
if not "%DEVBRA%"=="%DEVTRK%" set SRCPTH=%PRJDIR%\%DEVBRA%
if not "%PRJDRV%"=="" set SRCPTH=%PRJDRV%:\%SRCPTH%
if not "%SDKDIR%"=="" set SRCPTH=%SRCPTH%\%SDKDIR:"=%
if not "%IMGDIR%"=="" set SRCPTH=%SRCPTH%\%IMGDIR:"=%
set SRCPTH=%SRCPTH:/=\%
call :FWUPGRADE "%SRCPTH:"=%\%IMGBIN:~0,-2%.%IMGEXT%"
goto :END
:FLIGTHBOARD
echo ###########################################################
echo ### Upgrading Flight Board Firmware
echo ###########################################################
call %LSTCHK% %TGTLST% %SDRDIR%
if not "%SELENT%"=="" set SDRDIR=%SELENT%
set SRCPTH=%ISSDIR:"=%\%SDRDIR:"=%\%FLBPRF%%SDRCOD%%FLBSUF%%UPGREV%_%UPGDAT%.%FLBEXT%
if not "%ISSDRV%"=="" set SRCPTH=%ISSDRV%:\%SRCPTH%
set SRCPTH=%SRCPTH:/=\%
call :FWUPGRADE "%SRCPTH:"=%\%FLBPRF%%SDRCOD%%FLBSUF%%UPGREV%_%UPGDAT%.%FLBEXT%"
goto :END
:FWUPGRADE
echo ###########################################################
echo ### Firmware to be sent: %1
echo ###########################################################
if "%INTMOD%"=="y" pause
call %JSNCMD% sendfwbin fileSize %~z1 mode %UPGMOD%
echo ###########################################################
echo ### %NCTEXE% -n -w%RSPTIM% %TGTADR% %RSPPRT% ^< %1
echo ###########################################################
%NCTEXE% -n -w%RSPTIM% %TGTADR% %RSPPRT% < %1
exit /b 0
:END
