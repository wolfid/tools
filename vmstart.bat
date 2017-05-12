@echo off
set ENVCHK="%~dp0Common\envchk%~x0"
set DSPTTL="%~dp0title%~x0"
set SETENV="%~dp0setenv%~x0"
set VBMLST="%~dp0vmlst"
call %ENVCHK% DEVTTL %DSPTTL%
echo ###########################################################
echo ###                                       ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% VBMEXE %SETENV%
for /f "tokens=*" %%i in (%VBMLST:"=%) do %VBMEXE% startvm %%i
