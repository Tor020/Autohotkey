Gui, Add, DropDownList, x162 y-55 w130 h104 , DropDownList
Gui, Add, ComboBox, x52 y179 w20 h0 , ComboBox
Gui, Font, S8 CDefault, Verdana
Gui, Add, Hotkey, x382 y9 w-110 h-66 , 
Gui, Add, Slider, x352 y169 w-310 h-90 , 25
Gui, Add, DateTime, x12 y-1 w110 h50 , 
Gui, Add, MonthCal, x12 y59 w230 h160 , 
Gui, Add, Picture, x252 y39 w190 h200 , F:\picturesofme\Screenshot 2021-02-23 211323.png
Gui, Add, Text, x302 y249 w100 h30 , Text
Gui, Add, Edit, x362 y329 w110 h30 , Edit
Gui, Add, Button, x312 y289 w90 h20 , Button
Gui, Add, Progress, x302 y239 w100 h10 , 25
; Generated using SmartGUI Creator 4.0
Gui, Show, x127 y87 h379 w479, New GUI Window
Return

GuiClose:
ExitApp