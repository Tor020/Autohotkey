https://www.autohotkey.com/boards/viewtopic.php?style=7&f=6&t=95041

#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#WinActivateForce
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
;OPTIMIZATIONS END

; Gui, +ToolWindow -Caption 
GuiName:="CSSBTN"
Gui,%GUINAME%:New
Gui,%GUINAME%:+Label%GUINAME% +Resize
Gui,%GUINAME%:Margin,0,0
Gui,%GUINAME%:Color,000000
Gui,%GUINAME%:Font,% "s20", Calibri
Gui,%GUINAME%: Add, Text, % "x0 cF1E9E5", % "CSS Button Styler"
position:=CSSBtn.constructWB("STYLE " 1,"Action" 1,1,{x:0,y:25})
Loop,3
{
    position:=CSSBtn.constructWB("STYLE " A_Index+1,"Action" 2,A_Index+1)
}
position:=CSSBtn.constructWB("STYLE " 5,"CustomFunction",5)
position:=CSSBtn.constructWB("STYLE " 6,"DoCertainAction",6)
position:=CSSBtn.constructWB("BUTTON " 7,"DoCertainAction",2,{x:50,y:300})
Gui,%GUINAME%: Show, Autosize Center, CSS button Styler
; WinSet, Transcolor, FF00FF, Test
OnMessage(0x0201, "WM_LBUTTONDOWN")
WM_LBUTTONDOWN()
{
   If (A_Gui)
      PostMessage, 0xA1, 2
; 0xA1: WM_NCLBUTTONDOWN, refer to http://msdn.microsoft.com/en-us/library/ms645620%28v=vs.85%29.aspx
; 2: HTCAPTION (in a title bar), refer to http://msdn.microsoft.com/en-us/library/ms645618%28v=vs.85%29.aspx 
}
return

CSSBTNClose:
ExitApp

