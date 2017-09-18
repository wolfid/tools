@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set REVCHK="%~dp0..\%DEVPRJ%\revchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% TGTADR %SETENV%
if "%INTMOD%"=="y" call %ENVCHK% JSTDIT %REVCHK%
set CMDSTR="http://%TGTADR%/ajax/command.json^?command1^=file_upload()^&uploadtype="
if not "%3"=="" set UPGMOD=%3
if "%UPGMOD%"=="1" goto :SNXUPG
:MOBUPG
echo ###########################################################
echo ### Motor Board Firmware Upgrade
echo ###########################################################
set CMDSTR="%CMDSTR:"=%%MOBTYP%"
if "%2"=="%SVNDBG%" goto :MOBLTT
if not "%2"=="%SVNDEF%" set MOBDEX=%2
setlocal enabledelayedexpansion
set FILSTR="file=@%ISSDRV%:\%SVNDIR:"=%\%ISSDIR:"=%\%PRDDIR:"=%\%FMWPRF%%MOBPRF%%PRDCOD%%FMWSUF%!MOBREV[%MOBDEX%]!_!MOBDAT[%MOBDEX%]!"
endlocal & set FILSTR="%FILSTR:"=%\%MOBBIN%.%MOBEXT%"
goto :RUNDLL
:MOBLTT
set FILSTR="file=@%MOBDRV%:%MOBDIR:"=%\%MOBBRA%%MOBSCR%\%MOBBIN%.%MOBEXT%"
goto :RUNDLL
:SNXUPG
echo ###########################################################
echo ### Sonix Board Firmware Upgrade
echo ###########################################################
set CMDSTR="%CMDSTR:"=%%SNXTYP%"
if "%2"=="%SVNDBG%" goto :SNXLTT
if not "%2"=="%SVNDEF%" set SNXDEX=%2
setlocal enabledelayedexpansion
set FILSTR="file=@%ISSDRV%:\%SVNDIR:"=%\%ISSDIR:"=%\%PRDDIR:"=%\%FMWPRF%%SNXPRF%%PRDCOD%%FMWSUF%!SNXREV[%SNXDEX%]!_!SNXDAT[%SNXDEX%]!"
endlocal & set FILSTR="%FILSTR:"=%\%SNXBIN%.%SNXEXT%"
goto :RUNDLL
:SNXLTT
set FILSTR="file=@%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%\%SNXBIN%.%SNXEXT%"
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
