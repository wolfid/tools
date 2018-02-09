@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set BLDTAG="%~dp0..\%DEVCOM%\bldtag%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
set DOCOPY="%~dp0..\%DEVCOM%\docopy%~x0"
echo ###########################################################
echo ###                               ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV% %1
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
if not "%2"=="" (set BLDLVL=%2
) else set BLDLVL=%ISSDEF%
echo ###########################################################
echo ### Issue Code: %BLDLVL%
echo ###########################################################
if "%BDVNAM%"=="" goto :SCSPTH
setlocal EnableDelayedExpansion
set VERPTH=!VERPTH[%BLDLVL%]!
endlocal & set VERPTH=%VERPTH%
for /f "tokens=*" %%i in (%VERPTH:"=%\%BDVNAM%.%VEREXT%) do set BLDVER=%%i
set BLDVER=%BLDVER:~25,-3%
echo ###########################################################
echo ### Build Version: %BLDVER%
echo ###########################################################
goto :DOCOPY
:SCSPTH
setlocal EnableDelayedExpansion
set SCSPTH=!SCSPTH[%BLDLVL%]!
endlocal & set SCSPTH=%SCSPTH%
echo ###########################################################
echo ### Repo Location: %SCSPTH:"=%
echo ###########################################################
call %GETREV% %1 %SCSPTH%
echo ###########################################################
echo ### SCS Revision: %SCSREV%
echo ###########################################################
echo ###########################################################
echo ### SCS Tag: %SCSTAG%
echo ###########################################################
echo ###########################################################
echo ### Board Code: %BRDCOD%
echo ###########################################################
if "%PRDCOD%"=="" call %PRDCHK%
echo ###########################################################
echo ### Product Code: %PRDCOD%
echo ###########################################################
set BLDVER=%PRDCOD%_FW_%BRDCOD%_%BLDLVL%_%SCSTAG%.%SCSREV%_%yyyy%%mm%%dd%
:DOCOPY
echo on
call %DOCOPY% %1 "%ISSPTH:"=%\%BLDVER%" %BINPTH% %ISSLST:"=%
