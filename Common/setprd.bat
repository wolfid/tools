@echo off
if "%1"=="q" (shift
) else if "%1"=="n" (shift
) else if "%1"=="qn" (shift
) else if "%1"=="nn" (shift
) else if "%1"=="ny" (shift
) else if "%1"=="qy" shift
echo ###########################################################
echo ### Search for %2 in %1
echo ###########################################################
for /f "tokens=1,2 delims== eol=#" %%i in (%~1) do if "%%i"=="%2" (
if "%%j"=="%3" (
set PRDCOD=%4
set PRDDIR=%5
))
