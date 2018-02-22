for /f %%i in ('dir /b %NPPCNF:"=%\%NPPTLS:"=%\*.ini') do for /f %%j in (%NPPCNF:"=%\%NPPTLS:"=%\%%i) do set %%~ni=%%j
