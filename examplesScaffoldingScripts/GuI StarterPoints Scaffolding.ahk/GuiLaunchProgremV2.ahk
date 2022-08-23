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

LaunchWindow := GuiCreate()

LaunchWindow.SetFont("s12 cBlue", "Arial")
LaunchWindow.Title := "Launch Program"
MyGoogle := LaunchWindow.Add("Picture","w30 Icon1"
          ,"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
MyGoogle.OnEvent("Click","LaunchGoogle")
MyGoogleButton := LaunchWindow.Add("Button","ys","Google")
          MyGoogleButton.OnEvent("Click","LaunchGoogle")

MyFirefox := LaunchWindow.Add("Picture","w30 section xs Icon1"
          ,"C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
MyFirefox.OnEvent("Click","LaunchFirefox")
MyFirefoxButton := LaunchWindow.Add("Button","ys","Firefox")
          MyFirefoxButton.OnEvent("Click","LaunchFirefox")

MyEdge := LaunchWindow.Add("Picture","w30 section xs Icon1"
       ,"C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\MicrosoftEdge.exe")
          MyEdge.OnEvent("Click","LaunchEdge")
MyEdgeButton := LaunchWindow.Add("Button","ys","Microsoft Edge")
          MyEdgeButton.OnEvent("Click","LaunchEdge")

MyDropBox := LaunchWindow.Add("Picture","w30 section xs Icon1"
        ,"C:\Users\" . A_UserName . "\AppData\Roaming\Dropbox\bin\Dropbox.exe")
          MyDropBox.OnEvent("Click","LaunchDropBox")
MyDropBoxButton := LaunchWindow.Add("Button","ys","DropBox")
          MyDropBoxButton.OnEvent("Click","LaunchDropBox")

LaunchWindow.Show()
Return

LaunchGoogle()
{
  Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
  WinClose
}

LaunchFirefox()
{
  Run "C:\Program Files (x86)\Mozilla Firefox\firefox.exe www.facebook.com"
  WinClose
}

LaunchEdge()
{
  Run "C:\Windows\explorer.exe shell:Appsfolder\Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge"
  WinClose
}

LaunchDropBox()
{
  Run "C:\Users\" . A_UserName . "\Dropbox"
  WinClose