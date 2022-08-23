#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; https://sharats.me/posts/the-magic-of-autohotkey/#window-watcher

WindowWatcherInit() {
    static initDone := false

    if (initDone)
        return
    initDone := true

    SetTimer, WindowWatcherPollForNewWindows
}

WindowWatcherTrigger(wParam, hwnd) {
    if (wParam == "Created") {
        OnWindowCreated(hwnd)
    ; } else if (wParam == "Destroyed") {
    }
}

WindowWatcherPollForNewWindows() {
    static windows := ""
    WinGet, wins, List, , , ,
    newWindows := Object()

    Loop, %wins%
    {
        this_id := wins%A_Index%
        newWindows[this_id] := 1
        if (windows && !windows[this_id])
            WindowWatcherTrigger("Created", this_id)
    }

    for wid, p in windows {
        if (!newWindows[wid])
            WindowWatcherTrigger("Destroyed", wid)
    }

    windows := newWindows
}

OnWindowCreated(hwnd) {
    global homedir

    ; Close "Illegal IP Address" alerts.
    } else if (WinExist("Application Error ahk_exe jweblauncher.exe ahk_id " . hwnd)) {
        PostMessage, 0x112, 0xF060, , ahk_id %hwnd%

    ; Close "Kyeboard History Utility" alerts.
    } else if (WinExist("Keyboard History Utility ahk_exe WerFault.exe ahk_id " . hwnd)) {
        ControlClick, Close the program, ahk_id %hwnd%

    ; When a command window opens, move it to top-right.
    } else if (WinExist("ahk_class ConsoleWindowClass ahk_id " . hwnd)) {
        WinGetPos, , , w, , ahk_id %hwnd%
        x := A_ScreenWidth - w
        WinMove, ahk_id %hwnd%, , %x%, 0

    ; Maximize windows that open unmaximized but occupy almost-entire screen.
    } else if (WinExist("ahk_id " . hwnd . " ahk_group MaximizeOnOpen")) {
        WinMaximize, ahk_id %hwnd%

    } else {
        WinGetPos, , , width, height, ahk_id %hwnd%
        if (width >= A_ScreenWidth && height > .9 * A_ScreenHeight)
            WinMaximize, ahk_id %hwnd%

    }

