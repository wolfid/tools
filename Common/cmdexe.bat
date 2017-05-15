@echo off
if "%2"=="q" goto :QUIET
echo ###########################################################
echo ### If %1 exists then execute it
echo ###########################################################
:QUIET
if not exist %1 (echo ### %1 not found) else call %1 %3 %4 %5 %6 %7 %8 %9
