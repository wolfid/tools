@echo off
set SETENV="%~dp0..\%DEVCOM%\setenv%~x0"
echo ###########################################################
echo ###                             ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETENV%
set CURTAG=0
for /f %%i in ('svn ls %SVNPTH%') do call :SCSTAG %%i
echo SCSTAG: %SCSTAG%
call :GETREV %SVNPTH%/%SCSTAG%
set SCSREV=%SCSREV:~1,5%
echo SCSREV: %SCSREV%
set yyyy=%DATE:~6,4%4
set mm=%DATE:~3,2%
set dd=%DATE:~0,2%
set ISSDIR=%DEVDIR%_FW_GP_PD_%SCSTAG%.%SCSREV%_%yyyy%%mm%%dd%
call :CHKCOPY %BINPTH% %ISSLST:"=%
set USRINP=y
set /p USRINP=Copy these files to "%ISSPTH:"=%\%ISSDIR%" (%USRINP%)?
if not "%USRINP%"=="y" goto :EOF
cd %ISSPTH%
if not exist %ISSDIR% mkdir %ISSDIR%
call :DOCOPY "%ISSPTH:"=%\%ISSDIR%" %BINPTH% %ISSLST:"=%
goto :EOF
:GETREV
for /f "tokens=* eol=-" %%i in ('svn log %1') do set SCSREV=%%i & exit /b
:SCSTAG
set NEWTAG=%1
set NEWTAG=%NEWTAG:~2,-1%
if %NEWTAG% LSS %CURTAG% exit /b 0
set CURTAG=%NEWTAG%
set SCSTAG=%1
set SCSTAG=%SCSTAG:~0,-1%
exit /b 0
:CHKCOPY
set CPYSRC=%1
:CHKCOPY_CHK
shift
if "%1"=="" exit /b 0
echo "%CPYSRC:"=%\%1"
goto :CHKCOPY_CHK
:DOCOPY
set CPYDST=%1
set CPYSRC=%2
shift
:DOCOPY_CHK
shift
if "%1"=="" exit /b 0
echo copy "%CPYSRC:"=%\%1" %CPYDST%
goto :DOCOPY_CHK
