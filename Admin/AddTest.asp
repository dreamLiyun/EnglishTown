<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="../Conn/Conn.asp"-->
<!--#include file="../function/function.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>添加测试</title>
<style type="text/css">
<!--
.STYLE1 {color: #000000}
-->
</style>
</head>
<%
dim m_ChapterArry,SQL,num,bexist
bexist=false
SQL="Select * from [T_chapter] order by ID Desc"
Set Rs=Server.CreateObject("ADODB.RecordSet")
Rs.open SQL,conn,1,1
if not Rs.eof or Rs.bof then
num=Record_Count(Rs)
m_ChapterArry=array(num)
for i=0 to num-1
m_ChapterArry(i)=Rs(i)
next
bexist=true
else
bexist=false
end if
Rs.close 
Set Rs=nothing
%>
<body>
<center><b>选择章节：</b><select name="ChapterSel"></select></center>
<div width="80%" align="center" style="background-color:#70FEC9" id="chapdiv">

</div>
<hr width="80%" align="center"  />
<form name="AddTestForm" action="TestDeal.asp" method="post">
<table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" id="testtable">
  <tr bgcolor="#66FFFF">
    <th width="4%" align="center">ID</th>
    <th width="45%" align="center">问题</th>
    <th width="51%" align="center">答案</th>
  </tr>
  <tr>
    <td align="center"><span class="STYLE1">1</span></td>
    <td align="center">
      <input name="Qus1" type="text" id="Qus1" size="50" />    </td>
    <td align="center">
      <input name="Ans1" type="text" id="Ans1" size="50" />    </td>
  </tr>
  <tr>
    <td align="center">2</td>
    <td align="center">
      <input name="Qus2" type="text" id="Qus2" size="50" />    </td>
    <td align="center">
      <input name="Ans2" type="text" id="Ans2" size="50" />    </td>
  </tr>
  <tr>
    <td align="center">3</td>
    <td align="center"><input name="Qus3" type="text" id="Qus3" size="50" /></td>
    <td align="center"><input name="Ans3" type="text" id="Ans3" size="50" /></td>
  </tr>
  <tr>
    <td align="center">4</td>
    <td align="center"><input name="Qus4" type="text" id="Qus4" size="50" /></td>
    <td align="center"><input name="Ans4" type="text" id="Ans4" size="50" /></td>
  </tr>
  <tr>
    <td align="center">5</td>
    <td align="center"><input name="Qus5" type="text" id="Qus5" size="50"/></td>
    <td align="center"><input name="Ans5" type="text" id="Ans5"size="50" /></td>
  </tr>
  <tr>
    <td align="center">6</td>
    <td align="center"><input name="Qus6" type="text" id="Qus6" size="50"/></td>
    <td align="center"><input name="Ans6" type="text" id="Ans6" size="50"/></td>
  </tr>
  <tr>
    <td align="center">7</td>
    <td align="center"><input name="Qus7" type="text" id="Qus7" size="50"/></td>
    <td align="center"><input name="Ans7" type="text" id="Ans7" size="50"/></td>
  </tr>
  <tr>
    <td align="center">8</td>
    <td align="center"><input name="Qus8" type="text" id="Qus8" size="50"/></td>
    <td align="center"><input name="Ans8" type="text" id="Ans8" size="50"/></td>
  </tr>
  <tr>
    <td align="center">9</td>
    <td align="center"><input name="Qus9" type="text" id="Qus9" size="50"/></td>
    <td align="center"><input name="Ans9" type="text" id="Ans9" size="50"/></td>
  </tr>
  <tr>
    <td align="center">10</td>
    <td align="center"><input name="Qus10" type="text" id="Qus10" size="50"/></td>
    <td align="center"><input type="text" name="Ans10" size="50"/></td>
  </tr>
</table><br/>
<center><input name="Submit" type="submit" value="提交"  style="background-color:#FFFFFF; border:0px; margin:0; cursor:hand;" onmouseover="this.style.backgroundColor ='#ADFF2F';" onmouseout="this.style.backgroundColor ='#FFFFFF';" />
</center>
</form>
</body>
</html>
<script type="text/javascript">
<%for ii=0 to num-1%>
var oOption = document.createElement("OPTION");
ChapterSel.options.add(oOption);
oOption.innerText = "<%=m_ChapterArry(ii)%>";
oOption.value = "<%=m_ChapterArry(ii)%>";
<%next%>
str=("<%=bexist%>")
if(str=="False")
document.all.chapdiv.innerHTML="<table align='center' width='80%'><tr align='center'><td>无记录</td></tr></table> "
</script>