# [系统设置](https://lizardsystems.com/articles/112-windows-run-commands/)
control
# 更改适配器
ncpa.cpl


#参考 https://gist.github.com/675816156/7bcec2bc6f45faa64acdb75acfef6912
```shell
# win查找进程 7890的进程
netstat -aon|findstr "7890"
# 查找进程的程序1376
tasklist|findstr "1376"
# 查找进程所在的目录
wmic process get name,executablepath,processid|findstr 1376
# 终止进程
taskkill /pid 8656 -f
# 进程gui
Process Explorer
```

# color https://www.365seal.com/y/GNVJXyObn3.html
```shell
@echo off
color 2e
echo ___________________________________________________________
echo 设置默认的控制台前景和背景颜色(color)。
echo 指定控制台输出的颜色属性
echo 颜色属性由两个十六进制数字指定 -- 第一个为背景，第二个则为
echo 前景。每个数字可以为以下任何值之一:
echo    0 = 黑色        8 = 灰色
echo    1 = 蓝色        9 = 淡蓝色
echo    2 = 绿色        A = 淡绿色
echo    3 = 湖蓝色      B = 淡浅绿色
echo    4 = 红色        C = 淡红色
echo    5 = 紫色        D = 淡紫色
echo    6 = 黄色        E = 淡黄色
echo    7 = 白色        F = 亮白色
echo 例如: "COLOR fc" 在亮白色上产生亮红色
echo ____________________________________________________________
echo 测试
```

# [bat编码](https://blog.csdn.net/weixin_42681866/article/details/119803156)
```shell
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                bat encoding: 'GBK', script: '''
                chcp 936
                echo '您好世界!'
                nssm stop edu-nginx
                '''
            }
        }
    }
}

```
