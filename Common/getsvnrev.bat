@echo off
echo ###########################################################
echo ### Get SVN Revison from: %cd%
echo ###########################################################
for /f %%i in ('%SVNEXE%') do set SVNREV=%%i
if "%SVNREV:~5,1%"==":" (set SVNREV=%SVNREV:~6,-1%
) else if "%SVNREV:~5,1%"=="M" set SVNREV=%SVNREV:~0,5%
