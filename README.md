 ## 官方网站：https://v0v.bid 
 ## https://github.com/netnr/kms

```shell
# 20250303更新 https://massgrave.dev/
irm https://get.activated.win | iex


slmgr -skms skms.netnr.eu.org
slmgr -ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr -ato
# https://gist.github.com/default-writer/79521f188a65ecfa404e3689245b293d
# https://gist.github.com/huihut/ebb51ff76c23c1c94fa3e0947ef55963
@echo off
title Activate Microsoft Office 2016 ALL versions for FREE!&cls&echo ============================================================================&echo #Project: Activating Microsoft software products for FREE without software&echo ============================================================================&echo.&echo #Supported products:&echo - Microsoft Office Standard 2016&echo - Microsoft Office Professional Plus 2016&echo.&echo.&(if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16")&(if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16")&(for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)&(for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)&echo.&echo ============================================================================&echo Activating your Office...&cscript //nologo ospp.vbs /unpkey:WFG99 >nul&cscript //nologo ospp.vbs /unpkey:DRTFM >nul&cscript //nologo ospp.vbs /unpkey:BTDRB >nul&cscript //nologo ospp.vbs /unpkey:CPQVG >nul&cscript //nologo ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99 >nul&set i=1
:server
if %i%==1 set KMS_Sev=kms7.MSGuides.com
if %i%==2 set KMS_Sev=kms8.MSGuides.com
if %i%==3 set KMS_Sev=kms9.MSGuides.com
if %i%==4 goto notsupported
cscript //nologo ospp.vbs /sethst:%KMS_Sev% >nul&echo ============================================================================&echo.&echo.
cscript //nologo ospp.vbs /act | find /i "successful" && (echo.&echo ============================================================================&echo.&echo #My official blog: MSGuides.com&echo.&echo #How it works: bit.ly/kms-server&echo.&echo #Please feel free to contact me at msguides.com@gmail.com if you have any questions or concerns.&echo.&echo #Please consider supporting this project: donate.msguides.com&echo #Your support is helping me keep my servers running everyday!&echo.&echo ============================================================================&choice /n /c YN /m "Would you like to visit my blog [Y,N]?" & if errorlevel 2 exit) || (echo The connection to my KMS server failed! Trying to connect to another one... & echo Please wait... & echo. & echo. & set /a i+=1 & goto server)
explorer "http://MSGuides.com"&goto halt
:notsupported
echo.&echo ============================================================================&echo Sorry! Your version is not supported.&echo Please try installing the latest version here: bit.ly/downloadmsp
:halt
pause
```

---

---

### windows系统一句命令激活

#### 打开 命令提示符（管理员） 运行：slmgr /skms kms.v0v.bid && slmgr /ato

---

---

## Linux系统 自建KMS服务器

### 一键安装KMS服务 （Debian/Ubuntu/Mint 等）
```
wget -N --no-check-certificate git.io/k.sh && chmod +x k.sh && bash k.sh debian
```

### 一键安装KMS服务 （CentOS/Redhat/Fedora 等）（如果系统开启了防火墙 须自行开放 1688 端口）
```
wget -N --no-check-certificate git.io/k.sh && chmod +x k.sh && bash k.sh centos
```

### 启动KMS服务
```
bash k.sh start

服务器IP地址既是KMS服务器地址
也可以将域名解析至IP使用（支持IPv6 即AAAA记录）

更多详细教程：https://v0v.bid/kms.html
```

### 关闭KMS服务
```
bash k.sh stop
```

### 添加开机自启动KMS服务
```
bash k.sh auto
```

### 重启KMS服务
```
bash k.sh restart
```

### 查看KMS服务运行状态
```
bash k.sh status
```

### 卸载KMS服务
```
bash k.sh uninstall
```

## Windows系统 自建KMS服务器

### 一键安装KMS服务 （Windows系统 x86/x64）
```
访问下方地址：
https://github.com/Wind4/vlmcsd/releases
下载最新版本 binaries.tar.gz

解压后运行：
\binaries\Windows\intel\vlmcsd-Windows-x64.exe
或者：
\binaries\Windows\intel\vlmcsd-Windows-x86.exe
```

## 安卓手机 自建KMS服务器
```
访问下方地址：
https://v0v.bid/android.html
查看教程
```

## 版权声明：
### 此项目仅为bash一键脚本，脚本内所涉及到的任何软件版权和责任归原作者所有。
```
此项目脚本基于以下开源项目：
https://github.com/Wind4/vlmcsd
https://github.com/ThunderEX/py-kms
https://forums.mydigitallife.net/members/hotbird64.333466/
https://forums.mydigitallife.net/members/pantagruel.5805/
```
https://v0v.bid/?tdsourcetag=s_pcqq_aiomsg
