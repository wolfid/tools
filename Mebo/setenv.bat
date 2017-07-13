@echo off
echo ###########################################################
echo ###                                   ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVTRK=trunk
set DEVBRA=Mebo2.151a
set SDKVER=SN986_1.20_151a_20170512_1950
set SDKSUF=\"_Mebo2_20170703(a-law patch)\"
set DETHTM="main_flow\Mebo2\web_server\files\version_details.html"
set BLDTGT=192.168.56.101
set BLDUSR=sonix_user
set BLDPWD=sonix
set TGTADR=192.168.99.1
set TGTPRT=8080
set TGTTIM=3
set RSPPRT=49153
set RSPTIM=120
set DEVPRT=2017
set SDCDRV=E
set SDCDIR="\"
set PRJDRV=Z
set PRJDIR="Projects"
set SUBDIR="sonix_firmware"
set ISSDRV=T
set ISSDIR="SkyRocketToys\Firmware2017"
set SDKDIR=snx_sdk
set STRSET=y
set DEFDIR="Mebo2"
set DEFCOD=MEBO2
set ISSMOD=ALL
set SVNDRV=Z
set SVNDIR=
set BRADIR=
set MAKDIR="buildscript"
set MAKVER=Makefile.version
set MAKCMD="make MAKVER=!MAKVER! SVNREV=!SVNREV! SDKSUF=!SDKSUF! PRDCOD=!PRDCOD!; if [ $? -eq 0 ]; then make install; fi"
set CLNCMD="make clean"
set CFGDIR="include\config"
set CFGEXT=conf
set IMGAPP="app"
set IMGTYP="dashcam"
set IMGSRC="src"
set IMGDIR="image"
set IMGBIN=FIRMWARE_660R
set IMGFEX=_F
set IMGPHY=PHY-SF
set IMGEXT=bin
set IMGLST="%IMGBIN%.%IMGEXT% %IMGBIN%%IMGFEX%.%IMGEXT% %IMGPHY%.%IMGEXT% "
set FMWPRF=FW_
set SNXPRF=SX_
set SNXSUF=_PD_
set FLBPRF=FB_
set FLBSUF=_PD_
set FLBEXT=hex
set UPGMOD=0
set UPGIMG=
set UPGLTT=USE_LATEST
set SNXREV=%UPGLTT%
set SNXDAT=05jun2017
set FLBREV=595
set FLBDAT=01jun2017
set CPYFLG="/Y"
set BDVNAM=bld_version
set SDVNAM=sdk_version
set VEREXT=c
set SVNUNV=Unversioned
set SVNDEF=00000