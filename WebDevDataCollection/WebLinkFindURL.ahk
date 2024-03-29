#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

/*
May 16, 2020

This WebLinkFindURL.ahk script copies the text based external Weblinks in the active browser
tab and places them in an AutoHotkey GUI as hotlinks. As the number of links grow, the scripts 
adds GUI Tab control to contain them.

The script uses the GetActiveBrowserURL() function by Antonio Bueno to get the URL of the
current (active) browser tab:
http://autohotkey.com/boards/viewtopic.php?f=6&t=3702

This script includes a copy of the needed functions (commented out).
Remove the enclosing /* and */ to activate the functions (or place them in a function library)

Run the WebLinkFindURL.ahk script, open any Web page in one of the compatible browsers 
(most work), and use the Hotkey combination CTRL+WIN+ALT+L. The routine captures the 
URL (GetActiveBrowserURL() function required), downloads the page, uses RegExMatch() 
function to extract external text Web links and the RegExReplace() function to clean up those
links, then it places each in a GUI pop-up window as a hotlink using GUI Link controls for activation
and Tab controls to wrap long lists.

https://jacks-autohotkey-blog.com/2020/05/11/scrape-cull-web-links-from-a-web-page-active-in-gui/

*/

 ModernBrowsers := "ApplicationFrameWindow,Chrome_WidgetWin_0
          ,Chrome_WidgetWin_1,Maxthon3Cls_MainFrm
           ,MozillaWindowClass,Slimjet_WidgetWin_1"

^#!l::
  sURL := GetActiveBrowserURL()
;                 MsgBox %sURL%
  WinGetActiveTitle, WinTitle
  UrlDownloadToFile, %sURL%, URLtemp
  FileRead, URLtemp, URLtemp
; Loop extracting and writing links to variable LinkList
  LinkList = 
  Next := 1
  LinkCount := 0
  TabCount := 1
  Gui, Add, Tab3,, 1
  Loop
  {
    FoundPos := RegExMatch(URLtemp, "<a.+?href=""(https?.+?)"".*?>(.+?)</a>" , Link, Next)
    If FoundPos = 0
      Break
    Else
      {
        Link2 := RegExReplace(Link2, "<.+?>")
        If (Link2 != "") 
        {
          Gui, Add, Link,, <a href="%Link1%">%Link2%</a>
          LinkCount := LinkCount + 1
          If LinkCount = 20
          {
            TabCount := TabCount + 1   
            GuiControl, ,SysTabControl321, %TabCount%
            Gui,Tab, %TabCount%
            LinkCount := 0
          }
      	}
        LinkList := LinkList . Link2 . "`n" . Link1 .  "`n`n"
        Next := FoundPos + StrLen(Link)
      }
  }
; Saves data for matched links
  If LinkList !
    LinkList := "No External Links Found!"
; Delete old file, write new file, and open with Notepad
  FileDelete, LinkText
  FileAppend, %LinkList%, LinkText
;  Run, Notepad LinkText
  Gui, Show, , %WinTitle%
Return

GuiClose:
  Gui, Destroy
Return

/*

; If you don't maintain this function in your library, remove
; the enclosing /* and */ comment characters.

GetActiveBrowserURL() {
	global ModernBrowsers, LegacyBrowsers
	WinGetClass, sClass, A
	If sClass In % ModernBrowsers
		Return GetBrowserURL_ACC(sClass)
	Else If sClass In % LegacyBrowsers
		Return GetBrowserURL_DDE(sClass) ; empty string if DDE not supported (or not a browser)
	Else
		Return ""
}

; "GetBrowserURL_DDE" adapted from DDE code by Sean, (AHK_L version by maraskan_user)
; Found at http://autohotkey.com/board/topic/17633-/?p=434518

