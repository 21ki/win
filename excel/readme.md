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


#两个表格对比合并需要的数据
=VLOOKUP(D1,A:B,2,0)
https://zhidao.baidu.com/question/1832517278422476700.html


# 计算两列中重复下标  见 wyf吉客云订单导入总表2021.7.21_v2.xls
=COUNTIFS(C$1:C2,C2,$A$1:$A2,$A2)
# 判断如果下标1,则运算后面公式
=IF(COUNTIFS(C$1:C3,C3,$A$1:$A3,$A3)=1,"需要删除得列","")
# 累加如果重复得列对应列之后
SUMIF(A:A,A2,AN:AN)
# 判断如果两列中重复下标1,则累加如果重复得列对应列之后
=IF(COUNTIFS(AA$1:AA2,AA2,$A$1:$A2,$A2)=1,SUMIF(A:A,A2,AN:AN),"")

# 筛选求和
=SUBTOTAL(109,F:F)

# 引用另一个表格
# 1.直接引用
='D:\桌面\src\[天津恒大翡翠华庭欠费期间至12.31日缴费明细(1).xlsx]1'!A1
# 2.HYPERLINK函数
=HYPERLINK('D:\桌面\src\[天津恒大翡翠华庭欠费期间至12.31日缴费明细(1).xlsx]1'!A1)
# 3.LOOKUP函数
=LOOKUP('D:\桌面\src\[天津恒大翡翠华庭欠费期间至12.31日缴费明细(1).xlsx]1'!A1,'D:\桌面\src\[天津恒大翡翠华庭欠费期间至12.31日缴费明细(1).xlsx]1'!A1)
# 4.VLOOKUP函数
=VLOOKUP(A1,'[天津恒大名都项目缴费明细至12.31缴费明细.xlsx]1'!$A$1,2,0)
# 5.引用整个数据表