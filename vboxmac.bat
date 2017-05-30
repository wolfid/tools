set VMNAME="MacOS"
set VBMEXE="C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
set VBMCMD=setextradata
%VBMEXE% %VBMCMD% %VMNAME% "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
%VBMEXE% %VBMCMD% %VMNAME% "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
%VBMEXE% %VBMCMD% %VMNAME% "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
%VBMEXE% %VBMCMD% %VMNAME% "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
%VBMEXE% %VBMCMD% %VMNAME% "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
%VBMEXE% %VBMCMD% %VMNAME% VBoxInternal2/EfiGopMode 4