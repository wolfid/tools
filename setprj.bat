call %NPPENV%
for /f %%i in (%NPPCNF:"=%\%NPPSEL:"=%\DEVPRJ.ini) do set DEVPRJ=%%i
