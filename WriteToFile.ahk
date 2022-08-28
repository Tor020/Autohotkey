#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#include C:\Users\tor00\Desktop\Bash_General Utility Ahk_Python\AHK-Lib-Directory\TF\tf.ahk


; Directory Target 
PathDir := "C:\Users\tor00\Desktop\Bash_General Utility Ahk_Python\WriteToFilePlayGroundAHKWebsite"
root := "index.html"
styles :=  "styles\styles.css"
js := "scripts\main.js"

HomeDir := %PathDir%.%root%


MsgBox, %PathDir%\%root%




*$CapsLock::
Reload
Sleep, 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
; MsgBox, 4, , The script could not be reloaded. Would you like to open it for editing?
; IfMsgBox, Yes, Edit
  Return

F1::Suspend, Toggle
Return
