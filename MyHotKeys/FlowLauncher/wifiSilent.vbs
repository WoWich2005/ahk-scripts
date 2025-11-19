Set WshShell = CreateObject("WScript.Shell")
SSID = WScript.Arguments(0)
WshShell.Run "C:\Portable\AutoHotKeys\FlowLauncher\wifi.bat " & Chr(34) & SSID & Chr(34), 0
Set WshShell = Nothing