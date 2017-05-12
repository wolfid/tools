@echo off
set CMDEXE="%~dp0cmdexe%~x0"
echo ###########################################################
echo ### If %1 not set then execute %2
echo ###########################################################
for /f %%i in ('echo %%%1%%') do if not "%%i"=="%%%1%%" (exit /b 0) else call %CMDEXE% %2
for /f %%i in ('echo %%%1%%') do if not "%%i"=="%%%1%%" (exit /b 0) else echo ### %1 not defined in %2
