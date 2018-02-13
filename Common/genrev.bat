@echo off
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
set VERDET="%~dp0..\%DEVCOM%\verdet%~x0"
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
if not "%~4"=="" set RMEFIL="%~2\%~4"
call %GETREV% %1 %3 %RMEFIL%
if "%SCSREV%"=="%SCSUNV%" set SCSREV=%SCSDEF%
if "%PRDCOD%"=="" call %PRDCHK%
set BLDVER=%PRDCOD%_%BLDTYP%_%BRDCOD%_%BLDLVL%_%SCSTAG%.%SCSREV%_%yyyy%%mm%%dd%
if not "%SDVNAM%"=="" echo %REVDEF:"=%%SDVNAM%%REVEQU:"=%"%SDKVER%"%REVTRM:"=% > "%~2\%SDVNAM%.%VEREXT%"
if not "%BDVNAM%"=="" echo %REVDEF:"=%%BDVNAM%%REVEQU:"=%"%BLDVER%"%REVTRM:"=% > "%~2\%BDVNAM%.%VEREXT%"
if not "%DETHTM%"=="" call %VERDET% "%~2\%DETHTM:"=%" %SDKVER% %BLDVER%
