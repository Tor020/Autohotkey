#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%


;
; AutoHotkey Version: 1.1
; Language:       English
; Platform:       Win9x/NT
; Author:         Jack Dunning
;
; Script Function:
; WindowMove.ahk uses a DropDownList GUI control to resize and move a window 
; to different positions on the screen.

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^#M::

WinGetTitle, WinName, A

If WinExist("Move Window") = 0
{
Gui, Font, s12, Arial
Gui, Add, DropDownList, AltSubmit w275 vPosition gPosChoice
           , Select Position on the Screen||Right Half of Screen
           |Left Half of Screen|Top Half of Screen|Bottom Half of Screen
           |Center of Screen|Top Right Corner|Bottom Right Corner
           |Top Left Corner|Bottom Left Corner|
}
Gui, Show, W300 H40 , Move WindowW
Return

PosChoice:
Gui, Submit, NoHide

    WinGetPos,TX1,TY1,TW1,TH1,ahk_class Shell_TrayWnd

    WinGetPos,X1,Y1,W1,H1,Program Manager
	X2 := W1/2
	Y2 := (H1-TH1)/2
	Y3 := H1-TH1
	X4 := W1/4
	Y4 := H1/4

If Position = 2
  {
        WinMove,%WinName%,,%X2%,0,%X2%,%Y3%
  }
If Position = 3
  {
        WinMove,%WinName%,,0,0,%X2%,%Y3%
  }
If Position = 4
  {
        WinMove,%WinName%,,0,0,%W1%,%Y2%
  }
If Position = 5
  {
        WinMove,%WinName%,,0,%Y2%,%W1%,%Y2%
  }
If Position = 6
  {
        WinMove,%WinName%,,%X4%,%Y4%,%X2%,%Y2%
  }
If Position = 7
  {
        WinMove,%WinName%,,%X2%,0,%X2%,%Y2%
  }
If Position = 8
  {
        WinMove,%WinName%,,%X2%,%Y2%,%X2%,%Y2%
  }
If Position = 9
  {
        WinMove,%WinName%,,0,0,%X2%,%Y2%
  }
If Position = 10
  {
        WinMove,%WinName%,,0,%Y2%,%X2%,%Y2%
  }

return


GuiClose:
Gui, Destroy
Return

/*

; These two Hotkeys hide and restore the Windows Task bar. Be careful or you may freak out. Remove the comment block marks to test.


^#!T::
    WinShow ahk_class Shell_TrayWnd
;    WinShow ahk_class DV2ControlHost
Return

^#!H::
    WinHide ahk_class Shell_TrayWnd
;    WinHide ahk_class DV2ControlHost
Return

*/