#Requires AutoHotkey v2.0
#SingleInstance

InstallKeybdHook

^SC02B::
{
    ClipSaved := ClipboardAll()
    A_Clipboard := ""
    ClipWait(0.5, 1)
    Send "^c"
    ClipWait(0.5, 1)
    Send "{Ctrl up}"

    A_Clipboard := "``" . A_Clipboard . "``"
    ClipWait(0.5, 1)

    SendText A_ClipBoard
    A_Clipboard := ClipSaved
    ClipWait(0.5, 1)
    state := GetKeyState("Ctrl")
}

#Numpad1::
{
    Send "#1"
}

#Numpad2::
{
    Send "#2"
}

#Numpad3::
{
    Send "#3"
}

#Numpad4::
{
    Send "#4"
}

#Numpad5::
{
    Send "#5"
}

#Numpad6::
{
    Send "#6"
}
