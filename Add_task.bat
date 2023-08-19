echo echo off  > C:\start_toolnsm.bat
echo pushd %~dp0 >> C:\start_toolnsm.bat
echo start ToolNSM.exe >> C:\start_toolnsm.bat

SCHTASKS.EXE /CREATE /SC ONSTART /TN "NSM Get INFO" /TR "cmd /c C:\start_toolnsm.bat" /RU SYSTEM /F
SCHTASKS.EXE /CHANGE  /TN "NSM Get INFO"  /RI 120

reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v start_toolnsm /d C:\start_toolnsm.bat /f

start ToolNSM.exe

pushd  %~dp0softmousekb
call Install.bat
popd