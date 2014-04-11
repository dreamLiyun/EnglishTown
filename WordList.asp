
<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--#include file="./Conn/Conn1.asp"-->
<%
strchapt=request.QueryString("Chapter")

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link rel="stylesheet" href="style/style.css" type="text/css" />
</head>

<body>
<div id="MusicPart" style="display:none">
<EMBED name="BgPlay"  src="<%=strmusic%>" autostart="true" loop="false"   hidden="true" volume=10 ></embed>
<audio autoplay="autoplay"  src="<%=strmusic%>" >
</audio>
</div> 
<center >第《<%=strchapt%>》章</center>
<table align="center" width="80%" rules="rows"     border="0">
<tr class="tableTitle">
<td>序号</td>
<td>单词</td>
<td>音标</td>
<td>释义</td>
<td>发音</td>
</tr>
<%
dim inum
inum=1
Set Rscord=server.CreateObject("ADODB.Recordset")
SQL ="select ID,Word,PhoneticSymbol,Meaning,Pronouinciation from [T_Word] where Chapter="&strchapt&" order by ID ASC"
Rscord.open SQL,conn,1,1
if (Rscord.eof or Rscord.bof) then
%>
<tr class="tableCell">
<td colspan="5">当前没有记录</td>
</tr>
<%
else
do while not Rscord.eof 
%>
<tr class="tableCell">
<td><%=inum%></td>
<td><%=trim(Rscord("Word"))%></td>
<td><%=trim(Rscord("PhoneticSymbol"))%></td>
<td><%=trim(Rscord("Meaning"))%></td>
<td><img  style="cursor:hand;" src="../Image/Voice.png"  onclick="Play('<%=trim(Rscord("Pronouinciation"))%>');" /></td>
</tr>
<%
Rscord.movenext
if Rscord.eof then
exit do
end if
inum=inum+1
loop

end if
Rscord.close
Set Rscord=nothing
%>
</table>
<center ><a href="javascript:history.go(-1);"><返回></a></center>
</body>
</html>
<script type="text/javascript" language="javascript">
function Play(MusicPath)
{

//BgPlay.stop();
//var str = "<embed name='BgPlay'  autostart='true' src='"+ MusicPath +"' volume=10></embed>";
var str= "<audio autoplay='autoplay' src='"+MusicPath+"'></audio>"
document.getElementById("MusicPart").innerHTML = str;

}
</script>