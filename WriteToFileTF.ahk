#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; https://www.autohotkey.com/boards/viewtopic.php?t=576
; https://github.com/hi5/TF
#include C:\Users\tor00\Desktop\Bash_General Utility Ahk_Python\AHK-Lib-Directory\TF\tf.ahk


; Directory Target 
; PathDir := "C:\Users\tor00\Desktop\Bash_General Utility Ahk_Python\WriteToFilePlayGroundAHKWebsite"
PathDir := "C:\Users\tor00\Desktop\Bash_General Utility Ahk_Python\Autohotkey\WEB"
index := "index.html"
styles :=  "styles\styles.css"
js := "scripts\main.js"
root = %PathDir%\%index%  ; I would recommend to stay with expression syntax (and :=) instead of using the deprecated =-assignment method:
MsgBox, %root% ; C:\Users\tor00\Desktop\Bash_General Utility Ahk_Python\Autohotkey\WEB\index.html






^+a::



Return


*$CapsLock::
Reload
Sleep, 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
; MsgBox, 4, , The script could not be reloaded. Would you like to open it for editing?
; IfMsgBox, Yes, Edit
  Return

F1::Suspend, Toggle
Return
