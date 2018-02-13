@echo off
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
set VERDET="%~dp0..\%DEVCOM%\verdet%~x0"
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
if not "%~4"=="" (set RMEFIL="%~3\%~4") else set RMEFIL=
call %GETREV% %1 %2 %RMEFIL%
if "%SCSREV%"=="%SCSUNV%" set SCSREV=%SCSDEF%
if "%PRDCOD%"=="" call %PRDCHK%
set BLDVER=%PRDCOD%_%BLDTYP%_%BRDCOD%_%BLDLVL%_%SCSTAG%.%SCSREV%_%yyyy%%mm%%dd%
if "%3"=="" goto :END
if not "%REVTRM%"=="" set REVTRM=%REVTRM:"=%
if not "%SDVNAM%"=="" echo %REVDEF:"=%%SDVNAM%%REVEQU:"=%"%SDKVER%"%REVTRM% > "%~3\%SDVNAM%.%VEREXT%"
if not "%BDVNAM%"=="" echo %REVDEF:"=%%BDVNAM%%REVEQU:"=%"%BLDVER%"%REVTRM% > "%~3\%BDVNAM%.%VEREXT%"
if not "%VERHTM%"=="" call %VERDET% "%~2\%VERHTM:"=%" %SDKVER% %BLDVER%
:END