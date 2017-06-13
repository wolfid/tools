@echo off
set JSNCMD="%~dp0..\%DEVCOM%\sendjsoncmd%~x0"
set GETDAT="%~dp0..\%DEVCOM%\getdate%~x0"
echo ###########################################################
echo ###                              ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %GETDAT%
echo ###########################################################
echo ### Time: year %yyyy% month %mm% day %dd% hour %hour% min %min% sec %sec% timezone %timezone%
echo ###########################################################
if "%INTMOD%"=="y" pause
call %JSNCMD% q synctime year %yyyy% month %mm% day %dd% hour %hour% min %min% sec %sec% timezone %timezone%
