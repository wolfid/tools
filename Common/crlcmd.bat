"C:\Program Files (x86)\Curl\curl.exe" http://192.168.99.1/ajax/command.json^?command1^=mebolink_message_send(!ARBCDEFGHIA)
@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set MODCHK="%~dp0..\%DEVCOM%\modchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set RETOUT="%~dp0..\%DEVPRJ%\%~n0.out"
echo ###########################################################
echo ###                            ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% TGTADR %SETENV% %1
echo ###########################################################
echo ### Target Address: %TGTADR%
echo ###########################################################
if "%1"=="" goto :CRLERR
call %MODCHK% %1 "%QMDLST:"=%_%NMDLST:"=%"
if not "%MODRET%"=="" shift
if "%1"=="" goto :CRLERR
set CMDSTR=command1^=%1(
shift
if "%1"=="" goto :CRLCMD
set CMDSTR=%CMDSTR%%1
shift
:CMDLOOP
if "%1"=="" goto :CRLCMD
set CMDSTR=%CMDSTR%,%1
shift
goto :CMDLOOP
:CRLCMD
set CMDSTR=http://%TGTADR%/ajax/command.json^?%CMDSTR%)
echo ###########################################################
echo ### Sending %CMDSTR% to %TGTADR%
echo ###########################################################
if "%INTMOD%"=="y" pause
%CRLEXE% %CMDSTR%
goto :END
:CRLERR
echo ###########################################################
echo ### Need at least one argument...
echo ###########################################################
:END
