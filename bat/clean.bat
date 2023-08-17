    @echo off
    REM 清除 mstsc 配置
    reg delete "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Default" /va /f
    reg delete "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers" /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers"
    
    REM 删除 Default.rdp 文件
    cd %userprofile%\documents\
    attrib Default.rdp -s -h
    del Default.rdp
    
    REM 清除 cmd 历史记录
    reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f
    
    echo "清理垃圾"
    pause
    # 创建任务计划，将脚本设置为在关机时运行
    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -WindowStyle Hidden -File ""C:\Program Files\m\clean-up.ps1"""
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $task = Register-ScheduledTask -TaskName "CleanupScript" -Action $action -Trigger $trigger -RunLevel Highest -Force
    
    Write-Host "已成功创建任务计划，脚本将在关机时运行。"
    
    
    # 查询任务
    #Get-ScheduledTask
    #Get-ScheduledTask -TaskName "CleanupScript" | Format-List *