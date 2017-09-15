@echo off
set MODCHK="%~dp0..\Common\modchk%~x0"
call %MODCHK% %1 %QMDLST%_%NMDLST%
if not "%MODRET%"=="" shift
if "%1"=="" (set DATSRC=%date%
goto :NOFILE
) else set DATSRC=%~t1
echo ###########################################################
echo ### Get Date From: %DATSRC%
echo ###########################################################
:NOFILE
for /f "tokens=1,2,3 delims=/" %%i in ("%DATSRC%") do set dd=%%i && set mm=%%j && set yyyy=%%k
set dd=%dd: =%
set mm=%mm: =%
if "%mm:~0,1%"=="0" set mm=%mm:~1%
for /f "tokens=%mm%" %%i in ("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec") do set mmm=%%i
if "%1"=="" (for /f "tokens=1,2,3 delims=:" %%i in ("%time%") do set hour=%%i & set min=%%j & set sec=%%k
) else set hour=%yyyy:~5,2% & set min=%yyyy:~8,2% & set sec=00
set yyyy=%yyyy:~0,4%
set hour=%hour: =%
if %hour% lss 10 set hour=0%hour%
set min=%min: =%
set sec=%sec: =%
for /f "tokens=3" %%i in ('systeminfo ^| find "Time Zone"') do set timezone=%%i
