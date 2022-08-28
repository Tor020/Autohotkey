
  #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
  ; #Warn  ; Enable warnings to assist with detecting common errors.
  SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; https://www.youtube.com/watch?v=pgj3qjwYpKw&t=153s How to easily add a GUI to your script | AutoHotkey GUIs are easy
; https://www.the-automator.com/?s=intro+to+guis code built/modified from this website and YT video






Gui, New 

; Attempting to make variables to store screen size calculations to appropriately size GUI
xPos := 2560-555
; Width := 


; Gui Creation, Labels Controls setup
gui, font, s13

; Size Variables
Gui, Show, X%xPos% Y300 W300 H400, Test Window
; Manual Variable Sanity Check
Gui, Add, Checkbox, checked1 vpls, wat.com
; v must be infront of gui variable ; "Gui, Add, Checkbox, checked1 pls, wat.com" ;doesn't work

; if pls 


; Tutorial Variables
Gui, Add, GroupBox, x0 w460 h150, Search ;add a groupbox 
gui, Add, Checkbox, x20 y30 checked1 vahk, AutoHotkey.com ;first checkbox and move down / over a bit
gui, Add, Checkbox, checked0 vstack, StackOverflow.com
gui, Add, Checkbox, checked1 vTheAutomator,the-Automator.com
gui, Add, Checkbox, checked1 vYouTube,YouTube
gui, Add, Checkbox, checked0 vstackAHK, StackOverflow.com/AutoHotkey
gui, Add, Checkbox, checked0 vMicro,Microsoft.com
gui, Add, Checkbox, checked0 vTech,TechOntheNet.com
gui, Add, Text, x10 y+20, Search for:
gui, Add, Edit ,x+10 yp-5 w360  vSearchTerm 
; gui, Add, Button, w75 gSearch Default, &Search        ; not yet implemented
; gui, Add, Button, w75 x+25 gCancel Cancel, &Cancel    ; not yet implemented
gui, font, S10 cblue ;Font size to 10 and color to blue 
gui, Add, Checkbox, x300 yp+8  vquotes,Wrap Search in Double quotes ;Add check box to wrap in double quotes
gui, Show 
GuiControl,Focus,SearchTerm


; Search:
; Gui Submit 


; Button:
; Gui Btn

#Include ./DebuggingToolTip.ahk  
return

; Bullshit pseudo code
; Gui, Add, Picture, X1 Y1 W250 H300, C:\MyFilePath\MyPicture.jpg
; Gui, Add, Text, X1 Y1 W250 H300, C:\MyFilePath\MyPicture.jpg
; Return
; Gui, New 
; Gui, Show, X200 Y200 W200 H200, Test Window
; return


*$CapsLock::
Reload
Sleep, 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
; MsgBox, 4, , The script could not be reloaded. Would you like to open it for editing?
; IfMsgBox, Yes, Edit
  Return

F1::Suspend, Toggle
Return