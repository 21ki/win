shift+f10
diskpart
list disk
select disk 0
clean
convert mbr
create partition primary size = 20480
format fs=ntfs quick
exit
exit

# [win11跳过TPM](https://www.dinghui.org/vmware-esxi-windows-11.html)

# [win优化](https://make-sense.tech/blog)

```shell
# 要点击“现在安装” 按 Shift+F10 呼出命令提示符输入以下命令添加注册表键值。
REG ADD HKLM\SYSTEM\Setup\LabConfig /v BypassTPMCheck /t REG_DWORD /d 1
# windows11 安装一直卡在让我们为你连接到网络怎么办？
oobe\bypassnro
```