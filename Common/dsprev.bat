@echo off
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
if "%VERHTM%"=="" goto :SDKVER
if not exist "%VERPTH:"=%\%VERHTM:"=%" goto :SDKVER
type "%VERPTH:"=%\%VERHTM:"=%"
goto :END
:SDKVER
if "%MAKVMD%"=="LOCAL" goto :LOCAL
if "%SDVNAM%"=="" goto :BLDVER
type "%VERPTH:"=%\%SDVNAM%.%VEREXT%"
:BLDVER
if "%BDVNAM%"=="" goto :END
type "%VERPTH:"=%\%BDVNAM%.%VEREXT%"
goto :END
:LOCAL
if not "%SDVNAM%"=="" echo SDK VERSION: %SDKVER%
if not "%BDVNAM%"=="" echo BLD VERSION: %BLDVER%
:END