set svr_name=CafeServer
sc failure "%svr_name%" reset= 0 actions= restart/10000/restart/10000/restart/10000
net start %svr_name%

set svr_name=ServerManager
sc failure "%svr_name%" reset= 0 actions= restart/10000/restart/10000/restart/10000
net start %svr_name%

schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /disable

netsh firewall add allowedprogram program="%~dp0serverupdater.exe" name=serverupdater.exe profile=all
netsh firewall add allowedprogram program="%~dp0CafeServer.exe" name=CafeServer.exe profile=all