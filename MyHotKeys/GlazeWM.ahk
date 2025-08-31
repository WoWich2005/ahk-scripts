#Requires AutoHotkey v2.0.0
#SingleInstance Force

#HotIf !WinActive("ahk_class ConsoleWindowClass")

#Left::  RunGlazeWM("focus --direction left")
#Right:: RunGlazeWM("focus --direction right")
#Up::    RunGlazeWM("focus --direction up")
#Down::  RunGlazeWM("focus --direction down")

#+Left::  RunGlazeWM("move --direction left")
#+Right:: RunGlazeWM("move --direction right")
#+Up::    RunGlazeWM("move --direction up")
#+Down::  RunGlazeWM("move --direction down")

#u:: RunGlazeWM("resize --width -2%")
#p:: RunGlazeWM("resize --width +2%")
#o:: RunGlazeWM("resize --height +2%")
#i:: RunGlazeWM("resize --height -2%")

#t:: RunGlazeWM("toggle-floating --centered")
#f:: RunGlazeWM("toggle-fullscreen")
#m:: RunGlazeWM("toggle-minimized")

#+p:: RunGlazeWM("wm-toggle-pause")
#v::  RunGlazeWM("toggle-tiling-direction")
#+e:: RunGlazeWM("wm-exit")
#+r:: RunGlazeWM("wm-reload-config")
#+w:: RunGlazeWM("wm-redraw")

#1:: RunGlazeWM("focus --workspace 1")
#+1::{
    RunGlazeWM("move --workspace 1")
    RunGlazeWM("focus --workspace 1")
}

#2:: RunGlazeWM("focus --workspace 2")
#+2::{
    RunGlazeWM("move --workspace 2")
    RunGlazeWM("focus --workspace 2")
}

#3:: RunGlazeWM("focus --workspace 3")
#+3::{
    RunGlazeWM("move --workspace 3")
    RunGlazeWM("focus --workspace 3")
}

#4:: RunGlazeWM("focus --workspace 4")
#+4::{
    RunGlazeWM("move --workspace 4")
    RunGlazeWM("focus --workspace 4")
}

#5:: RunGlazeWM("focus --workspace 5")
#+5::{
    RunGlazeWM("move --workspace 5")
    RunGlazeWM("focus --workspace 5")
}

#6:: RunGlazeWM("focus --workspace 6")
#+6::{
    RunGlazeWM("move --workspace 6")
    RunGlazeWM("focus --workspace 6")
}

#7:: RunGlazeWM("focus --workspace 7")
#+7::{
    RunGlazeWM("move --workspace 7")
    RunGlazeWM("focus --workspace 7")
}

#8:: RunGlazeWM("focus --workspace 8")
#+8::{
    RunGlazeWM("move --workspace 8")
    RunGlazeWM("focus --workspace 8")
}

#9:: RunGlazeWM("focus --workspace 9")
#+9::{
    RunGlazeWM("move --workspace 9")
    RunGlazeWM("focus --workspace 9")
}

#HotIf

RunGlazeWM(command) {
    static glazewm_path := "glazewm.exe"  ; Укажите полный путь, если нужно
    Run('"' glazewm_path '" command ' command,, "Hide")
}