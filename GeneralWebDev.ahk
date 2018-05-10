#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
NumpadIns::                   ;                      key 0
    Send, ಠ

Return

NumpadEnd::                   ;                      key 1
    Send, Φ

Return

NumpadDown::                  ;                      key 2
    Send, ᛥ

Return

NumpadPgDn::                  ;                      key 3
    Send, Ѽ

Return

NumpadLeft::                  ;                      key 4
Send, {LShift Down}
Send, {Down}
Send, {Left}
Send, {LShift Up}
Return

NumpadClear::                 ;                      key 5


Return

NumpadRight::                 ;                      key 6 


Return

NumpadHome::                  ;                      key 7     console.log
   Send, {ctrl down}c{ctrl up}                              
   SendInput, console.log`({ctrl down}v{ctrl up}`)              

Return                                                      


NumpadUp::                    ;                      key 8      new method syntax
  Send,  `(`) {{} `n `n `n `n {}}, `n `n   {Up}{Up}{Up}{Up}{Up}{Up}{Left}{Left}{Left}{Left}{Left}

Return
 

NumpadPgUp::                  ;                      key 9

  
Return


+NumpadIns::                  ;              shift + key 0
  Send, `c`lass`=`'`'` i`d`=`'`'` `@`c`l`i`c`k`=`'`' 

Return

+NumpadEnd::                  ;              shift + key 1
  Send, `c`lass`=`'`'`  
    
Return

+NumpadDown::                 ;              shift + key 2
Send, i`d`=`'`'`

Return

+NumpadPgDn::                 ;              shift + key 3
  SendInput, `@`c`l`i`c`k`=`'`'{Left} 


Return

+NumpadLeft::                 ;              shift + key 4


Return

+NumpadClear::                ;              shift + key 5


Return

+NumpadRight::                ;              shift + key 6


Return

+NumpadHome::                 ;              shift + key 7 

  Send, ܫ   
Return

+NumpadUp::                   ;              shift + key 8
  Send, ៗ


Return

+NumpadPgUp::                 ;              shift + key 9  
  Send, ᛠ


Return



*$CapsLock::
Reload
Sleep, 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 4, , The script could not be reloaded. Would you like to open it for editing?
IfMsgBox, Yes, Edit
Return


;      https://mothereff.in/js-variables
;    green names

;     Φ Rune
;     ᛥ Shield carpet
;     ៗ Hook
;     Ѽ Apple
;     ܫ Cup on plate
;     ֆ Armenian dolla sign
;     ᛠ Fork


; yellow names
;     𓏣 Key thing
;     𫟯
;     𬸚 Dragony
;     𓏢 Harp
;     𓏎 Feet vase