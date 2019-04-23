' 管理Win10自动更新.vbs.
' 20190410 增加了自动提权代码;
' 20190405 初始版本,实现了基本功能;
' 使用说明 https://blog.csdn.net/milaoshu1020/article/details/89045265
Const wuauserv_reg = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv"
Set fso = createobject("scripting.filesystemobject")
Set shell = createobject("wscript.shell")
curdir = fso.getparentfoldername(wscript.scriptfullname)
userregpath = fso.buildpath(curdir,"user.reg")
defaultregpath = fso.buildpath(curdir,"default.reg")

If wscript.arguments.count = 0 Then
	Set sh = createobject("shell.application")
	sh.shellexecute wscript.fullname,"""" & wscript.scriptfullname & """ -admin",,"runas"
ElseIf wscript.arguments.count = 1 And wscript.arguments(0) = "-admin" Then
	run
Else
	msgbox "脚本启动参数错误!"
End If

Sub Run()
	Do
		ret = inputbox("1. 备份wuauserv服务的注册表信息;" & vbcrlf & _
						"2. 删除wuauserv服务(将禁止Win10自动更新);" & vbcrlf & _
						"3. 恢复wuauserv服务(将恢复Win10自动更新);" & vbcrlf & _
						vbcrlf & _
						"请输入序号:",,"1")
		Select Case ret
		Case "1"
			retnum = shell.run("regedit.exe /s /e """ & userregpath & """ """ & wuauserv_reg & """",0,True)
			If retnum = 0 Then
				msgbox "注册表备份完成!",vbinformation
			Else
				msgbox "注册表备份失败!'regedit.exe'返回代码:" & retnum,vbcritical
			End If
			Exit Do
		Case "2"
			retnum = shell.run("sc.exe stop wuauserv",0,True)
			retnum = shell.run("sc.exe delete wuauserv",0,True)
			If retnum = 0 Then
				msgbox "已删除wuauserv服务!已禁止Win10自动更新!",vbexclamation
			Else
				msgbox "删除wuauserv服务失败!'sc.exe'返回代码:" & retnum,vbcritical
			End If
			Exit Do
		Case "3"
			If fso.fileexists(userregpath) Then
				retnum = shell.run("sc.exe create wuauserv binpath= ""c:\windows\system32\svchost.exe -k netsvcs -p"" type= share " & _
						"start= auto error= normal tag= no depend= rpcss displayname= ""Windows Update""",0,True)
				If retnum <> 0 Then
					msgbox "恢复wuauserv服务失败!'sc.exe'返回代码:" & retnum,vbcritical
					Exit Do
				End If
				retnum = shell.run("regedit.exe /s """ & userregpath & """",0,True)
				If retnum <> 0 Then
					msgbox "恢复wuauserv服务失败!'regedit.exe'返回代码:" & retnum,vbcritical
					Exit Do
				End If
			ElseIf fso.fileexists(defaultregpath) Then
				retnum = shell.run("sc.exe create wuauserv binpath= ""c:\windows\system32\svchost.exe -k netsvcs -p"" type= share " & _
						"start= auto error= normal tag= no depend= rpcss displayname= ""Windows Update""",0,True)
				If retnum <> 0 Then
					msgbox "恢复wuauserv服务失败!'sc.exe'返回代码:" & retnum,vbcritical
					Exit Do
				End If
				retnum = shell.run("regedit.exe /s """ & defaultregpath & """",0,True)
				If retnum <> 0 Then
					msgbox "恢复wuauserv服务失败!'regedit.exe'返回代码:" & retnum,vbcritical
					Exit Do
				End If
			Else
				msgbox "未找到注册表文件(user.reg|default.reg)!恢复失败!",vbcritical
				Exit Do
			End If

			retnum = shell.run("sc.exe start wuauserv",0,True)
			If retnum <> 0 Then
				msgbox "启动wuauserv服务失败!'sc.exe'返回代码:" & retnum,vbcritical
				Exit Do
			End If
			
			msgbox "成功恢复wuauserv服务!成功恢复Win10自动更新!",vbexclamation
			Exit Do
		Case ""
			Exit Do
		Case Else
			msgbox "输入错误!请重新输入!",vbcritical
		End Select
	Loop
End Sub
