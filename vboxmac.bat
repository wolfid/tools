set VMNAME=MacOS
C:
cd "\Program Files\Oracle\VirtualBox"
VBoxManage.exe setextradata "%VMNAME%" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage.exe setextradata "%VMNAME%" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage.exe setextradata "%VMNAME%" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage.exe setextradata "%VMNAME%" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage.exe setextradata "%VMNAME%" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
VBoxManage.exe setextradata "%VMNAME%" VBoxInternal2/EfiGopMode 4