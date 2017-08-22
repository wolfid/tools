RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
"C:\Program Files (x86)\Curl\curl.exe" -F "file=@Z:\sonix_firmware\Mebo2.151a\snx_sdk\image\dashcam\FIRMWARE_660R.bin" http://192.168.99.1/ajax/command.json^?command1^=file_upload()^&uploadtype=sonix
