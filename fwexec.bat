@echo off
set ENVCHK="%~dp0Common\envchk%~x0"
set MODCHK="%~dp0Common\modchk%~x0"
set DSPTTL="%~dp0dspttl%~x0"
set SETMOD="%~dp0setmod%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
set VARLST=DEVTTL_DEVPRJ_QMDLST
set EXELST=dspttl_setprj_setenv
call %ENVCHK% DEVTTL %DSPTTL% q
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVPRJ %SETPRJ% q
echo ###########################################################
echo ### Development Project: %DEVPRJ%
echo ###########################################################
call %ENVCHK% QMDLST %SETENV% q
if "%1"=="" goto :COMEXE
if "%2"=="" (call %ENVCHK% JSTDIT %SETMOD% %1
) else call %ENVCHK% JSTDIT %SETMOD% %2
if not "%2"=="" goto :PRJEXE
call %MODCHK% %1 "%QMDLST:"=%_%NMDLST:"=%"
if not "%MODRET%"=="" goto :COMEXE
:PRJEXE
set COMEXE="%~dp0%DEVCOM%\%~1%~x0"
set PRJEXE="%~dp0%DEVPRJ%\%~1%~x0"
shift
if exist %PRJEXE% (call %ENVCHK% JSTDIT %PRJEXE% %1 %2 %3 %4 %5 %6 %7 %8 %9
) else call %ENVCHK% JSTDIT %COMEXE% %1 %2 %3 %4 %5 %6 %7 %8 %9
goto :END
:COMEXE
set COMEXE="%~dp0%DEVCOM%\%~nx0"
set PRJEXE="%~dp0%DEVPRJ%\%~nx0"
if exist %PRJEXE% (call %ENVCHK% JSTDIT %PRJEXE% %DSPMOD%
) else call %ENVCHK% JSTDIT %COMEXE% %DSPMOD%
:END
if "%INTMOD%"=="y" pause
