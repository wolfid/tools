@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set REVCHK="%~dp0..\%DEVPRJ%\revchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set LATREV="%~dp0..\%DEVPRJ%\latrev
echo ###########################################################
echo ###                                ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% TGTADR %SETENV%
if "%INTMOD%"=="y" call %ENVCHK% JSTDIT %REVCHK%
set CMDSTR="http://%TGTADR%/ajax/command.json^?command1=file_upload()^&uploadtype="
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
set BINPTH="file=@%ISSDRV%:\%SVNDIR:"=%\%ISSDIR:"=%\%PRDDIR:"=%\%FMWPRF%%MOBPRF%%PRDCOD%%FMWSUF%!MOBREV[%MOBDEX%]!_!MOBDAT[%MOBDEX%]!\%MOBBIN%.%MOBEXT%"
endlocal & set BINPTH=%BINPTH%
goto :RUNDLL
:MOBLTT
set BINPTH="file=@%MOBDRV%:%MOBDIR:"=%\%MOBBRA%%MOBSCR%\%MOBBIN%.%MOBEXT%"
goto :RUNDLL
:SNXUPG
echo ###########################################################
echo ### Sonix Board Firmware Upgrade
echo ###########################################################
set CMDSTR="%CMDSTR:"=%%SNXTYP%"
if "%2"=="%SVNDBG%" goto :SNXLTT
if "%2"=="%SVNDEF%" goto :LATREV
setlocal enabledelayedexpansion
set BINPTH="file=@%ISSDRV%:\%SVNDIR:"=%\%ISSDIR:"=%\%PRDDIR:"=%\%FMWPRF%%SNXPRF%%PRDCOD%%FMWSUF%!SNXREV[%SNXDEX%]!_!SNXDAT[%SNXDEX%]!\%SNXBIN%.%SNXEXT%"
endlocal & set BINPTH=%BINPTH%
goto :RUNDLL
:LATREV
for /f "tokens=*" %%i in (%LATREV:"=%) do set BLDVER=%%i
set BINPTH="file=@%ISSDRV%:\%SVNDIR:"=%\%ISSDIR:"=%\%PRDDIR:"=%\%BLDVER: =%\%SNXBIN%.%SNXEXT%"
goto :RUNDLL
:SNXLTT
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
