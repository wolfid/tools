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
set PRDDIR="Mebo2"
set PRDCOD=MEBO2
set ISSMOD=ALL
set SVNDRV=Z
set SVNDIR=
set BRADIR=
set MAKDIR="buildscript"
set MAKVMD=REMOTE
set MAKVER=1
set MAKCMD="make MAKVER=!MAKVER! SVNREV=!SVNREV!; if [ $? -eq 0 ]; then make install; fi"
set CLNCMD="make clean"
set CFGDIR="include\config"
set CFGEXT=conf
set IMGAPP="app"
set IMGTYP="dashcam"
set IMGSRC="src"
set IMGDIR="image"
set PRDSUF=_PD_
set FMWPRF=FW_
set UPGLTT=USE_LATEST
set UPGMOD=1
set UPGIMG=
set SNXREV=%UPGLTT%
set SNXDAT=05jun2017
set SNXTYP=sonix
set SNXBIN=FIRMWARE_660R
set SNXFEX=_F
set SNXPHY=PHY-SF
set SNXEXT=bin
set SNXPRF=SX_
set ISSLST="%SNXBIN%.%SNXEXT% %SNXBIN%%SNXFEX%.%SNXEXT% %SNXPHY%.%SNXEXT%"
set MOBTYP=MotorBoard
set MOBPRF=MB_
set MOBSUF=_PD_
set MOBBIN=mebo_dfu
set MOBEXT=abin
set MOBREV=15007
set MOBDAT=09_Aug2017
set FLBPRF=FB_
set FLBREV=595
set FLBDAT=01jun2017
set CPYFLG="/Y"
set BDVNAM=bld_version
set SDVNAM=sdk_version
set VEREXT=c
set SVNUNV=Unversioned
set SVNDEF=00000
set TMPDIR="C:\Source\Temp"
set RMEFIL=readme.txt
