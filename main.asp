<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="./Conn/Conn1.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<style type="text/css">
.table-a table{border:1px solid #0000FF}
.Title{background-color:#0000FF;
      color:#FFFFFF;
	  font:bold;}
</style>
</head>

<body>

<center ><strong >Ӣ���½��б�</strong></center>
<table width="80%" border="0" align="center"  rules="rows" style="border-color:#0000FF;">

<tr class="Title" align="center">
<td width="10%">���</td>
<td width="45%">�½�����</td>
<td width="45%">��������</td>

<%
 SQL = "Select * from [T_Chapter] order by ID DESC"
 Set Rs=server.CreateObject("ADODB.Recordset")
 Rs.open SQL,conn,2,3
 if Rs.eof or rs.bof then
 %>
  <tr align="center">
    <td colspan="4" align="center">�޼�¼��</td>
  </tr>
  <%else
  dim chapnum
  chapnum=1
  do while not Rs.eof
  %>
  <tr align="center" onclick="ShowWord('<%=Rs("Chapter")%>')">
    <td><%=chapnum%></td>
    <td>��<%=Rs("Chapter")%>��</td>
    <td><%=Rs("Date")%></td>
   </tr>
  <%
  Rs.movenext
  chapnum=chapnum+1
  loop
  end if
  Rs.close
  Set Rs=nothing
  %>

</table>

</body>
</html>
<script language="javascript">
function ShowWord(Chap)
{
self.location.href="Wordlist.asp?Chapter="+Chap;
}
</script>
