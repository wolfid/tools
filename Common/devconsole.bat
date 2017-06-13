@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                              ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% TGTADR %SETENV%
echo ###########################################################
echo ### %NCTEXE% %TGTADR% %DEVPRT%
echo ###########################################################
%NCTEXE% %TGTADR% %DEVPRT%
