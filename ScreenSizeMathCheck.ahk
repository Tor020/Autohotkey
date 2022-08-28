#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%





; https://www.autohotkey.com/docs/commands/SysGet.htm#Monitor Get the monitor pixel size 
SysGet, Mon2, Monitor, 2
SysGet, Mon1, Monitor, 1
; MsgBox, Left: %Mon2Left% -- Top: %Mon2Top% -- Right: %Mon2Right% -- Bottom %Mon2Bottom%.
; MsgBox, Left: %Mon1Left% -- Top: %Mon1Top% -- Right: %Mon1Right% -- Bottom %Mon1Bottom%.
; MsgBox, %Mon2Left%/2, %Mon2Top%/2, %Mon2Left%/2, %Mon2Top%/2, 0

; #Include ./DebuggingToolTip.ahk  
#Include ./DebuggingToolTipExperimental.ahk  
; toolTipfn(111)

HalfX := (%Mon2Left%/2)

ToolTip, HalfX `n %HalfX%

MsgBox, &HalfX
MsgBox, %HalfX%



; https://www.autohotkey.com/boards/viewtopic.php?t=72159 forum post sanity check

*$CapsLock::
Reload
Sleep, 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
; MsgBox, 4, , The script could not be reloaded. Would you like to open it for editing?
; IfMsgBox, Yes, Edit
  Return

F1::Suspend, Toggle
Return

