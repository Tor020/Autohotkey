#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
; https://sharats.me/posts/the-magic-of-autohotkey/#inserting-snippets

SnippetsInit() {
    Gui, Snips: Default
    Gui, Font, s18 q5, Consolas
    Gui, Color, FF0000
    Gui, Margin, 6, 6
    Gui, +AlwaysOnTop +Owner +ToolWindow -Caption +HwndSnippetsHwnd
    Gui, Add, ListView, r8 w900, Hotkey|Text

    IniRead, configText, snippets.ini, master
    Loop, Parse, configText, `n, `r
    {
        parts := StrSplit(A_LoopField, "=", " `t")
        LV_Add("", parts[1], parts[2])
    }
}

SnippetsShow() {
    global SnippetsMap
    Gui, Snips: Show, NoActivate
    Input, key, L1 T3
    Gui, Snips: Hide
    if (ErrorLevel != "Timeout") {
        IniRead, value, snippets.ini, master, %key%, __SNIPPETS_KEY_NOT_FOUND__
        if (value != "__SNIPPETS_KEY_NOT_FOUND__")
            SendInput, %value%
        else
            MsgBox, No snippet found for %key%.
    }
}
