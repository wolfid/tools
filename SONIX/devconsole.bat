@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set GETDAT="%~dp0..\%DEVCOM%\getdate%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
call %GETDAT% "%~0"
echo ###########################################################
echo ###                              ~\%DEVPRJ%\%~nx0 ###
echo ###                                         %dd% %mmm% %yyyy% ###
echo ###########################################################
call %ENVCHK% TGTADR %SETENV%
echo ###########################################################
echo ### %NCTEXE% %TGTADR% %DEVPRT%
echo ###########################################################
%NCTEXE% %TGTADR% %DEVPRT%
