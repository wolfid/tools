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
if "%JSNMOD%"=="y" goto :JSNMOD
set CMDSTR=command1^=%1(
shift
if "%1"=="" goto :CRLCMD
set CMDSTR=%CMDSTR%%1
shift
:CRLLPP
if "%1"=="" goto :CRLCMD
set CMDSTR=%CMDSTR%,%1
shift
goto :CRLLPP
:CRLCMD
set CMDSTR=http://%TGTADR%/ajax/command.json^?%CMDSTR%)
echo ###########################################################
echo ### Sending %CMDSTR%
echo ###########################################################
if "%INTMOD%"=="y" pause
%CRLEXE% %CMDSTR%
goto :END
:JSNMOD
if "%TGTTIM%"=="" goto :TGTERR
if "%TGTADR%"=="" goto :TGTERR
if "%TGTPRT%"=="" goto :TGTERR
set CMDSTR="type":"%1"
shift
:JSNLPP
if "%2"=="" goto :JSNCMD
set CMDSTR=%CMDSTR%,"%1":"%2"
shift
shift
goto :JSNLPP
:JSNCMD
echo ###########################################################
echo ### Sending "{%CMDSTR%}" to %TGTADR%:%TGTPRT%
echo ###########################################################
if "%INTMOD%"=="y" pause
echo "{%CMDSTR%}" | %NCTEXE% -n -w%TGTTIM% %TGTADR% %TGTPRT% > %RETOUT%
for /f "tokens=5" %%i in ('type %RETOUT%') do set RETVAL=%%i
if "%RETVAL%"=="" goto :RETERR
set /a RETVAL-=65536
set /a RETTYP=%RETVAL% / 256
set /a RETTYP*=256
set /a RETVAL-=%RETTYP%
set /a RETTYP/=256
echo ###########################################################
echo ### Function Index: %RETTYP%; Return Status: %RETVAL%
echo ###########################################################
goto :END
:RETERR
echo ###########################################################
echo ### Invalid response - make sure you are connected...
echo ###########################################################
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
