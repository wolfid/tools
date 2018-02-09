@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set DRNLST="%~dp0..\%DEVPRJ%\drnlst"
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set LSTCHK="%~dp0..\%DEVCOM%\lstchk%~x0"
set JSNCMD="%~dp0..\%DEVCOM%\jsncmd%~x0"
echo ###########################################################
echo ###                            ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV% %1
if not "%2"=="" set BLDLVL=%2
if "%BLDLVL%"=="" set BLDLVL=DB
if not "%3"=="" set UPGMOD=%3
if "%UPGMOD%"=="" set UPGMOD=1
if not "%4"=="" set PRDTYP=%4
if "%PRDTYP%"=="" set PRDTYP=%PRDTYP[1]%
echo ###########################################################
echo ### Firmware Upgrade Mode: %UPGMOD%
echo ###########################################################
if not "%INTMOD%"=="y" goto :UPGMOD
echo ###########################################################
set /p UPGMOD= ### Upgrade Mode(%UPGMOD%)?
echo ###########################################################
:UPGMOD
if "%BLDLVL%"=="%ISSDBG%" if "%UPGMOD%"=="1" goto :SNXLTT
setlocal enabledelayedexpansion
set BINPTH="%ISSPTH:"=%\!PRDCOD[%PRDTYP%]!_FW_!BRDCOD[%UPGMOD%]!_%BLDLVL%_!UPDREV[%UPGMOD%]!_!UPDDAT[%UPGMOD%]!!UPDBIN[%UPGMOD%]!"
endlocal & set BINPTH=%BINPTH%
goto :BINPTH
:SNXLTT
echo ###########################################################
echo ### Using Most Recent Build...
echo ###########################################################
set BINPTH="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%SVNBRA%\%DEVBRA%\%SDKDIR%\%IMGDIR%\%IMGTYP%%UPDBIN[1]%"
:BINPTH
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
exit /b 0
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
exit /b 0
:END
