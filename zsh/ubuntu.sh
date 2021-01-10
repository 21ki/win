#修改子系统默认路径 https://blog.csdn.net/qq_41233171/article/details/106268552
#下载LxRunOffline
#启用子系统
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
LxRunOffline list
#关闭ubuntu
net stop LxssManager
net start LxssManager

#例如我要把Ubuntu-18.04移动到我新建的文件夹D:\WinLinux下，那么我需要输入
LxRunOffline move -n Ubuntu -d E:\WinLinux

#安装桌面远程工具 VcXsrv   https://my.oschina.net/linuxmeng/blog/4290549
sudo apt-get install -y ubuntu-desktop
sudo apt-get install -y unity
sudo apt-get install -y compizconfig-settings-manager
export DISPLAY=localhost:0
ccsm