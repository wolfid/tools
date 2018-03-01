for /f %%j in ('dir /b %CNFPTH:"=%\%CNFDIR:"=%\%DEVPRJ%\*.ini') do for /f "tokens=*" %%k in (%CNFPTH:"=%\%CNFDIR:"=%\%DEVPRJ%\%%j) do set %%~nj=%%k
for /f %%i in ('dir /b %CNFPTH:"=%\%CNFDIR:"=%\%DEVPRJ%\*.') do for /f %%j in ('dir /b %CNFPTH:"=%\%CNFDIR:"=%\%DEVPRJ%\%%i\*.ini') do for /f "tokens=*" %%k in (%CNFPTH:"=%\%CNFDIR:"=%\%DEVPRJ%\%%i\%%j) do set %%~nj=%%k
