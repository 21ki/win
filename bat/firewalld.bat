@echo off
color 0A
echo 打开防火墙...
sc config sharedaccess start= auto > nul
net start sharedaccess > nul
echo 向防火墙添加禁用135,139,445端口tcp规则...
netsh advfirewall firewall add rule name="forbid_tcp_rules" dir=in protocol=tcp localport=135,445,139 action=block
echo 向防火墙添加禁用135,139,445端口udp规则...
netsh advfirewall firewall add rule name="forbid_udp_rules" dir=in protocol=udp localport=135,445,139 action=block
echo 完成
pause