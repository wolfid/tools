@echo off
echo ###########################################################
echo ###                               ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVTRK=trunk
set DEVBRA=WPA2
set SDKVER=SN986_1.20_85a_20170120_1237
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
set STRCFG=CONFIG_APP_STREAMING
set STRSET=y
set DEFTYP=SpiderDrone_WiFi
set ALTTYP=Streaming
set ALTCOD=01735
set DIRLST[SpiderDrone_WiFi]="SpiderDrone_WiFi"
set DIRLST[Streaming]="Streaming"
set DEFCOD=SpiderDrone_WiFi
set CODLST[SpiderDrone_WiFi]=01749
set CODLST[Streaming]=01735
set ISSMOD=ALL
set SVNDRV=Z
set SVNDIR=
set BRADIR=
set MAKDIR="buildscript"
set MAKCMD="make; if [ $? -eq 0 ]; then make install; fi"
set MAKVMD=REMOTE
set MAKVER=1
set MAKCMD="make MAKVER=!MAKVER! SVNREV=!SVNREV! PRDCOD=!PRDCOD!; if [ $? -eq 0 ]; then make install; fi"
set CLNCMD="make clean"
set CFGDIR="include\config"
set CFGEXT=conf
set IMGAPP="app"
set IMGTYP="dashcam"
set IMGSRC="src"
set IMGDIR="image"
set SNXBIN=FIRMWARE_660R
set SNXFEX=_F
set SNXPHY=PHY-SF
set SNXEXT=bin
set ISSLST="%SNXBIN%.%SNXEXT% %SNXBIN%%SNXFEX%.%SNXEXT% %SNXPHY%.%SNXEXT%"
set FMWPRF=FW_
set SNXPRF=SX_
set SNXSUF=_PD_
set FLBPRF=FB_
set FLBSUF=_PD_
set FLBEXT=hex
set UPGMOD=0
set UPGIMG=%ISSDRV%:\%ISSDIR:"=%\%DEFTYP%\%FMWPRF%%SNXPRF%%DEFCOD%%SNXSUF%%DEFREV%_%DEFDAT%\%SNXBIN%.%SNXEXT%
set UPGIMG=
set UPGLTT=USE_LATEST
set SNXREV=%UPGLTT%
rem set SNXREV=SpiderDrone_WiFi
set SNXREV[SpiderDrone_WiFi]=14865
set SNXDAT[SpiderDrone_WiFi]=26jul2017
set SNXREV[Streaming]=605
set SNXDAT[Streaming]=07juj2017
set FLBREV=Streaming
set FLBREV[SpiderDrone_WiFi]=595
set FLBDAT[SpiderDrone_WiFi]=01jun2017
set FLBREV[Streaming]=551
set FLBDAT[Streaming]=18may2017
set CPYFLG="/Y"
set BDVNAM=bld_version
set SDVNAM=sdk_version
set VEREXT=c
set SVNUNV=Unversioned
set SVNDEF=00000
