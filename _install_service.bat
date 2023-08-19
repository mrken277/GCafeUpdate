set svr_name=CafeServer
set exe_name=CafeServer.exe

taskkill /f /im %exe_name%
net stop %svr_name%
sc delete %svr_name%
netsh firewall add allowedprogram program="%~dp0%exe_name%" name=%svr_name% profile=all
sc create %svr_name% start= auto binpath= "%~dp0%exe_name%" displayname= "%svr_name%"
sc failure "%svr_name%" reset= 0 actions= restart/10000/restart/10000/restart/10000
net start %svr_name%

netsh firewall add allowedprogram program="%~dp0serverupdater.exe" name=serverupdater.exe profile=all
