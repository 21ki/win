#查找端口占用
netstat -aon|findstr “8081”
#进程查看
tasklist|findstr "8432"
#win 代理地址填写
http=127.0.0.1:3213;https=127.0.0.1:3213