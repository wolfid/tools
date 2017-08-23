@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% TGTADR %SETENV%
if not "%INTMOD%"=="y" goto :UPGMOD
echo ###########################################################
set /p UPGMOD= ### Upgrade Mode 0..1 (%UPGMOD%)?
echo ###########################################################
if "%UPGMOD%"=="1" (if "%SNXREV%"=="%UPGLTT%" (set USELTT=y
) else (set FMWREV=%SNXREV%
set FMWDAT=%SNXDAT%
)) else if "%MOBREV%"=="%UPGLTT%" (set USELTT=y
else (set FMWREV=%MOBREV%
set FMWDAT=%MOBDAT%
)
echo ###########################################################
set /p USELTT= ### Use Latest Version y/n (%USELTT%)?
echo ###########################################################
if "%USELTT%"=="y" goto :UPGMOD
echo ###########################################################
set /p FMWREV= ### Firmware Revision (%FMWREV%)?
echo ###########################################################
echo ###########################################################
set /p FMWDAT= ### Firmware Date (%FMWDAT%)?
echo ###########################################################
if "%UPGMOD%"=="1" (set SNXREV=%FMWREV%
set SNXDAT=%FMWDAT%
) else (set MOBREV=%FMWREV%
set MOBDAT=%FMWDAT%
)
:UPGMOD
set CMDSTR="http://%TGTADR%/ajax/command.json^?command1^=file_upload()^&uploadtype="
if not "%UPGMOD%"=="1" goto :MBUPGD
echo ###########################################################
echo ### WiFi Firmware Upgrade
echo ###########################################################
set CMDSTR="%CMDSTR:"=%sonix"
if "%SNXREV%"=="%UPGLTT%" (set FILSTR="file=@%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%"
) else set FILSTR="file=@%ISSDRV%:\%ISSDIR:"=%\%PRDDIR:"=%\%FMWPRF%%SNXPRF%%PRDCOD%%SNXSUF%%SNXREV%_%SNXDAT%"
set FILSTR="%FILSTR:"=%\%SNXBIN%.%SNXEXT%"
goto :RUNDLL
:MBUPGD
echo ###########################################################
echo ### MotorBoard Firmware Upgrade
echo ###########################################################
set CMDSTR="%CMDSTR:"=%MotorBoard"
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
