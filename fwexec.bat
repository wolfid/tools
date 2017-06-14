@echo off
set ENVCHK="%~dp0Common\envchk%~x0"
set CMDEXE="%~dp0Common\cmdexe%~x0"
set DSPTTL="%~dp0title%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
if "%1"=="q" (set DSPMOD=q
) else if "%2"=="q" set DSPMOD=q
call %ENVCHK% DEVTTL %DSPTTL% %DSPMOD%
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVPRJ %SETPRJ% %DSPMOD%
echo ###########################################################
echo ### Development Project: %DEVPRJ%
echo ###########################################################
call %ENVCHK% INTMOD %SETENV% %DSPMOD%
echo ###########################################################
echo ### Interactive Mode: %INTMOD%
echo ###########################################################
if "%1"=="" goto :DOCOMEXE
if "%1"=="q" goto :DOCOMEXE
set COMEXE="%~dp0%DEVCOM%\%~1%~x0"
set PRJEXE="%~dp0%DEVPRJ%\%~1%~x0"
shift
if exist %PRJEXE% (call %CMDEXE% %PRJEXE% %1 %2 %3 %4 %4 %5 %6 %7 %8 %9
) else call %CMDEXE% %COMEXE% %1 %2 %3 %4 %4 %5 %6 %7 %8 %9
goto :END
:DOCOMEXE
set COMEXE="%~dp0%DEVCOM%\%~nx0"
set PRJEXE="%~dp0%DEVPRJ%\%~nx0"
if exist %PRJEXE% (call %CMDEXE% %PRJEXE% %DSPMOD%
) else call %CMDEXE% %COMEXE% %DSPMOD%
:END
if "%INTMOD%"=="y" pause
