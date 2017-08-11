@echo off
if "%1"=="q" (shift
) else if "%1"=="n" (shift
) else if "%1"=="qn" (shift
) else if "%1"=="nn" (shift
) else if "%1"=="ny" (shift
) else if "%1"=="qy" shift
echo ###########################################################
echo ### Get Source Control Revison from: %1
echo ###########################################################
if not "%1"=="" set SVNPTH=%~1
if "%SVNPTH:~1,1%"==":" %SVNPTH:~0,2%
if "%SVNPTH:~1,1%"==":" set SVNPTH=%SVNPTH:~2%
if not "%SVNPTH%"=="" cd "%SVNPTH%"
for /f %%i in ('%REVEXE%') do set SVNREV=%%i
if "%SVNREV:~5,1%"==":" (set SVNREV=%SVNREV:~6%
) else if "%SVNREV:~5,1%"=="M" set SVNREV=%SVNREV:~0,5%
if "%SVNREV:~5,1%"=="M" set SVNREV=%SVNREV:~0,5%
if "%SVNREV%"=="%SVNUNV%" goto :EOF
if "%2"=="" goto :EOF
"%SVNLOG:"=% %SVNREV%" > %2
