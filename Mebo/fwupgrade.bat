@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% TGTADR %SETENV%
set CMDSTR="http://%TGTADR%/ajax/command.json^?command1^=file_upload()^&uploadtype="
if not "%UPGMOD%"=="1" goto :MBUPGD
echo ###########################################################
echo ### WiFi Firmware Upgrade
echo ###########################################################
set CMDSTR="%CMDSTR:"=%sonix"
if "%UPGLTT%"=="USE_LATEST" (set FILSTR="file=@%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%\%IMGBIN%.%IMGEXT%"
) else set FILSTR="file=@%ISSDRV%:\%ISSDIR:"=%\%PRDDIR:"=%\%FMWPRF%%SNXPRF%%PRDCOD%%SNXSUF%%SNXREV%_%SNXDAT%\%IMGBIN%.%IMGEXT%"
goto :RUNDLL
:MBUPGD
echo ###########################################################
echo ### MotorBoard Firmware Upgrade
echo ###########################################################
set CMDSTR="%CMDSTR:"=%MotorBoard"
set FILSTR="file=@%ISSDRV%:\%ISSDIR:"=%\%PRDDIR:"=%\%FMWPRF%%MOBPRF%%PRDCOD%%MOBSUF%%MOBREV%_%MOBDAT%\%MOBBIN%.%MOBEXT%"
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