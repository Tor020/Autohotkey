#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; 
; https://sharats.me/posts/the-magic-of-autohotkey-2/#copy-contents-of-selected-files
^+x::
    CopySelectedFileContents() {
        files := Explorer_GetSelected()
        content := ""
        for i, file in files {
            FileRead, text, %file%
            if i > 1
                content := content . "`n`n"
            content := content . text
        }
        Clipboard := content
    }


; https://sharats.me/posts/the-magic-of-autohotkey-2/#create-file-with-clipboard-contents
^+v::
    CreateFileWithClipboardContents() {
        loc := Explorer_GetPath()
        WinGetPos, wx, wy
        ControlGetPos, cx, cy, cw, , DirectUIHWND3
        x := wx + cx + cw/2 - 200
        y := wy + cy
        InputBox, filename, Clipboard File
            , Enter file name to paste clipboard contents in:, , 400, 120, %x%, %y%, ,
            , clip.txt
        if ErrorLevel
            Return
        filepath := loc . "\" . filename
        if (FileExist(filepath)) {
            MsgBox, 1, Overwrite, Overwriting existing '%filename%'!
            IfMsgBox Cancel
                Return
            FileDelete, %filepath%
        }
        Fileappend, %Clipboard%, %filepath%
    }


; https://sharats.me/posts/the-magic-of-autohotkey-2/#create-folder-hierarchy-and-enter-it
^n::
CreateFolderHierarchy() {
    loc := Explorer_GetPath()
    WinGetPos, wx, wy
    ControlGetPos, cx, cy, cw, , DirectUIHWND3
    x := wx + cx + cw/2 - 200
    y := wy + cy
    InputBox, folder, Create Folder, Enter folder name/path create:, , 400, 120
        , %x%, %y%
    if ErrorLevel
        Return
    folder := StrReplace(folder, "/", "\")
    pos := RegExMatch(folder, "O)\{([^\{]+)\}", match)
    folders := []
    if (pos > 0) {
        parts := StrSplit(match.value(1), ",")
        prefix := SubStr(folder, 1, match.Pos(0) - 1)
        suffix := SubStr(folder, match.Pos(0) + match.Len(0))
        for i, part in parts {
            folders.Push(prefix . part . suffix)
        }
    } else {
        folders.Push(folder)
    }
    for i, folder in folders {
        FileCreateDir, %loc%\%folder%
    }
    Explorer_GetWindow().Navigate2(loc . "\" . folders[folders.Length()])
}
