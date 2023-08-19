taskkill /f /im serverupdater.exe
taskkill /f /im CafeServer.exe
net stop CafeServer
sc delete CafeServer
pause