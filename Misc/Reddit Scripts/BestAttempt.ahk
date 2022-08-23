8::

MouseGetPos, xpos, ypos
; Begin Four Step Sequence

; Step 1
Sleep, 5
Send, {w}
MouseClick, right, xpos, ypos
Sleep, 80

; Step 2
Send {f}
Sleep, 80

; Step 3
SendInput, {LShift Down} 
Sleep, 50
Send, {d}
SendInput, {LShift Up}

; Step 4
Send, {s}
MouseClick, right, xpos, ypos

; End Four Step Sequence
; Begin 3 Step Sequence Loop 

loop, 3 {
; Step 1
Sleep, 5
Send, {w}
MouseClick, right, xpos, ypos
Sleep, 80

; Step 2
Send {f}
Sleep, 80

; Step 3
SendInput, {LShift Down} 
Sleep, 50
Send, {d}
SendInput, {LShift Up}
}

; End Four Step Sequence
; Begin Four Step Sequence

; Step 1
Sleep, 5
Send, {w}
MouseClick, right, xpos, ypos
Sleep, 80

; Step 2
Send {f}
Sleep, 80

; Step 3
SendInput, {LShift Down} 
Sleep, 50
Send, {d}
SendInput, {LShift Up}

; Step 4
Send, {s}
MouseClick, right, xpos, ypos

Return