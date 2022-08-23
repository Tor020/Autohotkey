#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


  scaleFactor := .568 ;your calibration factor to convert pixels to units

MButton:: ;hold down middle mouse button to start measuring
	mouseGetPos,sx,sy ;start position to measure from
	setTimer updatePos,50
return

MButton Up:: ;release to capture measurement
	setTimer updatePos,off	
	tooltip distance measured is : %distCalibrated% units
	clipboard := distCalibrated
return

updatePos:
	mouseGetPos,x,y
	dx := x-sx
	dy := sy-y
	dist := round(  ((dx)**2 + (dy)**2) **.5  ,3)
	distCalibrated := round(dist * scaleFactor,3)
	tooltip [%dx%:%dy%]`n%dist% px`n%distCalibrated% units
return
  