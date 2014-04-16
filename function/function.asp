<%
'arrList   ���� 
'x   ������Ԫ�� 
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
' ��ʽ��ʱ��(��ʾ)
' ������n_Flag
' 1:"yyyy-mm-dd hh:mm"
' 2:"yyyy-mm-dd"
' 3:"hh:mm:ss"
' 4:"yyyy��mm��dd��"
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
 'yyyy��mm��dd��
Format_Time = y & "��" & m & "��" & d & "��"
Case 5
' yyyymmdd
Format_Time = y & m & d
case 6
'yyyymmddhhmmss
format_time= y & m & d & h & mi & s
End Select
End Function



'jzh 20110703
'������i��nλ����ʽ�������λ���㣬�޶�����iΪ�Ǹ���������󲻳���20λ
Function FormatInteger(i,n)
	s=cstr(i)
	if len(s)<i then
		temp="00000000000000000000"
		FormatInteger=left(temp,i-len(s)) & s
	else
		FormatInteger=s
	end if
End Function


''--------------------��������ת���ĺ������� ------------------------
''����:northsnow 
''����:20051217
''���÷���: a=convertNumToStr("1234.5678")
''����: �������Ĵ� 1234.5678 ת���� һǧ������ʮ�ĵ������߰� 
'
'
'''��һ������ת�ɶ�Ӧ�ĺ���
 function convertNumToStr(pNum)
    dim oNum,rValue
    oNum=pNum:rValue=""
   
    '��������Ĳ��Ǻ��������,�򷵻ؿմ�
    if not CheckPattern(oNum,z_PatNum) then
       ConvertNumToStr=rValue
       exit function
    end if  
   
    '������ǰ�����õ�0ȥ��
    set rLjc=new RegExp
    rLjc.Pattern="^0{2,}([^.])"
    oNum=rLjc.Replace(oNum,"$1")
    rLjc.Pattern="^0{2,}(\.)"
    oNum=rLjc.Replace(oNum,"0$1")
   
    '��С����ǰ�󲿷ַֿ�
    arrNum=split(oNum,".")
    frontNum=arrNum(0)
    backNum=""
    if ubound(arrNum)>0 then backNum=arrNum(1)
   
    '----  ת��С����ǰ�����----
    oLen=len(frontNum)
  
    if oLen=1 then   'ֻ��һλ
       rValue=convertNumToCC(frontNum)
    elseif oLen=2 then   'ֻ����λ
       if(mid(frontNum,1,1))<>"1" then  rValue=convertNumToCC(mid(frontNum,1,1))
       rValue=rValue & getDigit(2)
       if(mid(frontNum,2,1))<>"0" then rValue=rValue & convertNumToCC(mid(frontNum,2,1))
    else   '������λ�����
       dim curPos,curNum,hasZero
       hasZero=false  '�����ڴ�ǰ��û�������ӵ���
       for i=1 to oLen
          curPos=oLen-i + 1
          curNum=mid(frontNum,i,1)
          if cint(curNum)=0 then     '��ǰλ��Ϊ��
              hasZero=true
              '����ǰλΪ��λ������λ,����д���
              if (curPos -1) mod 4=0 and curPos>4 then
     rValue=rValue & getDigit(curPos)
     end if
          else   '��ǰλ��������
              if hasZero then
               rValue=rValue & "��"
      hasZero=false
     end if
     rValue=rValue & convertNumToCC(curNum) & getDigit(curPos)
          end if
       next 
    end if
   
    'ת��С��������
    if backNum<>"" then
       strBack=""
       for i=1 to len(backNum)
          strBack=strBack & convertNumToCC(mid(backNum,i,1))
       next
       rValue=rValue & "��" & strBack
    end if
    convertNumToStr=rValue
 end function
'
'''��һ������ת�ɶ�Ӧ�ĺ���
function convertNumToCC(pNum)
select case pNum
case 1:convertNumToCC="һ"
case 2:convertNumToCC="��"
case 3:convertNumToCC="��"
case 4:convertNumToCC="��"
case 5:convertNumToCC="��"
case 6:convertNumToCC="��"
case 7:convertNumToCC="��"
case 8:convertNumToCC="��"
case 9:convertNumToCC="��"
case 0:convertNumToCC="��"
end select
end function

''����λ�����ض�Ӧ�ĺ���
function getDigit(oDigit)
if (oDigit+2) mod 4=0 then
getDigit="ʮ"
elseif (oDigit+1) mod 4=0 then
getDigit="��"
elseif oDigit mod 4=0 then
getDigit="ǧ"
elseif (oDigit -1) mod 4=0 then
if ((oDigit-1)/4) mod 2=0 then
getDigit="��"
else
getDigit="��"
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