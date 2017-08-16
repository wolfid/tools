@echo off
set MODCHK="%~dp0modchk%~x0"
call %MODCHK% %~n1 %EXELST%
if not "%MODRET%"=="" goto :QUIET
call %MODCHK% %1 %QMDLST%
if not "%MODRET%"=="" goto :QUIET
echo ###########################################################
echo ### If %1 exists then execute it
echo ###########################################################
:QUIET
if not exist %1 (echo ### %1 not found) else call %1 %2 %3 %4 %5 %6 %7 %8 %9
