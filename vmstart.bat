@echo off
set ENVCHK="%~dp0Common\envchk%~x0"
set SETENV="%~dp0setenv%~x0"
set DSPTTL="%~dp0title%~x0"
set VBMLST="%~dp0vmlst"
call %ENVCHK% DSPMOD %SETENV% q
call %ENVCHK% DEVTTL %DSPTTL% %DSPMOD%
echo ###########################################################
echo ###                                       ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
for /f "tokens=*" %%i in (%VBMLST:"=%) do %VBMEXE% startvm %%i
