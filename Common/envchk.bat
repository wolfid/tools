@echo off
set CMDEXE="%~dp0..\Common\cmdexe%~x0"
set MODCHK="%~dp0..\Common\modchk%~x0"
call %MODCHK% %3 %QMDLST%
if "%1"=="JSTDIT" goto :JSTDIT
if not "%MODRET%"=="" goto :QUIET
call %MODCHK% %1 %VARLST%
if not "%MODRET%"=="" goto :QUIET
echo ###########################################################
echo ### If %1 not set then execute %2
echo ###########################################################
:QUIET
for /f %%i in ('echo %%%1%%') do if not "%%i"=="%%%1%%" (goto :END) else call %CMDEXE% %2 %3
for /f %%i in ('echo %%%1%%') do if not "%%i"=="%%%1%%" (goto :END) else echo ### %1 not defined in %2
goto :END
:JSTDIT
if not "%MODRET%"=="" goto :JSTDIT_QUIET
echo ###########################################################
echo ### Execute %2
echo ###########################################################
:JSTDIT_QUIET
call %CMDEXE% %2 %3 %4 %5 %6 %7 %8 %9
:END
