<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="../Conn/Conn.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="../style/style.css" />
<title>无标题文档</title>
</head>

<body>

<table width="80%" border="0" align="center" >
  <tr align="center" class="tableTitle">
    <td>ID</td>
    <td>章节</td>
    <td>日期</td>
    <td>操作</td>
  </tr>
 <%
 SQL = "Select * from [T_Chapter] order by ID DESC"
 Set Rs=server.CreateObject("ADODB.Recordset")
 Rs.open SQL,conn,2,3
 if Rs.eof or rs.bof then
 %>
  <tr align="center">
    <td colspan="4" align="center">无记录！</td>
  </tr>
  <%else
  dim chapnum
  chapnum=1
  do while not Rs.eof
  %>
  <tr align="center">
    <td><%=chapnum%></td>
    <td>第<%=Rs("Chapter")%>章</td>
    <td><%=Rs("Date")%></td>
    <td><a href="addword.asp?action=update&Chapter=<%=Rs("Chapter")%>" >编辑</a>&nbsp;&nbsp;<a href="chapterDel.asp" >删除</a></td>
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
