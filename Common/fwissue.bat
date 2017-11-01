@echo off
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set SETPRD="%~dp0..\%DEVCOM%\setprd%~x0"
set VERDET="%~dp0..\%DEVCOM%\verdet%~x0"
set DOCOPY="%~dp0..\%DEVCOM%\docopy%~x0"
echo ###########################################################
echo ###                                ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVBRA %SETENV% %1
:DEVBRA
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
if "%ISSLST:"=%"=="" goto :EMPTY
if "%BDVNAM%"=="" goto :VERDET
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%BDVNAM%.%VEREXT%"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%\%BDVNAM%.%VEREXT%"
for /f "tokens=*" %%i in (%CFGPTH:"=%) do set BLDVER=%%i
:BLDVER
echo ###########################################################
echo ### Build Version: %BLDVER%
echo ###########################################################
set BLDVER=%BLDVER:~25,-8%
if "%BLDVER:~11,4%"=="%FMWSPD%" goto :VERERR
:goto :PRDCOD
:VERDET
call %ENVCHK% JSTDIT %VERDET% %1
if "%BLDVER:~11,4%"=="%FMWSPD%" goto :VERERR
:PRDCOD
set PRDCOD=%BLDVER:~6,5%"
set PRDDEX=0
setlocal enabledelayedexpansion
:PRDLPP
set /a PRDDEX+=1
set PRDTYP=!PRDTYP[%PRDDEX%]!
:PRDCHK
if not "%PRDCOD%"=="!PRDCOD[%PRDTYP%]!" goto :PRDLPP
set PRDDIR=!PRDDIR[%PRDTYP%]!
endlocal & set PRDDIR=%PRDDIR%
echo ###########################################################
echo ### Product Directory: %PRDDIR:"=%
echo ###########################################################
set ISSPTH="%ISSDRV%:\%SVNDIR:"=%\%ISSDIR:"=%\%PRDDIR:"=%\%BLDVER%"
if "%DEVBRA%"=="%DEVTRK%" (set BINPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%"
) else set BINPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGDIR:"=%\%IMGTYP:"=%"
if "%RMEFIL%"=="" goto :NOREADME
echo ###########################################################
echo ### Generate "%RMEFIL%"
echo ###########################################################
if not "%SVNBRA%"=="" (set SVNPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%SVNBRA:"=%%DEVBRA%"
) else set SVNPTH="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%DEVBRA%"
call %ENVCHK% JSTDIT %GETREV% %1 %SVNPTH% %BINPTH%\%RMEFIL%
:SVNREV
echo ###########################################################
echo ### SVN Revision: %SVNREV%
echo ###########################################################
if "%SVNREV%"=="%SVNUNV%" goto :VERERR
call %ENVCHK% JSTDIT %DOCOPY% "%ISSPTH:"=%" %BINPTH% %ISSLST:"=% %RMEFIL%
goto :END
:NOREADME
call %ENVCHK% JSTDIT %DOCOPY% "%ISSPTH:"=%" %BINPTH% %ISSLST:"=%
goto :END
:DOCOPY
echo ###########################################################
if "%3"=="" goto :DOCOPY_ERR
echo ### Copying(Zipping) files to %~1(.zip):
exit /b 0
if "%INTMOD%"=="y" pause
if not exist %1 md %1
set CPYDST=%1
set CPYSRC=%2
set CPYCNT=0
shift
:DOCOPY_CHK
shift
if "%1"=="" goto :DOCOPY_END
set /a CPYCNT+=1
echo ### %CPYCNT%: %CPYSRC:"=%\%1
if "%INTMOD%"=="y" pause
%CPYCMD% %CPYFLG:"=% "%CPYSRC:"=%\%1" %CPYDST%
%ZIPEXE% a %CPYDST%.zip "%CPYSRC:"=%\%1"
goto :DOCOPY_CHK
:DOCOPY_ERR
echo ### Not Enough Copy Parameters
if "%INTMOD%"=="y" pause
:DOCOPY_END
echo ###########################################################
exit /b 0
:EMPTY
echo ###########################################################
echo ### Empty Issue File List: ISSLST
echo ###########################################################
goto :END
:VERERR
echo ###########################################################
echo ### Build: %BLDVER% not for Issue
echo ###########################################################
goto :END
:END
