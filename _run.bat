title %~dp0
:loophere

CafeServer.exe

date /t
time /t
echo wscript.sleep 5000 > %temp%\delay5s.vbs
cscript //nologo %temp%\delay5s.vbs
del /f /q %temp%\delay5s.vbs

goto :loophere