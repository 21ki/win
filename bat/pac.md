#https://qastack.cn/superuser/419696/in-windows-7-how-to-change-proxy-settings-from-command-line
Windows电脑一般的翻墙软件打开时要自动设置代理，退出时要自动取消代理，这些都是软件自动设置的，而石斑鱼大杀器由于某种原因没有自动设置代理的功能，需要我们手动设置，这样比较麻烦，所以我制作了通过设置命令脚本双击就可以开启或取消代理的方法，很方便。新建一个文本文档也就是记事本，复制下面内容后，把扩展名txt改为cmd就可以了。大家可以在桌面新建一个文件夹，把这4个脚本放到里面，方便使用。

下面是1：打开Internet属性“连接”选项卡，这个老方便了，不用再到控制面板或浏览器里面去找了，而且直接显示第五个选项卡“连接”，只要你再点下面那个“局域网设置”按钮就可以了。从0开始，后面那个4代表第五个选项卡，要看下面几个脚本双击执行后的效果可以双击这个脚本看，很快的。
请复制两条分割线之间内容:
—————开始—————
control.exe inetcpl.cpl,,4
exit
—————结束—————

下面是2：禁用所有代理，这个就是电脑初始的代理设置，4个都不打√而且两个代理地址 栏都是空的，使用完大杀器后上百度等内网之前就要执行这个，有的翻墙软件比如SS和赛风有时退出时不会取消代理，或是程序死机时没有正常退出代理，这个要注意。
请复制两条分割线之间内容:
—————开始—————
@echo off
title 禁用所有代理
taskkill /im javaw.exe /f
reg add “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections” /v DefaultConnectionSettings /t REG_BINARY /d 4600000000 /f
reg delete “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings” /v AutoConfigURL /f
reg add “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings” /v ProxyEnable /t REG_DWORD /d 0 /f
reg delete “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings” /v ProxyServer /f
reg add “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings” /v ProxyOverride /t REG_SZ /d “” /f
exit
—————结束—————

下面是3：启用大杀器代理,看到那个127.0.0.1:3128了吗，大杀器专属哦，可以改成别的！
请复制两条分割线之间内容:
—————开始—————
@echo off
title 启用大杀器代理
reg delete “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings” /v AutoConfigURL /f
reg add “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings” /v ProxyEnable /t REG_DWORD /d 1 /f
reg add “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings” /v ProxyServer /d “127.0.0.1:3128” /f
reg add “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings” /v ProxyOverride /t REG_SZ /d “;localhost;127.*;10.*;192.*;” /f
exit
—————结束—————

下面是4：启用禁闻网PAC代理,PAC代理可以分流的，就是白名单里网站(指推特等外网）用代理，其它不用代理，同时上不影响国内网站速度，但是不稳定也可能经常更新，更多信息请谷歌PAC，那个pac结尾的网址就是禁闻网PAC代理的网址，可以更换的。
—————开始—————
@echo off
title 启用禁闻网PAC代理
reg add “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings” /v AutoConfigURL /d “https://raw.githubusercontent.com/bannedbook/fanqiang/master/jw/new.pac” /f
reg add “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings” /v ProxyEnable /t REG_DWORD /d 0 /f
reg delete “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings” /v ProxyServer /f
reg add “HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings” /v ProxyOverride /t REG_SZ /d “” /f
exit