GetBrowserURL_DDE(sClass) {
	WinGet, sServer, ProcessName, % "ahk_class " sClass
	StringTrimRight, sServer, sServer, 4
	iCodePage := A_IsUnicode ? 0x04B0 : 0x03EC ; 0x04B0 = CP_WINUNICODE, 0x03EC = CP_WINANSI
	DllCall("DdeInitialize", "UPtrP", idInst, "Uint", 0, "Uint", 0, "Uint", 0)
	hServer := DllCall("DdeCreateStringHandle", "UPtr", idInst, "Str", sServer, "int", iCodePage)
	hTopic := DllCall("DdeCreateStringHandle", "UPtr", idInst, "Str", "WWW_GetWindowInfo", "int", iCodePage)
	hItem := DllCall("DdeCreateStringHandle", "UPtr", idInst, "Str", "0xFFFFFFFF", "int", iCodePage)
	hConv := DllCall("DdeConnect", "UPtr", idInst, "UPtr", hServer, "UPtr", hTopic, "Uint", 0)
	hData := DllCall("DdeClientTransaction", "Uint", 0, "Uint", 0, "UPtr", hConv, "UPtr", hItem, "UInt", 1, "Uint", 0x20B0, "Uint", 10000, "UPtrP", nResult) ; 0x20B0 = XTYP_REQUEST, 10000 = 10s timeout
	sData := DllCall("DdeAccessData", "Uint", hData, "Uint", 0, "Str")
	DllCall("DdeFreeStringHandle", "UPtr", idInst, "UPtr", hServer)
	DllCall("DdeFreeStringHandle", "UPtr", idInst, "UPtr", hTopic)
	DllCall("DdeFreeStringHandle", "UPtr", idInst, "UPtr", hItem)
	DllCall("DdeUnaccessData", "UPtr", hData)
	DllCall("DdeFreeDataHandle", "UPtr", hData)
	DllCall("DdeDisconnect", "UPtr", hConv)
	DllCall("DdeUninitialize", "UPtr", idInst)
	csvWindowInfo := StrGet(&sData, "CP0")
	StringSplit, sWindowInfo, csvWindowInfo, `" ;"; comment to avoid a syntax highlighting issue in autohotkey.com/boards
	Return sWindowInfo2
}

GetBrowserURL_ACC(sClass) {
	global nWindow, accAddressBar
	If (nWindow != WinExist("ahk_class " sClass)) ; reuses accAddressBar if it's the same window
	{
		nWindow := WinExist("ahk_class " sClass)
		accAddressBar := GetAddressBar(Acc_ObjectFromWindow(nWindow))
	}
	Try sURL := accAddressBar.accValue(0)
	If (sURL == "") {
		WinGet, nWindows, List, % "ahk_class " sClass ; In case of a nested browser window as in the old CoolNovo (TO DO: check if still needed)
		If (nWindows > 1) {
			accAddressBar := GetAddressBar(Acc_ObjectFromWindow(nWindows2))
			Try sURL := accAddressBar.accValue(0)
		}
	}
	If ((sURL != "") and (SubStr(sURL, 1, 4) != "http")) ; Modern browsers omit "http://"
		sURL := "http://" sURL
	If (sURL == "")
		nWindow := -1 ; Don't remember the window if there is no URL
	Return sURL
}

; "GetAddressBar" based in code by uname
; Found at http://autohotkey.com/board/topic/103178-/?p=637687

GetAddressBar(accObj) {
	Try If ((accObj.accRole(0) == 42) and IsURL(accObj.accValue(0)))
		Return accObj
	Try If ((accObj.accRole(0) == 42) and IsURL("http://" accObj.accValue(0))) ; Modern browsers omit "http://"
		Return accObj
	For nChild, accChild in Acc_Children(accObj)
		If IsObject(accAddressBar := GetAddressBar(accChild))
			Return accAddressBar
}

IsURL(sURL) {
	Return RegExMatch(sURL, "^(?<Protocol>https?|ftp)://(?<Domain>(?:[\w-]+\.)+\w\w+)(?::(?<Port>\d+))?/?(?<Path>(?:[^:/?# ]*/?)+)(?:\?(?<Query>[^#]+)?)?(?:\#(?<Hash>.+)?)?$")
}

; The code below is part of the Acc.ahk Standard Library by Sean (updated by jethrow)
; Found at http://autohotkey.com/board/topic/77303-/?p=491516

Acc_Init()
{
	static h
	If Not h
		h:=DllCall("LoadLibrary","Str","oleacc","Ptr")
}
Acc_ObjectFromWindow(hWnd, idObject = 0)
{
	Acc_Init()
	If DllCall("oleacc\AccessibleObjectFromWindow", "Ptr", hWnd, "UInt", idObject&=0xFFFFFFFF, "Ptr", -VarSetCapacity(IID,16)+NumPut(idObject==0xFFFFFFF0?0x46000000000000C0:0x719B3800AA000C81,NumPut(idObject==0xFFFFFFF0?0x0000000000020400:0x11CF3C3D618736E0,IID,"Int64"),"Int64"), "Ptr*", pacc)=0
	Return ComObjEnwrap(9,pacc,1)
}
Acc_Query(Acc) {
	Try Return ComObj(9, ComObjQuery(Acc,"{618736e0-3c3d-11cf-810c-00aa00389b71}"), 1)
}
Acc_Children(Acc) {
	If ComObjType(Acc,"Name") != "IAccessible"
		ErrorLevel := "Invalid IAccessible Object"
	Else {
		Acc_Init(), cChildren:=Acc.accChildCount, Children:=[]
		If DllCall("oleacc\AccessibleChildren", "Ptr",ComObjValue(Acc), "Int",0, "Int",cChildren, "Ptr",VarSetCapacity(varChildren,cChildren*(8+2*A_PtrSize),0)*0+&varChildren, "Int*",cChildren)=0 {
			Loop %cChildren%
				i:=(A_Index-1)*(A_PtrSize*2+8)+8, child:=NumGet(varChildren,i), Children.Insert(NumGet(varChildren,i-8)=9?Acc_Query(child):child), NumGet(varChildren,i-8)=9?ObjRelease(child):
			Return Children.MaxIndex()?Children:
		} Else
			ErrorLevel := "AccessibleChildren DllCall Failed"
	}
} 

*/