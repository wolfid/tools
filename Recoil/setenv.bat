@echo off
echo ###########################################################
echo ###                                 ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVTRK=trunk
set DEVBRA=%DEVTRK%
set BLDTGT=192.168.56.102
set SDKVER=RECOIL_SDK
set SCSREV=00000
set BLDUSR=recoil
set BLDPWD=recoil
set DSTPTH=E:\
set SDCDIR="\"
set PRJDRV=Y
set PRJDIR="Projects"
set SUBDIR="openwrt"
set SDKDIR=
set SVNDRV=C
set SVNDIR="\Source"
set MAKDIR=
set MAKCMD="make -j1 V=s"
set CLNCMD="make clean"
set CFGDIR="include\config"
set BRADIR="branch"
set IMGDIR=
set SNXBIN=
set SNXPHY=
set SNXEXT=
set PRDCOD=RECOIL_
set PRDDIR="recoil"
set BLDTYP=FW
set BRDCOD=BS
