@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set SETPRD="%~dp0..\%DEVCOM%\setprd%~x0"
echo ###########################################################
echo ###                                ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVBRA %SETENV% %1
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%BDVNAM%.%VEREXT%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%BDVNAM%.%VEREXT%"
for /f "tokens=*" %%i in (%CFGPTH:"=%) do set ISSPTH=%%i
set PRDDIR=%DEFDIR%
if "%STRCFG%"=="" goto :PRDDIR
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.%CFGEXT%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.%CFGEXT%"
call %ENVCHK% JUSTDOIT %SETPRD% %1 %CFGPTH% %STRCFG% %STRSET% %ALTCOD% %ALTDIR%
:PRDDIR
echo ###########################################################
echo ### Product Directory: %PRDDIR:"=%
echo ###########################################################
set ISSPTH="%ISSDRV%:\%ISSDIR:"=%\%PRDDIR:"=%\%ISSPTH:~25,-8%"
if "%DEVBRA%"=="%DEVTRK%" (set BINPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%"
) else set BINPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%"
call :DOCOPY "%ISSPTH:"=%" %BINPTH% %IMGLST:"=%
goto :END
:DOCOPY
echo ###########################################################
if "%3"=="" goto :DOCOPY_ERR
echo ### Copying(Zipping) files to %~1(.zip):
if "%INTMOD%"=="y" pause
if not exist %1 md %1
set CPYDST=%1
set CPYSRC=%2
set CPYCNT=0
shift
:DOCOPY_CHK
shift
if "%1"=="" goto :DOCOPY_EXIT
set /a CPYCNT+=1
echo ### %CPYCNT%: %CPYSRC:"=%\%1
if "%INTMOD%"=="y" pause
%CPYCMD% %CPYFLG:"=% "%CPYSRC:"=%\%1" %CPYDST%
%ZIPEXE% a %CPYDST%.zip "%CPYSRC:"=%\%1"
goto :DOCOPY_CHK
:DOCOPY_ERR
echo ### Not Enough Copy Parameters
:DOCOPY_EXIT
echo ###########################################################
exit /b 0
:END
