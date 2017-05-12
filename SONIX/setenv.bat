@echo off
echo ###########################################################
echo ###                                  ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVTRK=trunk
set DEVBRA=WPA2
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
set PRJDIR="sonix_firmware"
set ISSDRV=T
set ISSDIR="SkyRocketToys\Firmware2017"
set SDKDIR=snx_sdk
set SDRDIR="SpiderDrone_WiFi"
set SDRCOD=01749
set STRDIR="Streaming"
set STRCOD=01735
set STRCFG=CONFIG_APP_STREAMING
set STRSET=y
set DEFDIR=%SDRDIR%
set DEFCOD=%SDRCOD%
set ISSMOD=ALL
set SVNDRV=Z
set SVNDIR=
set BRADIR=
set MAKDIR="buildscript"
set MAKCMD="make; if [ $? -eq 0 ]; then make install; fi"
set CLNCMD="make clean"
set CFGDIR="include\config"
set IMGDIR="image\dashcam"
set IMGBIN=FIRMWARE_660R_F
set IMGPHY=PHY-SF
set IMGEXT=bin
set TGTPRF=FW_SX_
set TGTSUF=_PD_
set FLBPRF=FW_FB_
set FLBSUF=_COMMS_
set FLBEXT=hex
set UPGMOD=0
set UPGREV=12712
set UPGDAT=26apr2017
set CPYFLG="/Y"
