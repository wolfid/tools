@echo off
echo ###########################################################
echo ###                                 ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVTRK=trunk
set DEVBRA=%DEVTRK%
set BLDTGT=192.168.56.102
set SDKVER=RECOIL_SDK
set SVNREV=00000
set BLDUSR=recoil
set BLDPWD=recoil
set SDCDRV=E
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
set IMGBIN=
set IMGPHY=
set IMGEXT=
set DEFCOD=RECOIL_
set DEFDIR=recoil
set FMWPRF=FW_
set SNXPRF=BS_
