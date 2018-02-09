@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set REVCHK="%~dp0..\%DEVPRJ%\revchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV% %1
if "%INTMOD%"=="y" call %REVCHK% %1
set CMDSTR="http://%TGTADR%/ajax/command.json^?command1=file_upload()^&uploadtype="
if not "%3"=="" set UPGMOD=%3
if not "%2"=="" set SCSREV=%2
if "%UPGMOD%"=="%SNXUPG%" goto :SNXUPG
:CTLUPG
echo ###########################################################
echo ### Motor Board Firmware Upgrade
echo ###########################################################
set CMDSTR="%CMDSTR:"=%%CTLTYP%"
if "%SCSREV%"=="ISSDBG" goto :CTLLTT
if not "%SCSREV%"=="SVNLTT" set CTLDEX=%SCSREV%
setlocal enabledelayedexpansion
set BINPTH="%BLDTYP%_%CTLPRF%%PRDCOD%%BLDLVL%!CTLREV[%CTLDEX%]!_!CTLDAT[%CTLDEX%]!\%CTLBIN%.%CTLEXT%"
endlocal & set BINPTH=%BINPTH%
if not "%USEGDV%"=="y" (set BINPTH="file=@%ISSDRV%:\%SVNDIR:"=%\%ISSDIR:"=%\%PRDDIR:"=%\%BINPTH:"=%"
) else set BINPTH="file=@%GDVDRV%:\%GDVHOM:"=%\%GDVUSR:"=%\%GDVDIR:"=%\%GDVTEM:"=%\%GDVPRJ:"=%\%PRDDIR:"=%\%GDVDLV:"=%\%GDVFMW:"=%\%BINPTH:"=%"
goto :RUNDLL
:CTLLTT
set BINPTH="file=@%CTLDRV%:%CTLDIR:"=%\%CTLBRA%%CTLSCR%\%CTLBIN%.%CTLEXT%"
goto :RUNDLL
:SNXUPG
echo ###########################################################
echo ### Sonix Board Firmware Upgrade
echo ###########################################################
set CMDSTR="%CMDSTR:"=%%SNXTYP%"
if "%SCSREV%"=="SVNDBG" goto :SVNDBG
if not "%SCSREV%"=="SVNLTT" set SNXDEX=%SCSREV%
setlocal enabledelayedexpansion
set BINPTH="%BLDTYP%_%BRDCOD%_%PRDCOD%%BLDLVL%!SNXREV[%SNXDEX%]!_!SNXDAT[%SNXDEX%]!\%SNXBIN%.%SNXEXT%"
endlocal & set BINPTH=%BINPTH%
if not "%USEGDV%"=="y" (set BINPTH="file=@%ISSDRV%:\%SVNDIR:"=%\%ISSDIR:"=%\%PRDDIR:"=%\%BINPTH:"=%"
) else set BINPTH="file=@%GDVDRV%:\%GDVHOM:"=%\%GDVUSR:"=%\%GDVDIR:"=%\%GDVTEM:"=%\%GDVPRJ:"=%\%PRDDIR:"=%\%GDVDLV:"=%\%GDVFMW:"=%\%BINPTH:"=%"
goto :RUNDLL
:SVNDBG
set BINPTH="file=@%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%\%SNXBIN%.%SNXEXT%"
:RUNDLL
echo ###########################################################
echo ### Clearing Internet Form Data
echo ###########################################################
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
echo ###########################################################
echo ### Sending %BINPTH% to %CMDSTR%
echo ###########################################################
%CRLEXE% -F %BINPTH% %CMDSTR:"=%
:END
