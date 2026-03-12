#Requires AutoHotkey v2.0.0
#SingleInstance Force

; Terminal
    #Q::
    {
        Run "C:/Portable/AutoHotKeys/MyHotKeys/scripts/RunWslSilent.vbs"
    }

    #+Q::
    {
        Run "wt"
    }

; File managers
    #E::
    {
        Run "C:/Portable/AutoHotKeys/MyHotKeys/scripts/RunYaziSilent.vbs"
    }

    #+E::
    {
        Run "explorer.exe"
    }

; Minimize window
    #C::
    {
        Send "#{Down}"
    }

; Close window
    #+C::
    {
        Send "!{F4}"
    }
    
; Search and Run
    #R::
    {
        Send "!{Space}"
    }

; Lock
    ; LWin + L


; Music
    #S::{
        Send "{Media_Play_Pause}"
    }

    #A::{
        Send "{Media_Prev}"
    }

    #D::{
        Send "{Media_Next}"
    }
    
; Bluetooth Headphones Toogle
    #H::
    {
        Run "C:/Portable/AutoHotKeys/MyHotKeys/scripts/toggleBlHeadphonesSilent.vbs"
    }

; Audio
    #F1::{
        Send "{Volume_Mute}"
    }

    #F2::{
        Send "{Volume_Down}"
    }

    #F3::{
        Send "{Volume_Up}"
    }

; Monitor backlight
    SetBrightness(value) {
        Obj := ComObject("WbemScripting.SWbemLocator")
        Service := Obj.ConnectServer(".", "root\WMI")
        Methods := Service.ExecQuery("SELECT * FROM WmiMonitorBrightnessMethods")

        for Method in Methods {
            Method.WmiSetBrightness(1, value)  ; Первый параметр — время выполнения, второй — значение яркости
        }
    }

    ChangeBrightness(delta) {
        brightness := GetBrightness() + delta
        brightness := Clamp(brightness, 0, 100) ; Ограничение значения от 0 до 100
        SetBrightness(brightness)
    }

    GetBrightness() {
        Obj := ComObject("WbemScripting.SWbemLocator")
        Service := Obj.ConnectServer(".", "root\WMI")
        Brightness := Service.ExecQuery("SELECT * FROM WmiMonitorBrightness")

        for b in Brightness
            return b.CurrentBrightness
    }

    Clamp(value, min, max) {
        return value < min ? min : value > max ? max : value
    }

    #F4::{
        ChangeBrightness(-10)
    }

    #F5::{
        ChangeBrightness(10)
    }

; Touchpad toggle

    touchpadEnabled := true

    ^!M::
    {
        global touchpadEnabled
        touchpadEnabled := !touchpadEnabled

        if (touchpadEnabled)
            Run "SystemSettingsAdminFlows.exe EnableTouchPad 0"
        else
            Run "SystemSettingsAdminFlows.exe EnableTouchPad 1"
    }

; Replace ₽ with ctrl + alt + 8 for zen workspace
    $^!8::{
        Send "^!{Numpad8}"
        Return
    }