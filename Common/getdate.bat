@echo off
if "%1"=="q" shift
if "%1"=="" (set DATSRC=%date%) else set DATSRC=%~t1
for /f "tokens=1,2,3 delims=/" %%i in ("%DATSRC%") do set dd=%%i && set mm=%%j && set yyyy=%%k
set dd=%dd: =%
if "%mm:~0,1%"=="0" set mm=%mm:~1%
for /f "tokens=%mm%" %%i in ("jan feb mar apr may jun jul aug sep oct nov dec") do set mmm=%%i
if "%1"=="" (for /f "tokens=1,2,3 delims=:" %%i in ("%time%") do set hour=%%i && set min=%%j && set sec=%%k
) else set hour=%yyyy:~5,2% && set min=%yyyy:~8,2% && set sec=00
set yyyy=%yyyy:~0,4%
set hour=%hour: =%
set min=%min: =%
set sec=%sec: =%
