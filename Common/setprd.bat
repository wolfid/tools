@echo off
for /f "tokens=1,2 delims== eol=#" %%i in (%~1) do if "%%i"=="%2" (
if "%%j"=="%3" (
set PRDTYP=%4
exit /b 0
))
