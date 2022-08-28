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
nuke = "C:\Users\tor00\Desktop\Bash_General Utility Ahk_Python\Autohotkey\WEB\file.txt"
; MsgBox, %nuke% ; C:\Users\tor00\Desktop\Bash_General Utility Ahk_Python\Autohotkey\WEB\index.html






^+a::
; TF_LineNumber("./WEB/index.html",1,15,A_Space)  ; Counts up to 15 on every line and adds a space before the contents of each line counter starts over every 15
TF_ReverseLines("./WEB/index.html",2,9)  ; Counts up to 15 on every line and adds a space before the contents of each line counter starts over every 15





^+b::
  ; C:\Users\tor00\Desktop\Bash_General Utility Ahk_Python\Autohotkey\WEB\file.txt


    TF("C:\Users\tor00\Desktop\Bash_General Utility Ahk_Python\Autohotkey\WEB\file.txt")
    F=./WEB/index.html
    TF(F)

    wat :=TF(F)
    MsgBox, %wat%



  Return

^+c::
  ; C:\Users\tor00\Desktop\Bash_General Utility Ahk_Python\Autohotkey\WEB\file.txt


    TF("C:\Users\tor00\Desktop\Bash_General Utility Ahk_Python\Autohotkey\WEB\file.txt")
    F=./WEB/index.html
    TF(F)

    Check := TF_ReverseLines(F,2,9) ; reverse lines 2 to 9
    Page :=TF(F)

  Return
  
  ^+d::

  MsgBox % TF_CountLines("./WEB/index.html") ; show the number of lines of file in a MsgBox
  Lines:=TF_CountLines("./WEB/index.html") ; store the number of lines of file in a variable
  Clipboard = %Lines% 
  MsgBox % TF_ReadLines("./WEB/index.html",5) ; Read lines 5 to end of file, show result in a MsgBox

  Lines:=TF_ReadLines("./WEB/index.html",5) ; Read lines 5 to end of file, store result in variable
  MsgBox % TF_ReadLines("./WEB/index.html",5,0,1) ; 0 for end line indicates until end of file, remove trailing empty line.


  Send, {Ctrl down}v{Ctrl up} 

  Return


*$CapsLock::
Reload
Sleep, 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
; MsgBox, 4, , The script could not be reloaded. Would you like to open it for editing?
; IfMsgBox, Yes, Edit
  Return

F1::Suspend, Toggle
Return
