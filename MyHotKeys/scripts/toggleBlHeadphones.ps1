$mac = "a4:77:58:49:9a:34"
$exePath = "C:/Portable/AutoHotKeys/MyHotKeys/scripts/bluetuith-shim.exe"

$isConnected = & $exePath device properties -a $mac

if ($isConnected -match "Connected:\s*no") {
    & $exePath device connect -a $mac
} else {
    & $exePath device disconnect -a $mac
}
