@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVBRA %SETENV% %1
:DEVBRA
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
set SRCPTH=%SUBDIR%
if not "%DEVBRA%"=="%DEVTRK%" set SRCPTH="%SRCPTH:"=%/%DEVBRA%"
if not "%SDKDIR:"=%"=="" set SRCPTH=%SRCPTH%\%SDKDIR:"=%
if not "%IMGDIR:"=%"=="" set SRCPTH=%SRCPTH%\%IMGDIR:"=%
if not "%IMGTYP:"=%"=="" set SRCPTH=%SRCPTH%\%IMGTYP:"=%
set SRCPTH=%SRCPTH:"=%
set SRCPTH=%SRCPTH:/=\%
set BINPTH="%PRJDRV%:\%SRCPTH%\%SNXBIN%%SNXFEX%.%SNXEXT%"
if "%SDCDRV%"=="" (set DSTPTH="%SDCDIR:"=%") else set DSTPTH="%SDCDRV%:%SDCDIR:"=%"
:CPYCMD
echo ###########################################################
echo ### Copying %BINPTH% to %DSTPTH%
echo ###########################################################
if "%INTMOD%"=="y" pause
%CPYCMD% %CPYFLG:"=% "%BINPTH:"=%" "%DSTPTH:"=%"
if "%TMPDIR%"=="" goto :END
if not exist %TMPDIR% goto :END
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDVNAM%.%VEREXT%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDVNAM%.%VEREXT%"
for /f "tokens=*" %%i in (%CFGPTH:"=%) do set BLDVER=%%i
set BLDVER=%BLDVER:~25,-2%
echo ###########################################################
echo ### Copying %BINPTH% to %TMPDIR:"=%\%BLDVER%.bin
echo ###########################################################
if "%INTMOD%"=="y" pause
%CPYCMD% %CPYFLG:"=% "%BINPTH:"=%" "%TMPDIR:"=%\%BLDVER%.bin"
:END
