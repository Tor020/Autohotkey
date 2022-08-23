#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
/*
AutoHotkey Version: 2.x

This AutoHotkey script uses version 2.0 functions and won't run under version 1.1.
The .ahk2 file extension denotes all V2.0 scripts and can be compared to the sister 1.1
scripts with the .ahk extension.

For more information about how to run both V1.1 and V2.0 simultaneously, see:
https://jacksautohotkeyblog.wordpress.com/2018/01/11/how-to-fool-around-with-the-new-autohotkey-version-2-0/

*/
;
; AutoHotkey Version: 2.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Jack Dunning
;
; Script Function:
; WindowMove.ahk uses a DropDownList GUI control to resize and move a window 
; to different positions on the screen.

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.

^#M::


WinName := WinGetTitle("A")

If WinExist("Move Window") = 0
{

WindowMove := GuiCreate( ,"Move Window")

WindowMove.SetFont("s12","Arial")

WinDropDown := WindowMove.Add("DropDownList","AltSubmit w275 vPosition "
               ,"Select Position on the Screen||Right Half of Screen
               |Left Half of Screen|Top Half of Screen|Bottom Half of Screen
               |Center of Screen|Top Right Corner|Bottom Right Corner
               |Top Left Corner|Bottom Left Corner|Larger Center")
WinDropDown.OnEvent("Change","PosChoice")
WindowMove.OnEvent("Close","GuiClose")
}

WindowMove.Show("W300 H40")
Return

PosChoice()
{
Global
NewLocate := WindowMove.Submit(0)

WinGetPos TX1,TY1,TW1,TH1,"ahk_class Shell_TrayWnd"

WinGetPos X1,Y1,W1,H1,"Program Manager"
	X2 := W1/2
	Y2 := (H1-TH1)/2
	Y3 := H1-TH1
	X4 := W1/4
	Y4 := H1/4

If NewLocate["Position"] = 2
  {
        WinMove X2,0,X2,Y3, WinName
  }
If NewLocate["Position"] = 3
  {
         WinMove 0,0,X2,Y3, WinName
  }
If NewLocate["Position"] = 4
  {
        WinMove 0,0,W1,Y2, WinName
  }
If NewLocate["Position"] = 5
  {
        WinMove 0,Y2,W1,Y2, WinName
  }
If NewLocate["Position"] = 6
  {
        WinMove X4,Y4,X2,Y2, WinName
  }
If NewLocate["Position"] = 7
  {
        WinMove X2,0,X2,Y2, WinName
  }
If NewLocate["Position"] = 8
  {
        WinMove X2,Y2,X2,Y2, WinName
  }
If NewLocate["Position"] = 9
  {
        WinMove 0,0,X2,Y2, WinName
  }
If NewLocate["Position"] = 10
  {
        WinMove 0,Y2,X2,Y2, WinName
  }
If NewLocate["Position"] = 11
  {
        WinMove X4/2,Y4/2,X2*1.5,Y2*1.5, WinName
  }

}


GuiClose()
{
Global
WindowMove.Destroy
}


/*

; These two Hotkeys hide and restore the Windows Task bar. Be careful or you may freak out.


^#!T::
    WinShow "ahk_class Shell_TrayWnd"
;    WinShow ahk_class DV2ControlHost
Return
^#!H::
    WinHide "ahk_class Shell_TrayWnd"
;    WinHide ahk_class DV2ControlHost
Return
*/