#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
; #Include ./DebuggingToolTip.ahk  
; https://www.autohotkey.com/board/topic/92474-tooltip-timer/

;  https://www.autohotkey.com/docs/commands/ToolTip.htm Creates an always-on-top window anywhere on the screen. 
;  ToolTip [, Text, X, Y, WhichToolTip]


MouseGetPos, xpos, ypos 
ToolTip, Timed ToolTip`nThis will be displayed for 5 seconds.  The cursor is at X%xpos% Y%ypos%.
Clipboard = %xpos%, %ypos%  ;stores the xpos and ypos from MouseGetPos on the clipboard (ctrl+v)

SetTimer, RemoveToolTip, -5000
return

RemoveToolTip:
ToolTip
return




