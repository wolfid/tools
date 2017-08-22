@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% TGTADR %SETENV%
set FILSTR="file=@%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%\%IMGBIN%.%IMGEXT%"
set CMDSTR="http://%TGTADR%/ajax/command.json^?command1^=file_upload()^&uploadtype=sonix"
echo ###########################################################
echo ### Sending %FILSTR% to %CMDSTR:"=%
echo ###########################################################
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
%CRLEXE% -F %FILSTR% %CMDSTR:"=%
