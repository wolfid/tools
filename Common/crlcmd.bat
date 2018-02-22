@echo off
set SETENV="%~dp0..\%DEVCOM%\setenv%~x0"
set MODCHK="%~dp0..\%DEVCOM%\modchk%~x0"
set RETOUT="%~dp0..\%DEVPRJ%\%~n0.out"
echo ###########################################################
echo ###                            ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV%
echo ###########################################################
echo ### Target Address: %TGTADR%
echo ###########################################################
if "%1"=="" goto :ARGERR
call %MODCHK% %1 "%QMDLST:"=%_%NMDLST:"=%"
if not "%MODRET%"=="" shift
if "%1"=="" goto :ARGERR
set CMDSTR=command1^=%1(
shift
if "%1"=="" goto :CRLCMD
set CMDSTR=%CMDSTR%%1
shift
:CMDLPP
if "%1"=="" goto :CRLCMD
set CMDSTR=%CMDSTR%,%1
shift
goto :CMDLPP
:CRLCMD
set CMDSTR=http://%TGTADR%/ajax/command.json^?%CMDSTR%)
echo ###########################################################
echo ### Sending %CMDSTR% to %TGTADR%
echo ###########################################################
if "%INTMOD%"=="y" pause
%CRLEXE% %CMDSTR%
goto :END
:TGTERR
echo ###########################################################
echo ### Netcat parameter (TGTTIM/TGTADR/TGTPRT) not set...
echo ###########################################################
goto :END
:ARGERR
echo ###########################################################
echo ### Need at least one argument...
echo ###########################################################
:END
