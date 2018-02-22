for /f %%i in ('dir /b %NPPCNF:"=%\%NPPPRJ:"=%\%DEVPRJ%\*.ini') do for /f %%j in (%NPPCNF:"=%\%NPPPRJ:"=%\%DEVPRJ%\%%i) do set %%~ni=%%j
