@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                             ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% TGTADR %SETENV% %1
echo ###########################################################
echo ### Target Address: %TGTADR%
echo ###########################################################
if "%1"=="" goto :JSNERR
if "%1"=="q" shift
if "%1"=="" goto :JSNERR
set CMDSTR="type":"%1"
shift
:CMDLOOP
if "%2"=="" goto :SENDJSONCMD
set CMDSTR=%CMDSTR%,"%1":"%2"
shift
shift
goto :CMDLOOP
:SENDJSONCMD
echo ###########################################################
echo ### Sending "{%CMDSTR%}" to %TGTADR%:%TGTPRT%
echo ###########################################################
if "%INTMOD%"=="y" pause
echo "{%CMDSTR%}" | %NCTEXE% -n -w%TGTTIM% %TGTADR% %TGTPRT%
goto :END
:JSNERR
echo ###########################################################
echo ### Need at least one argument
echo ###########################################################
:END
