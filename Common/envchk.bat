@echo off
set CMDEXE="%~dp0..\Common\cmdexe%~x0"
if "%3"=="q" goto :QUIET
echo ###########################################################
echo ### If %1 not set then execute %2
echo ###########################################################
:QUIET
for /f %%i in ('echo %%%1%%') do if not "%%i"=="%%%1%%" (exit /b 0) else call %CMDEXE% %2 %3
for /f %%i in ('echo %%%1%%') do if not "%%i"=="%%%1%%" (exit /b 0) else echo ### %1 not defined in %2
