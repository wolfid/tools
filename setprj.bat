for /f %%i in ('dir /b %CNFPTH:"=%\%CNFDIR:"=%\%CNFPRJ:"=%\*.ini') do for /f "tokens=*" %%j in (%CNFPTH:"=%\%CNFDIR:"=%\%CNFPRJ:"=%\%%i) do set %%~ni=%%j
