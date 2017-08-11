@echo off
set CMDEXE="%~dp0..\Common\cmdexe%~x0"
if "%1"=="JSTDIT" goto :JSTDIT
if "%3"=="q" goto :QUIET
echo ###########################################################
echo ### If %1 not set then execute %2
echo ###########################################################
:QUIET
for /f %%i in ('echo %%%1%%') do if not "%%i"=="%%%1%%" (goto :END) else call %CMDEXE% %2 %3
for /f %%i in ('echo %%%1%%') do if not "%%i"=="%%%1%%" (goto :END) else echo ### %1 not defined in %2
goto :END
:JSTDIT
if "%3"=="q" goto :JSTDIT_QUIET
echo ###########################################################
echo ### Execute %2
echo ###########################################################
:JSTDIT_QUIET
call %CMDEXE% %2 %3 %4 %5 %6 %7 %8 %9
:END
