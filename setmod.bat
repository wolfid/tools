@echo off
set MODCHK="%~dp0Common\modchk%~x0"
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %MODCHK% %1 %QMDLST%
if not "%MODRET%"=="" set DSPMOD=q
call %MODCHK% %1 %NMDLST%
if not "%MODRET%"=="" set DSPMOD=n
call %MODCHK% %1 %IMDLST%
if not "%MODRET%"=="" set INTMOD=y
call %MODCHK% %1 %AMDLST%
if not "%MODRET%"=="" set INTMOD=n
