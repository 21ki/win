#windows terminal
#仓库安装Scoop   https://www.iamzs.cn/archives/scoop-guidebook.html
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
#自定义安装位置安装
env:SCOOP='D:\Scoop'
[environment]::setEnvironmentVariable('SCOOP',$env:SCOOP,'User')
iwr -useb get.scoop.sh | iex


Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser


if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force } notepad $PROFILE·

Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox

#路径
C:\Users\Kuan\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

#标识乱码
#安装字体  https://github.com/powerline/fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
clean-up a bit
#FiraCode字体  https://github.com/tonsky/FiraCode/releases
#MesloLGS NF   https://github.com/romkatv/powerlevel10k/blob/master/font.md
#中文字体乱码  https://zhuanlan.zhihu.com/p/166407830
vi D:\Program Files\Git\etc\profile.d\git-prompt.sh
    if test -n "WT_SESSION" #Windows Terminal
	then
		PS1='\[\033]0;Git Bash\007\]' # set window title
	else
	    PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
	fi

#修改配置文件  https://blog.csdn.net/ZHJ123CSDN/article/details/106289662
https://www.yuque.com/hellochen/notes/nixzke?language=zh-cn
#配置路径%localappdata%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json

vi C:\Users\Administrator\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
        {
            // Git Bash
            "commandline" : "D:\\Program Files\\Git\\bin\\bash.exe --login -i",
            "guid" : "{9c1ab057-0fcb-414f-bed0-d055321a1bbf}",
            "icon" : "D:\\Program Files\\Git\\mingw64\\share\\git\\git-for-windows.ico",
            "name" : "Git Bash",
            //"startingDirectory" : "%USERPROFILE%", // 启动目录
			"startingDirectory" : "e:\\svn\\githup", // 启动目录
            "fontFace" : "Cascadia Code",
            "acrylicOpacity": 0.9,
            "useAcrylic": true,
            "colorScheme": "One Half Dark",
            "backgroundImage" : "E:\\壁纸\\dm.jpg",
            "backgroundImageOpacity" : 0.3,
            "backgroundImageStretchMode" : "fill",
			"tabTitle" : "Git Bash",
			"foreground" : "#DCDCDC",
				"closeOnExit" : true,
				"cursorColor" : "#FFFFFF",
				"cursorShape" : "bar",
				"fontSize" : 11,
				"historySize" : 9001,
				"padding" : "0, 0, 0, 0",
				"snapOnInput" : true,
				"startingDirectory" : "%USERPROFILE%"
        },
        {
            // Ubuntu
            "guid": "{6f9994f0-4403-5e85-9cce-98e5da3839bb}",
            "hidden": false,
            "name": "Ubuntu",
			//"startingDirectory": "//wsl$/Ubuntu/home/myki/", // 启动目录
			"commandline" : "wsl.exe ~ -d Ubuntu",
			"startingDirectory": ".",
			//"source": "Windows.Terminal.Wsl",
			"icon": "C:\\Program Files\\WindowsApps\\CanonicalGroupLimited.UbuntuonWindows_2004.2020.812.0_x64__79rhkp1fndgsc\\Assets\\Square44x44Logo.altform-unplated_targetsize-48.png",
            "fontFace" : "Cascadia Code",
            "acrylicOpacity": 0.9,
            "useAcrylic": true,
            "colorScheme": "One Half Dark",
            "backgroundImage" : "E:\\壁纸\\dm.jpg",
            "backgroundImageOpacity" : 0.3,
            "backgroundImageStretchMode" : "fill"
        },