#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; list=a,b,c,{enter},string{click} ; the list of keys and combos. comma separated.
; stringsplit, list, list,`,
; Counter = 0

; $F8::                                ; press F8 to cycle through
;   Counter := (Counter=list0) ? (1) : (Counter+1)
;   send % list%counter%
; return


; Hold Click to Rapid-Click:
~$LButton::
    While GetKeyState("LButton", "P"){
        Click
        Sleep 50  ;  milliseconds
    }
return

;toggle suspend
F1::Suspend  ; Assign the toggle-suspend function to a hotkey.


; kill
Esc::ExitApp ; esc kills current script

; reload
*$CapsLock::
Reload
Sleep, 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
; MsgBox, 4, , The script could not be reloaded. Would you like to open it for editing?
; IfMsgBox, Yes, Edit
Return

