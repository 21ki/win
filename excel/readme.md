#unix时间戳 execl转换
#转时间
=(x+8*3600)/86400+70*365+19
#转时间戳
=(x-19-70*365)*86400-8*3600
#excel显示毫秒
yyyy/m/d h:mm:ss.000


#话费计算公式
=INT(E5/60-0.01)+1
=IF(K3<=3,0.22,(K3-1)*0.11)
=IF(K2<=0,0,IF(K2<=3,0.22,(K2-1)*0.11))
=IF(K3<=3,180,K3*60)
=IF(--E2<=180,180,CEILING(--E2,60))
话费计算公式


PC      10.10.1.30
1910    172.16.18.13
=ROUNDUP(A1/60,0)计费次数
=ROUNDUP(A2/60,)

#话单公式
=INT(E5/60-0.01)+1
=IF(K3<=3,0.22,(K3-1)*0.11)
IF(K2<=0,0,IF(K2<=3,0.22,(K2-1)*0.11))

#删除一列前两个字符   
#方法:分列
=TRIM(SUBSTITUTE(" "&A4," 10",))
=IF(LEFT(A2,2)="00",RIGHT(A2,LEN(A2)-2),A2)




#列前添加字符         方法:F@   先分列成文本模式之后用"7350"@

替换后2个字符添加7350
=REPLACE(A2,LEN(A2)-1,2,"7350")
替换前两个字符为7350
=REPLACE(A2,1,2,"7350")



#excel调用另一个excel
='C:\Users\Administrator.USER-20141126VR\Desktop\新建文件夹 (2)\[2.xlsx]Sheet1'!B40

#文字和数字在一起时无法正确排列（都需要创建辅助列，然后把辅助列隐藏即可）
方式1
=INT(MID(A1,5,LEN(A1)-5))
方式2
=LEFT(A2,1)&TEXT(RIGHT(A2,LEN(A2)-1),"000")


#月份+1   https://alisonyip.viekee.com/?p=342
=DATE(YEAR(A3),MONTH(A3)+1,DAY(A3))