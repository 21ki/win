#参考 https://gist.github.com/675816156/7bcec2bc6f45faa64acdb75acfef6912
```shell
# win查找进程 7890的进程
netstat -aon|findstr "7890"
# 查找进程的程序1376
tasklist|findstr "1376"
# 查找进程所在的目录
wmic process get name,executablepath,processid|findstr 1376
```