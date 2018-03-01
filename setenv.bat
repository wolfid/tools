for /f %%i in ('dir /b %CNFPTH:"=%\%CNFDIR:"=%\%CNFTLS:"=%\*.ini') do for /f "tokens=*" %%j in (%CNFPTH:"=%\%CNFDIR:"=%\%CNFTLS:"=%\%%i) do set %%~ni=%%j
