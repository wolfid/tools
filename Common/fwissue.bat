@echo off
set SETENV="%~dp0..\%DEVCOM%\setenv%~x0"
set GETLVL="%~dp0..\%DEVCOM%\getlvl%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
set DOCOPY="%~dp0..\%DEVCOM%\docopy%~x0"
echo ###########################################################
echo ###                                ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV%
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
call %GETLVL% %1 %2
echo ###########################################################
echo ### Issue Type: %BLDLVL%
echo ###########################################################
setlocal EnableDelayedExpansion
if "%BDVNAM%"=="" goto :SCSPTH
set VERPTH=!VERPTH[%BLDLVL%]!
echo ###########################################################
echo ### Get Build Version Details From: %VERPTH:"=%\%BDVNAM%.%VEREXT%
echo ###########################################################
for /f "tokens=*" %%i in (%VERPTH:"=%\%BDVNAM%.%VEREXT%) do set BLDVER=%%i
if not "!BLDVER:~%LVLBEG%,%LVLLEN%!"=="%BLDLVL%" set WRNLVL=!BLDVER:~%LVLBEG%,%LVLLEN%!
set BLDVER=!BLDVER:~%REVBEG%,-%REVEND%!
goto :DOCOPY
:SCSPTH
set SCSPTH=!SCSPTH[%BLDLVL%]!
echo ###########################################################
echo ### Generate Build Version Details From: %SCSPTH:"=%
echo ###########################################################
call %GENREV% %1 %SCSPTH%
:DOCOPY
echo ###########################################################
echo ### Build Version: %BLDVER%
echo ###########################################################
call %DOCOPY% %1 "%ISSPTH:"=%\%BLDVER%" %BINPTH% %ISSLST:"=%
if "%WRNLVL%"=="" goto :END
echo ###########################################################
echo ### WARNING: Non Matching Build Levels (%WRNLVL%::%BLDLVL%)
echo ###########################################################
:END
endlocal
