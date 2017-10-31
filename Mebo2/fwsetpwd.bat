@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% TGTADR %SETENV%
:RUNDLL
echo ###########################################################
echo ### Clearing Internet Form Data
echo ###########################################################
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
set CMDSTR="http://%TGTADR%/ajax/command.json^?command1=set_ssid(0,%MBOPWD:"=%,0,%MBOCHN:"=%)"
echo ###########################################################
echo ### Sending %CMDSTR%
echo ###########################################################
%CRLEXE% %CMDSTR:"=%
set CMDSTR="http://%TGTADR%/ajax/command.json^?command1=reboot_companion()"
echo ###########################################################
echo ### Sending %CMDSTR%
echo ###########################################################
%CRLEXE% %CMDSTR:"=%
:END
