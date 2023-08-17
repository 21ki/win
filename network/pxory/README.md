# 查看代理
```shell

netsh.exe winhttp show proxy
netsh winhttp reset proxy
netsh winhttp set proxy proxy-server="socks=localhost:9090" bypass-list="localhost"
netsh winhttp reset proxy
netsh winhttp show advproxy
Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' | findstr ProxyServer



localhost;127.*;10.*;192.*




# https://github.com/therevoman/nate-revo-blog/issues/5
New-Item proxy.json
Set-Content .\proxy.json '{"Proxy": "", "ProxyBypass": "", "AutoconfigUrl": "", "AutoDetect": false}'
Set-Content .\proxy.json '{
        "Proxy":        "192.168.1.33:7890",
        "ProxyBypass":  "localhost;127.*;10.*;192.*;",
        "AutoDetect":   true
}'
Get-Content proxy.json
netsh winhttp set advproxy setting-scope=machine settings-file=proxy.json

127.0.0.1:3128
netsh winhttp show proxy
netsh winhttp show advproxy
```
