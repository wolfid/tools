@echo off
set ENVCHK="%~dp0Common\envchk%~x0"
set LSTCHK="%~dp0Common\lstchk%~x0"
set SETMOD="%~dp0setmod%~x0"
set DSPTTL="%~dp0dspttl%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
set PRJLST="%~dp0prjlst"
set VARLST=DEVTTL_DEVPRJ_QMDLST
set EXELST=dspttl_setprj_setenv
call %ENVCHK% DEVTTL %DSPTTL% q
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVPRJ %SETPRJ%
echo ###########################################################
echo ### Current Development Project: %DEVPRJ%
echo ###########################################################
call %ENVCHK% JSTDIT %SETENV% q
call %ENVCHK% JSTDIT %SETMOD% %1
call %LSTCHK% %PRJLST% %DEVPRJ%
if not "%SELENT%"=="" echo set DEVPRJ=%SELENT%>%SETPRJ%
:END
if "%INTMOD%"=="y" pause
