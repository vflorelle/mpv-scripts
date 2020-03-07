#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; DllCall("AllocConsole")
InputBox, sid, Select subtitle, sid, , 215, 125, , , , , no
if (ErrorLevel)
{
    sid := "error"
}
stdout := FileOpen("*", "w") ; for stdout (https://www.autohotkey.com/docs/commands/FileOpen.htm)
stdout.Write(Trim(sid))
stdout.Read(0)
; Sleep 5000
