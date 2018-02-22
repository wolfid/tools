@echo off
set SETENV="%~dp0..\%DEVCOM%\setenv%~x0"
set REVCHK="%~dp0..\%DEVPRJ%\revchk%~x0"
echo ###########################################################
echo ###                                ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV%
if "%INTMOD%"=="y" call %REVCHK% %1
if not "%2"=="" (set BLDLVL=%2) else set BLDLVL=%ISSDBG%
echo ###########################################################
echo ### Issue Type: %BLDLVL%
echo ###########################################################
if not "%3"=="" (set UPGMOD=%3) else set UPGMOD=1
echo ###########################################################
echo ### Firmware Upgrade Mode: %UPGMOD%
echo ###########################################################
setlocal enabledelayedexpansion
set CMDSTR="http://%TGTADR%/ajax/command.json^?command1=file_upload()^&uploadtype=!UPDTYP[%UPGMOD%]!"
endlocal & set CMDSTR=%CMDSTR%
if "%BLDLVL%"=="%ISSDBG%" if "%UPGMOD%"=="1" goto :ISSDBG
setlocal enabledelayedexpansion
set BINPTH="file=@%ISSPTH:"=%\%PRDCOD%_FW_!BRDCOD[%UPGMOD%]!_%BLDLVL%_!UPDREV[%UPGMOD%]!_!UPDDAT[%UPGMOD%]!!UPDBIN[%UPGMOD%]!"
endlocal & set BINPTH=%BINPTH%
goto :RUNDLL
:ISSDBG
set BINPTH="file=@%BINPTH:"=%%UPDBIN[1]%"
:RUNDLL
echo ###########################################################
echo ### Clearing Internet Form Data
echo ###########################################################
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
echo ###########################################################
echo ### Sending %BINPTH% to %CMDSTR%
echo ###########################################################
echo on
%CRLEXE% -F %BINPTH% %CMDSTR%
:END
