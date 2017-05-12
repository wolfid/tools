@echo off
set JSNCMD="%~dp0..\%DEVPRJ%\sendjsoncmd%~x0"
echo ###########################################################
echo ###                               ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
for /f "tokens=1,2,3 delims=/" %%i in ("%date%") do set dd=%%i && set mm=%%j && set yyyy=%%k
for /f "tokens=1,2,3 delims=:" %%i in ("%time%") do set hour=%%i && set min=%%j && set sec=%%k
for /f "tokens=3" %%i in ('systeminfo ^| find "Time Zone"') do set timezone=%%i
set yyyy=%yyyy: =%
if "%yyyy:~0,1%"=="0" set yyyy=%yyyy:~1%
set mm=%mm: =%
if "%mm:~0,1%"=="0" set mm=%mm:~1%
set dd=%dd: =%
if "%dd:~0,1%"=="0" set dd=%dd:~1%
set hour=%hour: =%
if "%hour:~0,1%"=="0" set hour=%hour:~1%
set min=%min: =%
if "%min:~0,1%"=="0" set min=%min:~1%
set sec=%sec: =%
set sec=%sec:~0,2%
if "%sec:~0,1%"=="0" set sec=%sec:~1%
echo ###########################################################
echo ### Time: year %yyyy% month %mm% day %dd% hour %hour% min %min% sec %sec% timezone %timezone%
echo ###########################################################
if "%INTMOD%"=="y" pause
call %JSNCMD% synctime year %yyyy% month %mm% day %dd% hour %hour% min %min% sec %sec% timezone %timezone%
