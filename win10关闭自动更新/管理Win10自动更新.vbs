' ����Win10�Զ�����.vbs.
' 20190410 �������Զ���Ȩ����;
' 20190405 ��ʼ�汾,ʵ���˻�������;
' ʹ��˵�� https://blog.csdn.net/milaoshu1020/article/details/89045265
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
	msgbox "�ű�������������!"
End If

Sub Run()
	Do
		ret = inputbox("1. ����wuauserv�����ע�����Ϣ;" & vbcrlf & _
						"2. ɾ��wuauserv����(����ֹWin10�Զ�����);" & vbcrlf & _
						"3. �ָ�wuauserv����(���ָ�Win10�Զ�����);" & vbcrlf & _
						vbcrlf & _
						"���������:",,"1")
		Select Case ret
		Case "1"
			retnum = shell.run("regedit.exe /s /e """ & userregpath & """ """ & wuauserv_reg & """",0,True)
			If retnum = 0 Then
				msgbox "ע��������!",vbinformation
			Else
				msgbox "ע�����ʧ��!'regedit.exe'���ش���:" & retnum,vbcritical
			End If
			Exit Do
		Case "2"
			retnum = shell.run("sc.exe stop wuauserv",0,True)
			retnum = shell.run("sc.exe delete wuauserv",0,True)
			If retnum = 0 Then
				msgbox "��ɾ��wuauserv����!�ѽ�ֹWin10�Զ�����!",vbexclamation
			Else
				msgbox "ɾ��wuauserv����ʧ��!'sc.exe'���ش���:" & retnum,vbcritical
			End If
			Exit Do
		Case "3"
			If fso.fileexists(userregpath) Then
				retnum = shell.run("sc.exe create wuauserv binpath= ""c:\windows\system32\svchost.exe -k netsvcs -p"" type= share " & _
						"start= auto error= normal tag= no depend= rpcss displayname= ""Windows Update""",0,True)
				If retnum <> 0 Then
					msgbox "�ָ�wuauserv����ʧ��!'sc.exe'���ش���:" & retnum,vbcritical
					Exit Do
				End If
				retnum = shell.run("regedit.exe /s """ & userregpath & """",0,True)
				If retnum <> 0 Then
					msgbox "�ָ�wuauserv����ʧ��!'regedit.exe'���ش���:" & retnum,vbcritical
					Exit Do
				End If
			ElseIf fso.fileexists(defaultregpath) Then
				retnum = shell.run("sc.exe create wuauserv binpath= ""c:\windows\system32\svchost.exe -k netsvcs -p"" type= share " & _
						"start= auto error= normal tag= no depend= rpcss displayname= ""Windows Update""",0,True)
				If retnum <> 0 Then
					msgbox "�ָ�wuauserv����ʧ��!'sc.exe'���ش���:" & retnum,vbcritical
					Exit Do
				End If
				retnum = shell.run("regedit.exe /s """ & defaultregpath & """",0,True)
				If retnum <> 0 Then
					msgbox "�ָ�wuauserv����ʧ��!'regedit.exe'���ش���:" & retnum,vbcritical
					Exit Do
				End If
			Else
				msgbox "δ�ҵ�ע����ļ�(user.reg|default.reg)!�ָ�ʧ��!",vbcritical
				Exit Do
			End If

			retnum = shell.run("sc.exe start wuauserv",0,True)
			If retnum <> 0 Then
				msgbox "����wuauserv����ʧ��!'sc.exe'���ش���:" & retnum,vbcritical
				Exit Do
			End If
			
			msgbox "�ɹ��ָ�wuauserv����!�ɹ��ָ�Win10�Զ�����!",vbexclamation
			Exit Do
		Case ""
			Exit Do
		Case Else
			msgbox "�������!����������!",vbcritical
		End Select
	Loop
End Sub
