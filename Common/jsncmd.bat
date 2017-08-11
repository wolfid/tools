@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
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
if "%1"=="" goto :JSNERR
if "%1"=="q" (shift
) else if "%1"=="n" (shift
) else if "%1"=="qn" (shift
) else if "%1"=="nn" (shift
) else if "%1"=="ny" (shift
) else if "%1"=="qy" shift
if "%1"=="" goto :JSNERR
if "%TGTTIM%"=="" goto :TGTERR
if "%TGTADR%"=="" goto :TGTERR
if "%TGTPRT%"=="" goto :TGTERR
set CMDSTR="type":"%1"
shift
:CMDLOOP
if "%2"=="" goto :JSNCMD
set CMDSTR=%CMDSTR%,"%1":"%2"
shift
shift
goto :CMDLOOP
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
:JSNERR
echo ###########################################################
echo ### Need at least one argument...
echo ###########################################################
goto :END
:TGTERR
echo ###########################################################
echo ### Netcat parameter (TGTTIM/TGTADR/TGTPRT) not set...
echo ###########################################################
:END
