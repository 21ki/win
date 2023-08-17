# 强行关闭正在运行的终端
taskkill /IM WindowsTerminal.exe /t /f

# Get-Process -Name "WindowsTerminal", "powershell", "cmd" | Stop-Process -Force
# 强行关闭正在运行的终端
$processes = Get-Process -Name "wt", "powershell", "cmd" -ErrorAction SilentlyContinue
$processes | Stop-Process -Force -PassThru | ForEach-Object {
    $parentId = $_.Id
    $currentProcess = Get-Process -Id $parentId -ErrorAction SilentlyContinue
    if ($currentProcess -ne $null) {
        Stop-Process -Id $currentProcess.Id -Force
    }
}

# 使用 tasklist 命令查找正在运行的 Windows Terminal 进程
$processes = tasklist | Select-String -Pattern "WindowsTerminal.exe"

# 循环遍历匹配到的进程，并使用 taskkill 命令关闭它们
foreach ($process in $processes) {
    $processId = ($process -split "\s+")[1]
    taskkill /F /PID $processId
}


# 不记录当前命令记录
[Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()

# 清理 mstsc 配置
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Terminal Server Client\Default" -Name * -ErrorAction SilentlyContinue
Remove-Item -Path "HKCU:\Software\Microsoft\Terminal Server Client\Servers" -Recurse -ErrorAction SilentlyContinue
New-Item -Path "HKCU:\Software\Microsoft\Terminal Server Client\Servers" -Force | Out-Null

$rdpFilePath = Join-Path $env:userprofile "documents\Default.rdp"
if (Test-Path $rdpFilePath) {
    Set-ItemProperty -Path $rdpFilePath -Name Attributes -Value ((Get-ItemProperty -Path $rdpFilePath -Name Attributes).Attributes -bxor 0x2)
    if (-not (Test-Path $rdpFilePath)) {
        Write-Host "Default.rdp 文件已成功删除"
    } else {
        Remove-Item -Path $rdpFilePath -ErrorAction SilentlyContinue
        if (-not (Test-Path $rdpFilePath)) {
            Write-Host "Default.rdp 文件已成功删除"
        } else {
            Write-Host "Default.rdp 文件删除失败"
        }
    }
}

# 清理 Windows 11 打开文件记录
$recentFilesPath = Join-Path $env:userprofile "AppData\Roaming\Microsoft\Windows\Recent"
$files = Get-ChildItem -Path $recentFilesPath
foreach ($file in $files) {
    Remove-Item -Path $file.FullName -Recurse -Force -ErrorAction SilentlyContinue
    if (-not (Test-Path -Path $file.FullName)) {
        Write-Host "已成功清理打开文件记录: $($file.Name)"
    }
}


# 清理终端历史命令
Clear-History -ErrorAction SilentlyContinue

# 清理 cmd 历史记录
Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" -Name * -ErrorAction SilentlyContinue

# 清理 PowerShell 7 及以上版本的终端历史命令
if (Test-Path -Path $PROFILE) {
    $ps7HistoryPath = (Split-Path -Parent -Path $PROFILE) + "\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
    if (Test-Path -Path $ps7HistoryPath) {
        Remove-Item -Path $ps7HistoryPath -Force -ErrorAction SilentlyContinue
        Write-Host "已成功清理 PowerShell 7+ 终端历史命令"
    }
}

# 清理 Windows Terminal 的终端历史命令
$wtProfilePath = Join-Path $env:userprofile ".wt\profiles.json"
if (Test-Path -Path $wtProfilePath) {
    $wtProfiles = Get-Content -Path $wtProfilePath -Raw | ConvertFrom-Json
    foreach ($profile in $wtProfiles.profiles) {
        if ($profile.hidden -ne $true) {
            $historyPath = Join-Path -Path $profile.path -ChildPath "commandlinehistory.txt"
            if (Test-Path -Path $historyPath) {
                Remove-Item -Path $historyPath -Force -ErrorAction SilentlyContinue
                Write-Host "已成功清理 Windows Terminal 终端历史命令 ($($profile.name))"
            }
        }
    }
}

# 清理终端历史命令
Clear-History -ErrorAction SilentlyContinue

# 清理 PowerShell 7 终端历史命令
$ps7HistoryPath = $env:APPDATA + "\PowerShell\PSReadLine\ConsoleHost_history.txt"
if (Test-Path -Path $ps7HistoryPath) {
    Remove-Item -Path $ps7HistoryPath -Force -ErrorAction SilentlyContinue
    Write-Host "已成功清理 PowerShell 7 终端历史命令"
}

Remove-Item (Get-PSReadlineOption).HistorySavePath
echo "" > ~/.bash_history





<#
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
#>



# [获取保存历史命令的文件](https://stackoverflow.com/questions/13257775/powershells-clear-history-doesnt-clear-history)
$historySavePath = (Get-PSReadlineOption).HistorySavePath
# 文件写入空
Set-Content -Path $historySavePath -Value ""
#$null > "$historySavePath"
#"" | Out-File -FilePath $historySavePath

# 删除文件
Remove-Item -Path $historySavePath


# 默认配置文件 https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.3 $PROFILE
# https://hydrotho.github.io/How-To-Create-And-Use-A-PowerShell-Profile/

# 清空回收站
Get-Volume | Where-Object { 
($_.DriveType -eq 'Fixed') -and ($_.DriveLetter -ne $null) } | 
foreach { 
Clear-RecycleBin -Force -DriveLetter $_.DriveLetter 
}

cmd.exe "/c echo y |powershell Clear-RecycleBin"

# https://www.byteinthesky.com/powershell/how-to-empty-recycle-bin/
$driveName = (Get-ChildItem -Path Env:\SystemDrive).Value
Remove-Item -Path $driveName\`$recycle.bin -Recurse -Force


$Shell = New-Object -ComObject Shell.Application
$RecBin = $Shell.Namespace(0xA)
$RecBin.Items() | ForEach-Object { Remove-Item $_.Path -Recurse -Confirm:$false }


# 删除推荐的项目