@echo off
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
if "%1"=="qn" (set DSPMOD=q
set INTMOD=n
) else if "%1"=="qy" (set DSPMOD=q
set INTMOD=y
) else if "%1"=="nn" (set DSPMOD=n
set INTMOD=n
) else if "%1"=="ny" (set DSPMOD=n
set INTMOD=y
) else if "%1"=="q" (set DSPMOD=q
) else if "%1"=="n" set DSPMOD=n
