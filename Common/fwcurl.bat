set FMWBIN=Z:\sonix_firmware\Mebo2.151a\snx_sdk\image\dashcam\FIRMWARE_660R.bin
set UPLTYP=sonix
set CRLEXE="C:\Program Files (x86)\Curl\curl.exe"
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
%CRLXEX% -F "file=@%FMWBIN%" http://192.168.99.1/ajax/command.json^?command1^=file_upload()^&uploadtype=%UPLTYP%
