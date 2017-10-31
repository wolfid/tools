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
call %ENVCHK% TGTADR %SETENV%
if not "%4"=="" set UPGTYP=%4
if not "%3"=="" set UPGMOD=%3
echo ###########################################################
echo ### Firmware Upgrade Mode: %UPGMOD%
echo ###########################################################
if not "%INTMOD%"=="y" goto :UPGMOD
echo ###########################################################
set /p UPGMOD= ### Upgrade Mode(%UPGMOD%)?
echo ###########################################################
:UPGMOD
if "%UPGMOD%"=="0" goto :CTLUPG
:SNXUPG
echo ###########################################################
echo ### Upgrading Wi-Fi Board Firmware...
echo ###########################################################
if "%2"=="%SVNDBG%" goto :SNXLTT
if not "%2"=="SVNDEF" set SNXDEX=%2
if "%UPGTYP%"=="" (call :DRNTYP
) else set SELENT=%UPGTYP%
set SELENT=%SELENT:"=%
setlocal enabledelayedexpansion
set BINPTH="%SVNDIR:"=%\%ISSDIR:"=%\!DIRLST[%SELENT%]:"=!\%FMWPRF%%SNXPRF%!PRDCOD[%SELENT%]!%SNXSUF%!SNXREV[%SNXDEX%]!_!SNXDAT[%SNXDEX%]!\%SNXBIN%.%SNXEXT%"
endlocal & set BINPTH=%BINPTH%
goto :ISSDRV
:SNXLTT
echo ###########################################################
echo ### Using Most Recent Build...
echo ###########################################################
set BINPTH=%SUBDIR%
if not "%DEVBRA%"=="%DEVTRK%" set BINPTH="%BINPTH:"=%\%DEVBRA%"
if not "%PRJDRV%"=="" set BINPTH="%PRJDRV%:\%BINPTH:"=%"
if not "%SDKDIR%"=="" set BINPTH="%BINPTH:"=%\%SDKDIR:"=%"
if not "%IMGDIR%"=="" set BINPTH="%BINPTH:"=%\%IMGDIR:"=%"
if not "%IMGTYP%"=="" set BINPTH="%BINPTH:"=%\%IMGTYP:"=%"
set BINPTH="%BINPTH:"=%\%SNXBIN%.%SNXEXT%"
goto :BINPTH
:CTLUPG
echo ###########################################################
echo ### Upgrading Flight Board Firmware...
echo ###########################################################
if not "%2"=="SVNDEF" set CTLDEX=%2
if "%UPGTYP%"=="" (call :DRNTYP
) else set SELENT=%UPGTYP%
set SELENT=%SELENT:"=%
setlocal enabledelayedexpansion
set BINPTH="%SVNDIR:"=%\%ISSDIR:"=%\!DIRLST[%SELENT%]:"=!\%FMWPRF%%CTLPRF%!PRDCOD[%SELENT%]!%CTLSUF%!CTLREV[%CTLDEX%]!_!CTLDAT[%CTLDEX%]!.%CTLEXT%"
endlocal & set BINPTH=%BINPTH%
:ISSDRV
if not "%ISSDRV%"=="" set BINPTH="%ISSDRV:"=%:\%BINPTH:"=%"
:BINPTH
set BINPTH=%BINPTH:/=\%
call :FMWUPG %BINPTH%
goto :END
:FMWUPG
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
:DRNTYP
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
