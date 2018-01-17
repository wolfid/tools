@echo off
set GETDAT="%~dp0..\%DEVCOM%\getdat%~x0"
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set SVNPTH="%SVNDRV%:\%SNXFMW:"=%\%DEVPRJ%\%SCSTAG:"=%\%TAGREL:"=%
echo ###########################################################
echo ### Get Latest Tag From: %TAGLST:"=% %SVNPTH:"=%
echo ###########################################################
set SVNTAG=0.0
for /f %%i in ('%TAGLST:"=% %SVNPTH:"=%') do set SVNTAG=%%i
if "%SVNTAG%"=="0.0" if not "%BLDLVL%"=="%BLDLPD%" goto :ERRTAG
echo ###########################################################
echo ### SVN Tag: %SVNTAG%
echo ###########################################################
if "%SVNTAG:~-1,1%"=="0" (if "%BLDLVL%"=="%BLDLRC%" goto :ERRREL) else if "%BLDLVL%"=="%BLDLFL%" goto :ERRFNL
if "%BDTNAM%"=="" goto :END
set SVNTAG=%SVNTAG%.%SVNREV%
if "%BLDLVL%"=="%BLDLPD%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSBRA%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDTNAM%.%VEREXT%"
) else set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTAG%\%TAGREL%\%SVNTAG%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDTNAM%.%VEREXT%"
echo ###########################################################
echo ### Build Version File: %VERPTH%
echo ###########################################################
call %GETDAT% %1
set BLDVER=%BLDTYP%_%BRDCOD%_%PRDCOD%%BLDLVL%%SVNTAG%_%dd%%mmm%%yyyy%_%hour%%min%
echo ###########################################################
echo ### Build Version: %BLDVER%
echo ###########################################################
echo const char *%BDTNAM%="%BLDVER%"; > %VERPTH%
goto :END
:ERRTAG
echo ###########################################################
echo ### Error - No Tag For Release Build
echo ###########################################################
goto :END
:ERRREL
echo ###########################################################
echo ### Error - Minor Release is 0 For Release Candidate
echo ###########################################################
goto :END
:ERRFNL
echo ###########################################################
echo ### Error - Minor Release is ~0 For Final Release
echo ###########################################################
:END
