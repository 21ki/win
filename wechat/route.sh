#永久添加命令
route -p add 0.0.0.0 mask 0.0.0.0 10.10.68.5 metric 5
route -p add 0.0.0.0 mask 0.0.0.0 10.10.68.1 metric 10
#重新获取适配器路由
ipconfig /renew