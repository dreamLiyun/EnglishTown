<%
'arrList   数组 
'x   检索的元素 
Function   IsInArray(arrList,x) 
Dim   flag 
flag   =   false 
for   i=0   to   Ubound(arrList) 
if   arrList(i)=x   then   
flag   =   true 
end   if 
next 
IsInArray   =   flag 
End   Function 



' ============================================
' 格式化时间(显示)
' 参数：n_Flag
' 1:"yyyy-mm-dd hh:mm"
' 2:"yyyy-mm-dd"
' 3:"hh:mm:ss"
' 4:"yyyy年mm月dd日"
' 5:"yyyymmdd"
' 6:"yyyymmddhhmmss"
' ============================================
Function Format_Time(s_Time, n_Flag)
Dim y, m, d, h, mi, s
Format_Time = ""
If IsDate(s_Time) = False Then Exit Function
y = cstr(year(s_Time))
m = cstr(month(s_Time))
If len(m) = 1 Then m = "0" & m
d = cstr(day(s_Time))
If len(d) = 1 Then d = "0" & d
h = cstr(hour(s_Time))
If len(h) = 1 Then h = "0" & h
mi = cstr(minute(s_Time))
If len(mi) = 1 Then mi = "0" & mi
s = cstr(second(s_Time))
If len(s) = 1 Then s = "0" & s
Select Case n_Flag
Case 1
' yyyy-mm-dd hh:mm:ss
Format_Time = y & "/" & m & "/" & d & " " & h & ":" & mi & ":" & s
Case 2
' yyyy-mm-dd
Format_Time = y & "/" & m & "/" & d
Case 3
' hh:mm:ss
Format_Time = h & ":" & mi & ":" & s
Case 4
 'yyyy年mm月dd日
Format_Time = y & "年" & m & "月" & d & "日"
Case 5
' yyyymmdd
Format_Time = y & m & d
case 6
'yyyymmddhhmmss
format_time= y & m & d & h & mi & s
End Select
End Function



'jzh 20110703
'将整数i以n位的形式输出，高位补零，限定整数i为非负整数且最大不超过20位
Function FormatInteger(i,n)
	s=cstr(i)
	if len(s)<i then
		temp="00000000000000000000"
		FormatInteger=left(temp,i-len(s)) & s
	else
		FormatInteger=s
	end if
End Function


''--------------------数字向汉字转换的函数集合 ------------------------
''作者:northsnow 
''日期:20051217
''调用方法: a=convertNumToStr("1234.5678")
''功能: 将这样的串 1234.5678 转换成 一千二百三十四点五六七八 
'
'
'''将一串数字转成对应的汉字
 function convertNumToStr(pNum)
    dim oNum,rValue
    oNum=pNum:rValue=""
   
    '如果给定的不是合理的数字,则返回空串
    if not CheckPattern(oNum,z_PatNum) then
       ConvertNumToStr=rValue
       exit function
    end if  
   
    '将数字前面无用的0去掉
    set rLjc=new RegExp
    rLjc.Pattern="^0{2,}([^.])"
    oNum=rLjc.Replace(oNum,"$1")
    rLjc.Pattern="^0{2,}(\.)"
    oNum=rLjc.Replace(oNum,"0$1")
   
    '将小数点前后部分分开
    arrNum=split(oNum,".")
    frontNum=arrNum(0)
    backNum=""
    if ubound(arrNum)>0 then backNum=arrNum(1)
   
    '----  转换小数点前面的数----
    oLen=len(frontNum)
  
    if oLen=1 then   '只有一位
       rValue=convertNumToCC(frontNum)
    elseif oLen=2 then   '只有两位
       if(mid(frontNum,1,1))<>"1" then  rValue=convertNumToCC(mid(frontNum,1,1))
       rValue=rValue & getDigit(2)
       if(mid(frontNum,2,1))<>"0" then rValue=rValue & convertNumToCC(mid(frontNum,2,1))
    else   '大于两位的情况
       dim curPos,curNum,hasZero
       hasZero=false  '表明在此前有没有相连接的零
       for i=1 to oLen
          curPos=oLen-i + 1
          curNum=mid(frontNum,i,1)
          if cint(curNum)=0 then     '当前位数为零
              hasZero=true
              '当当前位为万位或者亿位,则进行处理
              if (curPos -1) mod 4=0 and curPos>4 then
     rValue=rValue & getDigit(curPos)
     end if
          else   '当前位数不是零
              if hasZero then
               rValue=rValue & "零"
      hasZero=false
     end if
     rValue=rValue & convertNumToCC(curNum) & getDigit(curPos)
          end if
       next 
    end if
   
    '转换小数点后面的
    if backNum<>"" then
       strBack=""
       for i=1 to len(backNum)
          strBack=strBack & convertNumToCC(mid(backNum,i,1))
       next
       rValue=rValue & "点" & strBack
    end if
    convertNumToStr=rValue
 end function
'
'''将一个数字转成对应的汉字
function convertNumToCC(pNum)
select case pNum
case 1:convertNumToCC="一"
case 2:convertNumToCC="二"
case 3:convertNumToCC="三"
case 4:convertNumToCC="四"
case 5:convertNumToCC="五"
case 6:convertNumToCC="六"
case 7:convertNumToCC="七"
case 8:convertNumToCC="八"
case 9:convertNumToCC="九"
case 0:convertNumToCC="零"
end select
end function

''根据位数返回对应的汉字
function getDigit(oDigit)
if (oDigit+2) mod 4=0 then
getDigit="十"
elseif (oDigit+1) mod 4=0 then
getDigit="百"
elseif oDigit mod 4=0 then
getDigit="千"
elseif (oDigit -1) mod 4=0 then
if ((oDigit-1)/4) mod 2=0 then
getDigit="亿"
else
getDigit="万"
end if
end if
end function

function addDatabase(arrList,table,conn)
dim SQL,strList,RsList

for i=0 to UBound(arrList,2)
strList=strList+arrList(0,i)
RsList=RsList+arrList(1,i)
if i<>UBound(arrList,2) then
strList=strList+","
RsList=RsList+"','"
end if
next

'Message strList+RsList+table+conn
SQL = "insert into "&table&"("&strList&") values('"&RsList&"')"

Message SQL
addDatabase = SQL
end function


function Message(str)
response.Write("<script language='javascript'>alert('"&str&"');</script>")
end function

function Record_Count(Res)
dim num
num=0
do while not Res.eof
num=num+1
Res.movenext
loop
Res.movefirst
Record_Count=num
end function
%>

<script language="javascript">


</script>