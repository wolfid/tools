@echo off
set ENVCHK="%~dp0Common\envchk%~x0"
set CMDEXE="%~dp0Common\cmdexe%~x0"
set DSPTTL="%~dp0title%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
call %ENVCHK% DEVTTL %DSPTTL% %2
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVPRJ %SETPRJ% %2
echo ###########################################################
echo ### Development Project: %DEVPRJ%
echo ###########################################################
call %ENVCHK% INTMOD %SETENV% %2
echo ###########################################################
echo ### Interactive Mode: %INTMOD%
echo ###########################################################
set COMEXE="%~dp0%DEVCOM%\%~nx0"
set PRJEXE="%~dp0%DEVPRJ%\%~nx0"
set USREXE="%~dp0%DEVPRJ%\%~1%~x0"
if "%1"=="" (if exist %PRJEXE% (call %CMDEXE% %PRJEXE%
) else call %CMDEXE% %COMEXE%
) else call %CMDEXE% %USREXE% %2 %3 %4 %5 %6 %7 %8 %9
if "%INTMOD%"=="y" pause
