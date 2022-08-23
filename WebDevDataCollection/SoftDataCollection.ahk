#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%



*$CapsLock::
Reload
Sleep, 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
; MsgBox, 4, , The script could not be reloaded. Would you like to open it for editing?
; IfMsgBox, Yes, Edit
Return

F1::Suspend, Toggle






































;  dumb unrelated bullshit



; z:: GetKeyState("q")

;   scaleFactor := .568 ;your calibration factor to convert pixels to units

; +q:: ;hold down middle mouse button to start measuring
; 	mouseGetPos,sx,sy ;start position to measure from
; 	setTimer updatePos,50


; if !GetKeyState("q")
; 	setTimer updatePos,off	
; 	tooltip distance measured is : %distCalibrated% units
; 	clipboard := distCalibrated
; return

; updatePos:
; 	mouseGetPos,x,y
; 	dx := x-sx
; 	dy := sy-y
; 	dist := round(  ((dx)**2 + (dy)**2) **.5  ,3)
; 	distCalibrated := round(dist * scaleFactor,3)
; 	tooltip [%dx%:%dy%]`n%dist% px`n%distCalibrated% units
; return