;______                _   _                 
;|  ___|              | | (_)                
;| |_ _   _ _ __   ___| |_ _  ___  _ __  ___ 
;|  _| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
;| | | |_| | | | | (__| |_| | (_) | | | \__ \
;\_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
Action1_OnClick(__myObject)
{
    global WB_1
    ToolTip you clicked on Action1_OnClick function
    modstyle:={font:"italic bold 20px arial",backgroundColor:"#464660" ; https://www.w3schools.com/jsref/dom_obj_style.asp
        ,color:"#F1E9E5",fontFamily:"Calibri",fontWeight:"700"
        ,backgroundImage:"url('img_tree.png')"}
    WB_1.document.querySelectorAll("#Action1")[0].innerText:="Changed"
    element:=WB_1.document.querySelectorAll("#Action1")[0].style
    For key,value in modstyle
        element[key]:=value
}

Action2_OnClick(__myObject)
{
    msgbox,% __myObject.onclick.name "`n" __myObject.innerText "`nProperties X = " __myObject.details.x ", Y = " __myObject.details.y ", W = " __myObject.details.W ", H = " __myObject.details.H ", WB# = " __myObject.details.WB_num
}

Action_OnClick(__myObject)
{
    ToolTip Action_OnClick function with no numbers
    for __key, __func in __myObject
	    MsgBox % __key . "," . __func.name
}

CustomFunction_onClick(__myObject)
{
    msgbox,% "Action 5 is slightly different`n" __myObject.onclick.name "`n" __myObject.innerText "`nProperties X = " __myObject.details.x ", Y = " __myObject.details.y ", W = " __myObject.details.W ", H = " __myObject.details.H ", WB# = " __myObject.details.WB_num
}

DoCertainAction_onClick()
{
    Msgbox, Hey
    Run,% "Chrome.exe " "duckduckgo.com"
}

; ██████╗███████╗███████╗██████╗ ████████╗███╗   ██╗     ██████╗██╗      █████╗ ███████╗███████╗
;██╔════╝██╔════╝██╔════╝██╔══██╗╚══██╔══╝████╗  ██║    ██╔════╝██║     ██╔══██╗██╔════╝██╔════╝
;██║     ███████╗███████╗██████╔╝   ██║   ██╔██╗ ██║    ██║     ██║     ███████║███████╗███████╗
;██║     ╚════██║╚════██║██╔══██╗   ██║   ██║╚██╗██║    ██║     ██║     ██╔══██║╚════██║╚════██║
;╚██████╗███████║███████║██████╔╝   ██║   ██║ ╚████║    ╚██████╗███████╗██║  ██║███████║███████║
; ╚═════╝╚══════╝╚══════╝╚═════╝    ╚═╝   ╚═╝  ╚═══╝     ╚═════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝
Class CSSBtn
{
;|------------------------------------------------------------------------------------------------------------------------|
;|                                                                                                                        |
;|                                                                                                                        |
;|                                                        CSS Btn                                                         |
;|                                           ========= width 120 char =========                                           |
;|                                                                                                                        |
;|               Create stylist buttons using Active X in a Gui with pre-formatted styles                                 |
;|               Short summary of each function within the class                                                          |
;|                                                                                                                        |
;|                   1. constructWB - the main fn to create the Active X, position it and style the button within.        |
;|               Also have option for CUSTOM position through last parameter as an object. eg. {x:5,y:100}.               |
;|                                                                                                                        |
;|               connectNumber and WB# are neccessary for increment to make new active X element on Gui. GuiName should   |
;|               also be predefined.                                                                                      |
;|                                                                                                                        |
;|               This fn returns an object with all the X,Y,H,W and WB#                                                   |
;|                                                                                                                        |
;|                    2. AddActiveX - fn to at active X at positions determined by buildbycolor fn                        |
;|                                                                                                                        |
;|                    3. buildbycolor fn - to theme and position elements                                                 |
;|                                                                                                                        |
;|                    4. constructWB_ButtonHandler fn - to create function  _onClick that will be launched when           |
;|               button is pressed                                                                                        |
;|                                                                                                                        |
;|               ** Position must be Global to reduce number of arguments required for main function to work              |
;|               ***Button background size can be adjusted in the line GuiControl,Move                                    |
;|                                                                                                                        |
;|                                                                                                                        |
;|------------------------------------------------------------------------------------------------------------------------|
    
    constructWB(btntxt:="Button ONE",buttonID:="function",ThemeNumber:=3,CustomPosition:="")
    {
        global connectNumber, WB#
        style:=This.buildbycolor(ThemeNumber)
        WB#++
        If (CustomPosition="")
            This.AddActiveX(style.AXPos)
        Else
            This.AddActiveX(CustomPosition)
        varofActiveX:=WB_%WB#%
        instringform:="WB_" WB#
        connectNumber++
        
        html=
        (%
            <!DOCTYPE html>
            <html>
            <head>
            <style type="text/css">
            .myButton {

            /*     box-shadow: 0px 10px 14px -7px #9fb4f2; */
                background-color:#{bgc};
                border-radius:6px;
                border:1px solid #{borderC};
                cursor:pointer;
                color:#{txtC};
                font-family:{font-family};
                font-size:{font-size}px;
                font-weight:{font-weight};
                padding:5px 10px;
                text-decoration:none;
                text-shadow:0px 1px 0px #283966;
                margin:0px;


            }
            .myButton:hover {
                background-color:#{hoverc};
            }
            .myButton:active {
                background-color:#{activec};
            }
            body {
            background-color: #{bodyc};
                padding-top:0;
                border-top:0;
                margin-top: 0;
            }
            div {

                margin: 0;
                display: flex;
                justify-content: center;

            }
            a {
                text-align: center;
                line-height:1em;
                overflow-wrap: normal;
                position:fixed;
                top:0px;
                left:0px;

            }
            </style>
            </head>
            <body>
            <div>
                <a href="#" class="myButton" id="{buttonID}">{btnTxt}</a>
            </div>
            </body>
            </html>
        )
        html:=StrReplace(StrReplace(StrReplace(StrReplace(StrReplace(StrReplace(StrReplace(StrReplace(StrReplace(StrReplace(StrReplace(html, "{bgc}", style.bgc), "{bodyC}", style.bodyc), "{hoverC}", style.hoverC), "{txtC}", style.txtC), "{borderc}", style.borderc),"{activec}", style.activec), "{font-family}", style.font_family), "{font-size}", style.font_size), "{font-weight}", style.font_weight), "{btnTxt}", btntxt), "{buttonID}", buttonID)
        document := varofActiveX.Document
        document.open()
        document.write(html)
        document.close()
        GuiControl,Move,% instringform,% "w" document.querySelectorAll("#" buttonID)[0].clientWidth*0.83 " h" document.querySelectorAll("#" buttonID)[0].clientHeight*0.9
        GuiControlGet, itempos, pos, WB_%WB#%
        obj:={x:itemposX,y:itemposY,w:itemposW,h:itemposH,WB_num:WB#}
        This.constructWB_ButtonHandler(document,buttonID,obj,connectNumber)
        Return obj
    }

    AddActiveX(positionobj)
    {
        global
        Gui, %GuiName%:Add, ActiveX,% "W800 H600 x" positionobj.x " vWB_" WB# " -VScroll -HScroll" " y" positionobj.y, about:<!DOCTYPE html><meta http-equiv="X-UA-Compatible" content="IE=edge">
    }

    constructWB_ButtonHandler(document,buttonID,obj,byref ConnectNumber) 
    {
        global
        innerText:=document.querySelectorAll("#" buttonID)[0].innerText
        ComObjConnect(xyz%ConnectNumber%:=document.querySelectorAll("#" buttonID)[0],{"innerText":innerText,details:obj,"onclick": Func(buttonID "_onclick")})
    }

    buildbycolor(theme)
    {
        global position
        switch theme ; txtC, bgC, hoverC, activeC, borderC
        {
            case 1:
                selected:=["FFF9B2","3F0713","A45D5D","FDD2BF","F3EFCC"]
            case 2:
                selected:=["506D84","F3F0D7","CEE5D0","FDD2BF","F3EFCC"]
            case 3:
                selected:=["F7F6F2","152D35","345B63","FDD2BF","F3EFCC"]
            case 4:
                selected:=["112031","D4ECDD","FEFBF3","F1F7E7","F3EFCC"]
            case 5:
                selected:=["B5FFD9","444941","5F7A61","D5EEBB","5F7A61"]
            case 6:
                selected:=["F1E9E5","464660","5C527F","261C2C","5C527F"]
        }
        If (position.x="")
            position:={x:0,y:35,h:0}
        Return styleobj:={AXPos:{x:position.X+position.W,y:position.y},bgc:selected.2,bodyc:"000000",hoverc:selected.3,txtC:selected.1,activeC:selected.4,font_family:"Tahoma",font_size:"30",font_weight:"normal",borderC:selected.5}
    }
}