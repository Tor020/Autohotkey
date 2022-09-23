#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



MouseGetPos, xpos, ypos

; MouseMoveLinear(Starting X ,Starting Y, Ending X, Ending Y, Easing Time)  
MouseMoveLinear(x1,y1,x2,y2,time) {
    xdiff := x2 - x1
    ydiff := y2 - y1
    length := Round(sqrt( ( xdiff * xdiff ) + ( ydiff * ydiff ) ))
    time := time / 15 ; because ahk sleep makes you sleep for ~15 ms no matter what

    m := ydiff / xdiff
    b := -m*x1 + y1
    i := 0
    Loop, %time% {
        xn := ((xdiff / time) * i) + x1
        yn := m*xn + b
        DllCall("SetCursorPos", int, round(xn), int, round(yn) )
        i++
        Sleep, 1
    }
    
    DllCall("SetCursorPos", int, x2, int, y2 )
}
; MouseMoveLinear(1566, 607, 1376, 807, 700)