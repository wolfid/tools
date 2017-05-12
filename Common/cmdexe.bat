@echo off
echo ###########################################################
echo ### If %1 exists then execute it
echo ###########################################################
if not exist %1 (echo ### %1 not found) else call %1 %2 %3 %4 %5 %6 %7 %8 %9
