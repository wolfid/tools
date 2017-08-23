@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% TGTADR %SETENV%
if not "%INTMOD%"=="y" goto :UPGMOD
set USRINP=
echo ###########################################################
set /p USRINP= ### Upgrade Mode 0..1 (%UPGMOD%)?
echo ###########################################################
if not "%USRINP%"=="" (set UPGMOD=%USRINP%
if not "%NPPEXE%"=="" call :NPPEXT
)
set USELTT=n
if "%UPGMOD%"=="1" (if "%SNXREV%"=="%UPGLTT%" set USELTT=y
) else (if "%MOBREV%"=="%UPGLTT%" set USELTT=y
)
set USRINP=
echo ###########################################################
set /p USRINP= ### Use Latest Version y/n (%USELTT%)?
echo ###########################################################
if not "%USRINP%"=="" (set USELTT=%USRINP%
if not "%NPPEXE%"=="" call :NPPEXT
)
if not "%USELTT%"=="y" goto :FMWDET
if "%UPGMOD%"=="1" (set SNXREV=%UPGLTT%
) else set MOBREV=%UPGLTT%
goto :UPGMOD
:FMWDET
if "%UPGMOD%"=="1" (set FMWREV=%SNXREV%
set FMWDAT=%SNXDAT%
) else (set FMWREV=%MOBREV%
set FMWDAT=%MOBDAT%
)
set USRINP=
echo ###########################################################
set /p USRINP= ### Firmware Revision (%FMWREV%)?
echo ###########################################################
if not "%USRINP%"=="" (set FMWREV=%USRINP%
if not "%NPPEXE%"=="" call :NPPEXT
)
set USRINP=
echo ###########################################################
set /p USRINP= ### Firmware Date (%FMWDAT%)?
echo ###########################################################
if not "%USRINP%"=="" (set FMWDAT=%USRINP%
if not "%NPPEXE%"=="" call :NPPEXT
)
if "%UPGMOD%"=="1" (set SNXREV=%FMWREV%
set SNXDAT=%FMWDAT%
) else (set MOBREV=%FMWREV%
set MOBDAT=%FMWDAT%
)
:UPGMOD
set CMDSTR="http://%TGTADR%/ajax/command.json^?command1^=file_upload()^&uploadtype="
if not "%UPGMOD%"=="1" goto :MOBUPG
:SNXUPG
echo ###########################################################
echo ### WiFi Firmware Upgrade
echo ###########################################################
set CMDSTR="%CMDSTR:"=%%SNXTYP%"
if "%SNXREV%"=="%UPGLTT%" (set FILSTR="file=@%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%"
) else set FILSTR="file=@%ISSDRV%:\%ISSDIR:"=%\%PRDDIR:"=%\%FMWPRF%%SNXPRF%%PRDCOD%%SNXSUF%%SNXREV%_%SNXDAT%"
set FILSTR="%FILSTR:"=%\%SNXBIN%.%SNXEXT%"
goto :RUNDLL
:NPPEXT
set /p temp=########################################################### & echo.
exit /b 0
:MOBUPG
echo ###########################################################
echo ### MotorBoard Firmware Upgrade
echo ###########################################################
set CMDSTR="%CMDSTR:"=%%MOBTYP%"
if "%MOBREV%"=="%UPGLTT%" (set FILSTR="file=@%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%"
) else set FILSTR="file=@%ISSDRV%:\%ISSDIR:"=%\%PRDDIR:"=%\%FMWPRF%%MOBPRF%%PRDCOD%%MOBSUF%%MOBREV%_%MOBDAT%"
set FILSTR="%FILSTR:"=%\%MOBBIN%.%MOBEXT%"
:RUNDLL
echo ###########################################################
echo ### Clearing Internet Form Data
echo ###########################################################
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
echo ###########################################################
echo ### Sending %FILSTR% to %CMDSTR:"=%
echo ###########################################################
%CRLEXE% -F %FILSTR% %CMDSTR:"=%
:END
