@echo off
set ENVCHK="%~dp0Common\envchk%~x0"
set MODCHK="%~dp0Common\modchk%~x0"
set SETMOD="%~dp0setmod%~x0"
set DSPTTL="%~dp0title%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
call %ENVCHK% DEVTTL %DSPTTL% q
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVPRJ %SETPRJ% q
echo ###########################################################
echo ### Development Project: %DEVPRJ%
echo ###########################################################
call %ENVCHK% DEVCOM %SETENV% q
echo ###########################################################
echo ### Common Directory: %DEVCOM%
echo ###########################################################
if "%1"=="" goto :COMEXE
if not "%2"=="" goto :PRJEXE
call %MODCHK% %1 "%QMDLST:"=%_"%NMDLST:"=%
if "%MODRET%"=="" goto :PRJEXE
call %ENVCHK% JSTDIT %SETMOD% %1
goto :COMEXE
:PRJEXE
call %ENVCHK% JSTDIT %SETMOD% %2
set COMEXE="%~dp0%DEVCOM%\%~1%~x0"
set PRJEXE="%~dp0%DEVPRJ%\%~1%~x0"
shift
if exist %PRJEXE% (call %ENVCHK% JSTDIT %PRJEXE% %1 %2 %3 %4 %4 %5 %6 %7 %8 %9
) else call %ENVCHK% JSTDIT %COMEXE% %1 %2 %3 %4 %4 %5 %6 %7 %8 %9
goto :END
:COMEXE
set COMEXE="%~dp0%DEVCOM%\%~nx0"
set PRJEXE="%~dp0%DEVPRJ%\%~nx0"
if exist %PRJEXE% (call %ENVCHK% JSTDIT %PRJEXE% %DSPMOD%
) else call %ENVCHK% JSTDIT %COMEXE% %DSPMOD%
:END
if "%INTMOD%"=="y" pause
