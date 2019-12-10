netsh interface portproxy add v4tov4  listenaddress=127.0.0.1 listenport=3213 connectaddress=192.168.10.137 connectport=3213
netsh interface portproxy show all
netsh interface portproxy delete v4tov4 listenaddress=127.0.0.1 listenport=3213




#win 防火墙
netsh advfirewall firewall show rule name=all
netsh advfirewall firewall show rule name="all" | findstr 3389
netsh advfirewall firewall show rule name="all" | findstr ".338."
netsh advfirewall firewall add rule name="Open mongod HTTP monitoring inbound" dir=in action=allow protocol=TCP remoteip=<ip-address> localport=28017
netsh advfirewall firewall add rule name="3389_input" dir=in action=allow protocol=TCP localport=3389
netsh advfirewall firewall delete rule name="3389_input" protocol=tcp localport=3389
#启用防火牆
netsh advfirewall set currentprofile state on
#在例外清單中，加入應用程式
netsh firewall firewall add rule name="允許 hello.exe 連入" dir=in program="c:\alexc\hello.exe" action=allow
#禁止某一个端口
netsh advfirewall firewall add rule name="禁止 UDP 5678 連入" protocol=UDP dir=out localport=5678 action=block