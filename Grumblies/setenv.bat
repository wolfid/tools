@echo off
echo ###########################################################
echo ###                              ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVDIR=Grumbleez
set DEVBRA=state_machine
set ISSLST="q%DEVPRJ%_otp.hdb q%DEVPRJ%_dbg.hdb q%DEVPRJ%_dbg2.hdb q%DEVPRJ%_mtp.hdb"
set ISSPTH="C:\Users\%USERNAME%\Google Drive\FW Docs\2018 Projects\%DEVDIR%\Deliverables\Firmware"
set BINPTH="C:\Source\Grumblies\branches\%DEVBRA%\GPCD\q%DEVPRJ%\Release"
set SVNPTH=https://46.31.169.162:8443/svn/SkyRocketToys/%DEVPRJ%/tags/Debug
