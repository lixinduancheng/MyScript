﻿;https://autohotkey.com/boards/viewtopic.php?f=6&t=3702
Windo_其他浏览器打开:
ModernBrowsers := "ApplicationFrameWindow,Chrome_WidgetWin_0,Chrome_WidgetWin_1,Maxthon3Cls_MainFrm,MozillaWindowClass,Slimjet_WidgetWin_1,360se6_Frame"
LegacyBrowsers := "IEFrame,OperaWindowClass"
OtherBrowsers :="AuroraMainFrame"
sURL := GetActiveBrowserURL(Windy_CurWin_Class)
tooltip % Windy_CurWin_Class "`n" sURL
run,% Splitted_Windy_Cmd3 " " sURL
return

GetActiveBrowserURL(sClass) {
	global ModernBrowsers, LegacyBrowsers,OtherBrowsers
	if !sclass
		WinGetClass, sClass, A
	If sClass In % ModernBrowsers
		Return GetBrowserURL_ACC(sClass)
	Else If sClass In % LegacyBrowsers
		Return GetBrowserURL_DDE(sClass) ; empty string if DDE not supported (or not a browser)
	Else If sClass In % OtherBrowsers
		Return GetBrowserURL_hK()
	Else
		Return ""
}